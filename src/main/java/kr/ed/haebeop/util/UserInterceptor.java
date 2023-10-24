package kr.ed.haebeop.util;

import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;

public class UserInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HttpSession session = request.getSession();
        String sid = (String) session.getAttribute("sid");

        String uri = request.getRequestURI().toLowerCase();

        String method = request.getMethod().toLowerCase();

        boolean flag = false;
        if(method.equals("get")){
            if(uri.contains("insert")){
                if(sid==null){
                    flag = true;
                }
            } else if(uri.contains("delete")||uri.contains("update")){
                String id = request.getParameter("author");
                if(!(id.equals(sid) || sid.equals("admin"))){
                    flag = true;
                }
            }

        }

        if(uri.contains("chat")){
            flag = false;
        }


        if(flag){
            PrintWriter out = response.getWriter();
            out.println("<script>history.go(-1);</script>");
            return false;
        }

        return true;
    }
}
