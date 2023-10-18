package kr.ed.haebeop.controller;

import kr.ed.haebeop.domain.ChatDTO;
import kr.ed.haebeop.domain.ChatRoom;
import kr.ed.haebeop.service.ChatService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

import org.springframework.context.event.EventListener;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.simp.SimpMessageHeaderAccessor;
import org.springframework.messaging.simp.SimpMessageSendingOperations;
import org.springframework.messaging.simp.stomp.StompHeaderAccessor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.socket.messaging.SessionDisconnectEvent;

import java.util.List;

@Controller
@Slf4j
@RequiredArgsConstructor
@RequestMapping("/chat/*")
public class ChatCtrl {

    // ChatRepository Bean 가져오기
    private final ChatService chatService;

    // 아래에서 사용되는 convertAndSend 를 사용하기 위해서 서언
    // convertAndSend 는 객체를 인자로 넘겨주면 자동으로 Message 객체로 변환 후 도착지로 전송한다.
    private final SimpMessageSendingOperations template;

    // 채팅 리스트 확인
    // "/" 로 요청이 들어오면 전체 채팅방 리스트를 담아서 return
    @GetMapping("/")
    public String ChatRoomList(Model model){

        model.addAttribute("chatRooms", chatService.findAllRoom());
        log.info("Show All CharList : {}",chatService.findAllRoom());

        return "/chat/chat";
    }

    // 채팅방 생성 (리스트로 리다이렉트)
    @PostMapping("createRoom")
    @ResponseBody
    public ChatRoom createRoom(@RequestParam String roomName, RedirectAttributes rttr){

        ChatRoom chatRoom = chatService.createChatRoom(roomName);
        log.info("Create ChatRoom : {}",chatRoom);

        rttr.addFlashAttribute("roomName" , chatRoom);

        return chatRoom;
    }

    // 채팅방 입장 화면
    // 파라미터로 넘어오는 roomId를 확인 후 해당 roomId 를 기준으로
    // 채팅방을 찾아서 클라이언트를 chatroom 으로 보낸다.
    @GetMapping("joinRoom")
    @ResponseBody
    public ChatRoom joinRoom(String roomId, Model model){

        log.info("roomId : {}",roomId);
        ChatRoom chatRoom = chatService.findByRoomId(roomId);
        model.addAttribute("room", chatRoom);

        return chatRoom;
    }

    // MessageMapping 을 통해 websocket 으로 들어오는 메시지를 발신 처리합니다.
    // 이 때 클라이언트에서는 /pub/chat/message 로 요청을 하게 되고 이것을 controller 가 받아서 처리합니다.
    // 처리가 완료되면 /sub/chat/room/roomId 로 메시지가 전송됩니다.
    @MessageMapping("enterUser")
    public void enterUser(@Payload ChatDTO chat, SimpMessageHeaderAccessor headerAccessor){

        //채팅방 유저 +1;
        chatService.increaseUser(chat.getRoomId());

        //채팅방에 유저 추가 및 UserUUID 반환
        String userUUID = chatService.addUser(chat.getRoomId(), chat.getSender());

        //반환 결과를 socket session 에 userUUID 로 저장
        headerAccessor.getSessionAttributes().put("userUUID",userUUID);
        headerAccessor.getSessionAttributes().put("roomId",chat.getRoomId());

        chat.setMessage(chat.getSender() + "님이 입장하셨습니다.");
        template.convertAndSend("/sub/chat/room/"+chat.getRoomId(),chat);
    }

    //해당유저
    @MessageMapping("sendMessage")
    public void sendMessage(@Payload ChatDTO chat){

        log.info("chat : {}",chat);
        chat.setMessage(chat.getMessage());
        template.convertAndSend("/sub/chat/room/"+chat.getRoomId(),chat);
    }

    //유저 퇴장 시에는 EventListener 를 통해서 유저 퇴장을 확인
    @EventListener
    public void webSocketDisconnectListener(SessionDisconnectEvent event){

        log.info("DisconnectEvent : {}",event);

        StompHeaderAccessor headerAccessor = StompHeaderAccessor.wrap(event.getMessage());

        // stomp 세션에 있던 uuid 와 roomId 를 확인하여 채팅방 유저 리스트와 room에서 해당 유저를 삭제
        String userUUID = (String) headerAccessor.getSessionAttributes().get("userUUID");
        String roomId = (String) headerAccessor.getSessionAttributes().get("roomId");

        log.info("headAccessor : {}",headerAccessor);

        // 채팅방 유저 -1
        chatService.decreaseUser(roomId);

        //채팅방 유저 리스트에서 UUID 유저 닉네임 조회 및 리스트에서 유저 삭제
        String userName = chatService.getUserName(roomId, userUUID);
        chatService.deleteUser(roomId,userUUID);

        if(userName != null){
            log.info("User Disconnected : " + userName);

            ChatDTO chat = ChatDTO.builder()
                    .type(ChatDTO.MessageType.LEAVE)
                    .sender(userName)
                    .message(userName + "님이 퇴장하였습니다.")
                    .build();

            template.convertAndSend("/sub/chat/room/" + roomId,chat);
        }
    }

    // 채팅에 참여한 유저 리스트 반환
    @GetMapping("uselist")
    @ResponseBody
    public List<String> userList(String roomId){

        return chatService.getUserList(roomId);
    }

    // 채팅에 참여한 유저 닉네임 중복 확인
    @GetMapping("duplicateName")
    @ResponseBody
    public String isDuplicateName(@RequestParam("roomId")String roomId ,
                                  @RequestParam("username")String username){

        String userName = chatService.isDuplicateName(roomId, username);
        log.info("DuplicateName : {}", userName);

        return userName;
    }
}