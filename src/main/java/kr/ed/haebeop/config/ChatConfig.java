package kr.ed.haebeop.config;
import kr.ed.haebeop.util.WebSocketChatHandler;
import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;

@Configuration
@EnableWebSocket
@RequiredArgsConstructor
public class ChatConfig implements WebSocketConfigurer {

    // WebSocketHandler 에 관한 생성자 추가
    private final WebSocketChatHandler webSocketHandler;

    @Override
    public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
        // endpoint 설정 : /chat
        // 이를 통해서 ws://localhost:8084/ws/chat 으로 요청이 들어오면 websocket 통신을 진행한다.
        registry.addHandler(webSocketHandler, "/ws/chat").setAllowedOrigins("*");
    }

    /* SockJS()를 활용하는 경우는 .withSockJS() 추가
    //setAllowedOrigins("*")에서 *라는 와일드 카드를 사용하면
    //보안상의 문제로 전체를 허용하는 것보다 직접 하나씩 지정해주어야 한다고 한다.
    @Override
    public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
        registry.addHandler(webSocketHandler, "/ws/chat")
                .setAllowedOrigins("http://localhost:8084")
                .withSockJS();
    }
    */
}
