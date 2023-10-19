package kr.ed.haebeop.controller;

import kr.ed.haebeop.domain.Curri;
import kr.ed.haebeop.service.CurriService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/curri/*")
public class CurriCtrl {

    @Autowired
    private CurriService curriService;

    @Autowired
    HttpSession session;

    @GetMapping("insert.do")
    public String insertForm(HttpServletRequest request, Model model) throws Exception {
        return "/admin/lectDetail";
    }

    @PostMapping("insert.do")
    public String curriInsert(HttpServletRequest request, Model model) throws Exception {
        Curri curri = new Curri();
        curri.setContent(request.getParameter("content"));
        curri.setLno(Integer.parseInt(request.getParameter("lno")));

        curriService.curriInsert(curri);
        return "redirect:/admin/lectDetail.do?lno=" + request.getParameter("lno");

    }

    @GetMapping("delete.do")
    public ModelAndView curriDelete(HttpServletRequest request, Model model) throws Exception {
        String sid = session.getAttribute("sid") != null ? (String) session.getAttribute("sid") : "";

        int rno = Integer.parseInt(request.getParameter("rno"));
        int lno = Integer.parseInt(request.getParameter("lno"));
        curriService.curriDelete(rno);
        model.addAttribute("lno", lno);
        ModelAndView mav = new ModelAndView();

        if(!sid.equals("admin")) {
            mav.setView(new RedirectView(request.getContextPath() + "/lecture/get.do"));
        } else {
            mav.setView(new RedirectView(request.getContextPath() + "/admin/lectGet.do"));
        }
        return mav;
        //String referer = request.getHeader("Referer");      // 요청한 페이지를 기억해서 보냄
        //System.out.println(referer);
        //return "redirect:/" + referer;
//        RedirectView redirectView = new RedirectView();
//        redirectView.setUrl("http://www.naver.com");
//        return redirectView;
    }
}
