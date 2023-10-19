package kr.ed.haebeop.controller;

import kr.ed.haebeop.domain.Review;
import kr.ed.haebeop.service.ReviewService;
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
@RequestMapping("/review/*")
public class ReviewCtrl {

    @Autowired
    private ReviewService reviewService;

    @Autowired
    HttpSession session;

    @GetMapping("insert.do")
    public String insertForm(HttpServletRequest request, Model model) throws Exception {
        return "/lect/lectGet";
    }

    @PostMapping("insert.do")
    public String reviewInsert(HttpServletRequest request, Model model) throws Exception {
        Review review = new Review();

        review.setMemId(request.getParameter("id"));
        review.setContent(request.getParameter("content"));
        review.setStar(Integer.parseInt(request.getParameter("star")));
        review.setLno(Integer.parseInt(request.getParameter("lno")));

        reviewService.reviewInsert(review);

        return "redirect:/lecture/get.do?lno="+request.getParameter("lno");
    }

    @GetMapping("delete.do")
    public ModelAndView reviewDelete(HttpServletRequest request, Model model) throws Exception {
        String sid = session.getAttribute("sid") != null ? (String) session.getAttribute("sid") : "";

        int rno = Integer.parseInt(request.getParameter("rno"));
        int lno = Integer.parseInt(request.getParameter("lno"));
        reviewService.reviewDelete(rno);
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
