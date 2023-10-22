/*
package kr.ed.haebeop.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.core.env.Environment;

import java.io.BufferedReader;
import java.io.InputStreamReader;

@Configuration
public class MailConfig {

    private final Environment environment;

    public MailConfig(Environment environment) {
        this.environment = environment;
    }

    @Bean
    public JavaMailSender javaMailSender() {
        JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
        mailSender.setHost(environment.getProperty("mail.host"));
        mailSender.setPort(Integer.parseInt(environment.getProperty("mail.port")));
        mailSender.setUsername(environment.getProperty("mail.username"));
        mailSender.setPassword(environment.getProperty("mail.password"));

        Properties javaMailProperties = new Properties();
        javaMailProperties.put("mail.smtp.auth", environment.getProperty("mail.smtp.auth"));
        javaMailProperties.put("mail.smtp.starttls.enable", environment.getProperty("mail.smtp.starttls.enable"));
        mailSender.setJavaMailProperties(javaMailProperties);


        String name = request.getParameter("name");
        String from = request.getParameter("author");
        String email = request.getParameter("email");
        String tel = request.getParameter("tel");
        String title = request.getParameter("new_title");
        String content = request.getParameter("new_content");

        String to = "757816@naver.com";

        Properties p = new Properties();
        p.put("mail.smtp.host", "smtp.naver.com");
        p.put("mail.smtp.port", "587");
        p.put("mail.smtp.starttls.enable","true");
        p.put("mail.smtp.auth", "true");
        p.put("mail.smtp.debug", "true");
        p.put("mail.smtp.socketFactory.port", "587");
        p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        p.put("mail.smtp.socketFactory.fallback", "false");

        return mailSender;
    }

    public String readFileContents() {
        try {
            BufferedReader reader = new BufferedReader(new InputStreamReader("D:\\email.txt"));
            StringBuilder content = new StringBuilder();
            String line;
            while ((line = reader.readLine()) != null) {
                content.append(line).append("\n");
            }
            return content.toString();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}

<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%-- 1. 필요한 라이브러리 가져오기 --%>
<%@ page import="com.chunjae.util.*" %>
<%@ page import="java.util.*, javax.mail.*, javax.mail.internet.*" %>
<%-- 2. 인코딩 설정 --%>
<%@ include file="../encoding.jsp" %>
<%
    //3. 보내온 이메일 데이터 받기
    String name = request.getParameter("name");
    String id = request.getParameter("author");
    String email = request.getParameter("from");    //보내는 사람 이메일
    //email = "kkt09072@naver.com";
    String tel = request.getParameter("tel");
    String title = request.getParameter("title");
    String content = request.getParameter("content");
    String to = "kkt09072@naver.com";  //받는 사람 이메일

    //4. smtp 설정 -> Properties 활용
    Properties p = new Properties();
    p.put("mail.smtp.host","smtp.naver.com");
    p.put("mail.smtp.port", "465");
    p.put("mail.smtp.starttls.enable", "true");
    p.put("mail.smtp.auth", "true");
    p.put("mail.smtp.debug", "true");
    //Gmail일 경우 아래 내용 추가
    //p.put("mail.smtp.ssl.enable", "false");
    //p.put("mail.smtp.ssl.trust", "smtp.gmail.com");
    //p.put("mail.smtp.user", email);
    p.put("mail.smtp.socketFactory.port", "465");
    p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
    p.put("mail.smtp.socketFactory.fallback", "false");

    //5. 이메일 보내기
    try {
        Authenticator auth = new SMTPAuthenticatior();
        Session ses = Session.getInstance(p, auth);

        ses.setDebug(true);
        MimeMessage msg = new MimeMessage(ses);

        msg.setSubject(title); //  메일 제목 추가

        StringBuffer buffer = new StringBuffer();   //이메일 내용
        buffer.append("보내는 사람 : ");
        buffer.append(name+"\n");
        buffer.append("연락처 : ");
        buffer.append(tel+"\n");
        buffer.append("이메일 : ");
        buffer.append(email+"\n");
        buffer.append("제목 : ");
        buffer.append(title+"\n");
        buffer.append("내용 : ");
        buffer.append(content+"\n");

        Address fromAddr = new InternetAddress(email);  //보내는 사람
        msg.setFrom(fromAddr);

        Address toAddr = new InternetAddress(to);      // 받는 사람
        msg.addRecipient(Message.RecipientType.TO, toAddr);

        /* 받는 사람이 여러 명인 경우
        String[] addrs = {"ksb450424@naver.com","okgunyang@naver.com", "kkt09072@naver.com", "sunglee0517@naver.com"};
        Address[] toAddrs = new InternetAddress[4];
        for(int i=0;i<toAddrs.length;i++){
            toAddrs[i] = new InternetAddress(addrs[i]);
        }
        msg.addRecipients(Message.RecipientType.TO, toAddrs);
        */

        msg.setContent(buffer.toString(), "text/html;charset=UTF-8"); // 메일 내용 추가
                //msg.setText("이메일 내용"); - 메일 내용이 텍스트로만 가능
                Transport.send(msg); // 이메일 전송
                } catch(Exception e){
                e.printStackTrace();
                return;
                } finally {
                response.sendRedirect("/index.jsp");
                }
                %>

*/
