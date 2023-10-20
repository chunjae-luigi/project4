package kr.ed.haebeop.domain;

import kr.ed.haebeop.service.ChatService;
import lombok.Builder;
import lombok.Data;
import org.springframework.web.socket.WebSocketSession;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Data
public class ChatRoom {
    private String roomId; // 채팅방 아이디
    private String name; // 채팅방 이름

    @Builder
    public ChatRoom(String roomId, String name){
        this.roomId = roomId;
        this.name = name;
    }
}
