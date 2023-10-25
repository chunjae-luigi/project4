package kr.ed.haebeop.controller;

import kr.ed.haebeop.domain.ChatRoom;
import kr.ed.haebeop.service.ChatService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@Slf4j
@RequiredArgsConstructor
@RequestMapping("/chat/")
public class ChatRoomCtrl {

    private final ChatService service;

    @GetMapping("home")
    public String loadHome(Model model, HttpServletRequest request){
        List<ChatRoom> chatRooms = service.findAllRoom();

        model.addAttribute("chatRooms", chatRooms);
        return "/chat/chat";
    }

    @PostMapping("createRoom")
    @ResponseBody
    public ChatRoom createRoom(@RequestParam String name){
        return service.createRoom(name);
    }


    ///////////////////////////////////////////////////////////////////////////
    @GetMapping("userChat")
    public String userChat(Model model) {
        List<ChatRoom> chatRooms = service.findAllUserRoom();

        model.addAttribute("chatRooms", chatRooms);
        return "/chat/userChat";
    }

    @PostMapping("createUserRoom")
    @ResponseBody
    public ChatRoom createUserRoom(@RequestParam String name){
        if(!service.canCreateUserRoom(name)) {
            return null;
        }

        return service.createUserRoom(name);
    }

    @GetMapping("joinUserRoom")
    @ResponseBody
    public ChatRoom joinUserRoom(@RequestParam String name){
        ChatRoom nowroom = service.joinUserRoom(name);
        if(nowroom==null){
            return null;
        }
        return nowroom;
    }

    @GetMapping("leaveUserRoom")
    @ResponseBody
    public void leaveUserRoom(String name){
        service.leaveUserRoom(name);
    }
}