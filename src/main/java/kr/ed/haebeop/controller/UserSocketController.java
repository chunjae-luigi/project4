package kr.ed.haebeop.controller;


import com.fasterxml.jackson.databind.ObjectMapper;
import kr.ed.haebeop.domain.UserChat;
import org.springframework.stereotype.Controller;

import javax.websocket.*;
import javax.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Controller
@ServerEndpoint(value = "/usersocket")
public class UserSocketController {
    private static final ObjectMapper mapper = new ObjectMapper();
    private static final List<Session> sessionList = new ArrayList<Session>();

    public UserSocketController(){
    }


    @OnOpen  // socket 연결 시
    public void onOpen(Session session) {
        sessionList.add(session);
    }

    @OnMessage
    public void onMessage (String message, Session session) throws IOException {
        // 다른 사람에게 메세지 보내기
        Map<String, List<String>> requetParameter = session.getRequestParameterMap();
        String roomId = requetParameter.get("name").get(0);

        UserChat chat = mapper.readValue(message, UserChat.class);

        if(chat.getSender().equals("admin")){
            // 관리자는 공지인 경우에만 메시지 전송
            if(chat.getType().equals(UserChat.MessageType.NOTICE)){
                sendAllSessionToMessage(message);
            }
        } else {
            sendRoomMessage(message, roomId);
        }
    }

    @OnError
    public void onError(Throwable e, Session session) {
        System.out.println(e.getMessage() + "by session : " + session.getId());
    }

    @OnClose
    public void onClose(Session session) throws IOException {
        sessionList.remove(session);
    }

    private void sendAllSessionToMessage(String msg){ // 연결된 모든 사용자에게 메세지 전달
        try {
            for(Session s : UserSocketController.sessionList){
                s.getBasicRemote().sendText(msg);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void sendRoomMessage(String msg, String roomId){
        try {
            for(Session s : UserSocketController.sessionList){
                Map<String, List<String>> requetParameter = s.getRequestParameterMap();
                String sroomId = requetParameter.get("name").get(0);
                if(sroomId.equals(roomId)){
                    s.getBasicRemote().sendText(msg);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}