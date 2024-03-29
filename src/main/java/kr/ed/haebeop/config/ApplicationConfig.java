package kr.ed.haebeop.config;

import com.fasterxml.jackson.databind.ObjectMapper;
import kr.ed.haebeop.service.*;
import kr.ed.haebeop.util.AdminInterceptor;
import kr.ed.haebeop.util.NaverLogin;
import kr.ed.haebeop.util.UserInterceptor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

@Configuration
@ComponentScan(basePackages = "kr.ed.haebeop")
public class ApplicationConfig {



    // Chat
    @Bean
    public ObjectMapper mapper() { return new ObjectMapper(); }

    @Bean
    public NaverLogin naverLogin() {return new NaverLogin();}


    // Service
    @Bean
    public BoardService boardService() {return new BoardServiceImpl();}

    @Bean
    public MemberService memberService() {return new MemberServiceImpl();}

    public MemberMgnService memberMgnService() {return new MemberMgnServiceImpl();}

    @Bean
    public BoardMgnService boardMgnService() {return new BoardMgnServiceImpl();}

    @Bean
    public FilesService filesService() {return new FilesServiceImpl();}

    @Bean
    public CommentService commentService() {return new CommentServiceImpl();}

    @Bean
    public LectureService lectureService() {return new LectureServiceImpl();}

    @Bean
    public ReservationService reservationService() {return new ReservationServiceImpl();}

    @Bean
    public UnavailableService unavailableService() {return new UnavailableServiceImpl();}
    @Bean
    public PaymentService paymentService() {return new PaymentServiceImpl();}


}