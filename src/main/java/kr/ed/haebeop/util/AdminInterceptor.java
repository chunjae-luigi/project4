package kr.ed.haebeop.util;

import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;

public class AdminInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HttpSession session = request.getSession();
        String sid = (String) session.getAttribute("sid");

        if(sid!=null && sid.equals("admin")){
            return true;
        }
        PrintWriter out = response.getWriter();
        out.println("<script>history.go(-1);</script>");
        return false;
    }
}
