package kr.ed.haebeop.config;

import kr.ed.haebeop.util.AdminInterceptor;
import kr.ed.haebeop.util.UserInterceptor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.*;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;

@Configuration
@EnableWebMvc
@ComponentScan(basePackages = "kr.ed.haebeop")
public class ServletContext implements WebMvcConfigurer {

    @Override
    public void configureViewResolvers(ViewResolverRegistry registry) {
        InternalResourceViewResolver bean = new InternalResourceViewResolver();
        bean.setViewClass(JstlView.class);
        bean.setPrefix("/WEB-INF/views/");
        bean.setSuffix(".jsp");
        registry.viewResolver(bean);
    }

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/resources/**").addResourceLocations("/resources/");
        registry.addResourceHandler("/academy/**").addResourceLocations("/WEB-INF/views/academy");
        registry.addResourceHandler("/admin/**").addResourceLocations("/WEB-INF/views/admin");
        registry.addResourceHandler("/board/**").addResourceLocations("/WEB-INF/views/board");
        registry.addResourceHandler("/chat/**").addResourceLocations("/WEB-INF/views/chat");
        registry.addResourceHandler("/member/**").addResourceLocations("/WEB-INF/views/member");
        registry.addResourceHandler("/common/**").addResourceLocations("/WEB-INF/views/common");
        registry.addResourceHandler("/lecture/**").addResourceLocations("/WEB-INF/views/lecture");
        registry.addResourceHandler("/payment/**").addResourceLocations("/WEB-INF/views/payment");
    }

    @Bean
    public AdminInterceptor adminInterceptor() {return new AdminInterceptor();}

    @Bean
    public UserInterceptor userInterceptor() {return new UserInterceptor();}

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(adminInterceptor());
        registry.addInterceptor(userInterceptor());
    }
}