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
    private Map<String, ChatRoom> userRooms;

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

        ChatRoom room = new ChatRoom();
        room.setRoomId(roomId);
        room.setName(name);

        chatRooms.put(roomId, room); // 랜덤 아이디와 room 정보를 Map 에 저장
        return room;
    }


    @PostConstruct
    private void makeUserRooms() {
        userRooms = new LinkedHashMap<>();
    }

    public List<ChatRoom> findAllUserRoom(){
        return new ArrayList<>(userRooms.values());
    }

    public boolean canCreateUserRoom(String name){
        if(userRooms.get(name) == null){
            return true;
        }
        return false;
    }

    public ChatRoom createUserRoom(String name) {
        ChatRoom room = new ChatRoom();
        room.setName(name);
        userRooms.put(name, room);
        return room;
    }

    public ChatRoom joinUserRoom(String name){
        if(userRooms.containsKey(name)){
            int count = userRooms.get(name).getCount()+1;
            ChatRoom room = new ChatRoom();
            room.setName(name); room.setCount(count);

            userRooms.put(name, room);
            return userRooms.get(name);
        }

        return null;
    }

    public void leaveUserRoom(String name){
        if(userRooms.containsKey(name)){
            int count = userRooms.get(name).getCount()-1;

            if(count<=0){
                userRooms.remove(name);
            } else{
                ChatRoom room = new ChatRoom();
                room.setName(name); room.setCount(count);

                userRooms.put(name, room);
            }
        }
    }


}
