package kr.ed.haebeop.controller;

import kr.ed.haebeop.domain.Review;
import kr.ed.haebeop.service.ReviewService;
import kr.ed.haebeop.util.badwordfiltering.BadWordFiltering;
import kr.ed.haebeop.util.badwordfiltering.BadWordFiltering;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
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

    @GetMapping("add.do")
    public String insertForm(HttpServletRequest request, Model model) throws Exception {
        return "/lecture/lectGet";
    }

    @PostMapping("add.do")
    public String reviewInsert(HttpServletRequest request, RedirectAttributes rttr, Model model) throws Exception {
        Review review = new Review();

        String content = request.getParameter("content");
        BadWordFiltering filter = new BadWordFiltering();
        Boolean pass = filter.check(content);

            if(pass) {
                content = "♡♡";
                review.setContent(content);
            }else {
                review.setContent(content);
            }
                review.setMemId(request.getParameter("id"));

                review.setStar(Integer.parseInt(request.getParameter("star")));
                review.setLno(Integer.parseInt(request.getParameter("lno")));
                reviewService.reviewAdd(review);

                return "redirect:/user/mypageLecture.do?lno=" + request.getParameter("lno");
        }


    @GetMapping("delete.do")
    public String reviewDelete(HttpServletRequest request, Model model) throws Exception {
        String sid = session.getAttribute("sid") != null ? (String) session.getAttribute("sid") : "";

        int rno = Integer.parseInt(request.getParameter("rno"));
        int lno = Integer.parseInt(request.getParameter("lno"));
        reviewService.reviewDelete(rno);
        model.addAttribute("lno", lno);

        return "redirect:/lecture/lectGet.do?lno=" + lno;
    }
}
