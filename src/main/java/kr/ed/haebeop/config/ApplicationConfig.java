package kr.ed.haebeop.config;

import com.fasterxml.jackson.databind.ObjectMapper;
import kr.ed.haebeop.service.*;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

@Configuration
@ComponentScan(basePackages = {"kr.ed.haebeop.service"})
public class ApplicationConfig {
    @Bean
    public ObjectMapper mapper() { return new ObjectMapper();}

    @Bean
    public CommentService commentservice() {return new CommentServiceImpl();}

    @Bean
    public CourseAttendanceService courseAttendanceservice() {return new CourseAttendanceServiceImpl();}

    @Bean
    public CourseService courseservice() {return new CourseServiceImpl();}

    @Bean
    public CourseMaterialsService courseMaterialsservice() {return new CourseMaterialsServiceImpl();}

    @Bean
    public CourseNoticeService courseNoticeservice() {return new CourseNoticeServiceImpl();}

    @Bean
    public CourseQnaService courseQnaservice() {return new CourseQnaServiceImpl();}

    @Bean
    public FreeService freeservice() {return new FreeServiceImpl();}

    @Bean
    public MemberService memberservice() {return new MemberServiceImpl();}

    @Bean
    public NoticeService noticeservice() {return new NoticeServiceImpl();}

    @Bean
    public RegisterService registerservice() {return new RegisterServiceImpl();}

    @Bean
    public StorageService storageservice() {return new StorageServiceImpl();}

    @Bean
    public TeacherService teacherservice() {return new TeacherServiceImpl();}
}
