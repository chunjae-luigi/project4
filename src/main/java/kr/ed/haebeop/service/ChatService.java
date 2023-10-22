package kr.ed.haebeop.service;

import com.fasterxml.jackson.databind.ObjectMapper;
import kr.ed.haebeop.domain.ChatRoom;
import lombok.Data;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import javax.annotation.PostConstruct;
import java.util.*;

@Slf4j
@Data
@Service
public class ChatService {

    private final ObjectMapper mapper;
    private Map<String, ChatRoom> chatRooms;

    @PostConstruct
    private void init() {
        chatRooms = new LinkedHashMap<>();
    }

    public List<ChatRoom> findAllRoom(){
        return new ArrayList<>(chatRooms.values());
    }

    public ChatRoom findRoomById(String roomId){
        return chatRooms.get(roomId);
    }

    public ChatRoom createRoom(String name) {
        String roomId = UUID.randomUUID().toString(); // 랜덤한 방 아이디 생성

        // Builder 를 이용해서 ChatRoom 을 Building
        ChatRoom room = ChatRoom.builder()
                .roomId(roomId)
                .name(name)
                .build();

        chatRooms.put(roomId, room); // 랜덤 아이디와 room 정보를 Map 에 저장
        return room;
    }
}
