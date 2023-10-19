package kr.ed.haebeop.controller;

import kr.ed.haebeop.domain.Curri;
import kr.ed.haebeop.domain.Lecture;
import kr.ed.haebeop.domain.Review;
import kr.ed.haebeop.domain.Subject;
import kr.ed.haebeop.service.CurriService;
import kr.ed.haebeop.service.LectureService;
import kr.ed.haebeop.service.ReviewService;
import kr.ed.haebeop.service.SubjectService;
import kr.ed.haebeop.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/lecture/*")
public class LectureCtrl {

    @Autowired
    HttpSession session;

    @Autowired
    private LectureService lectureService;

    @Autowired
    private ReviewService reviewService;

    @Autowired
    private CurriService curriService;

    @Autowired
    private SubjectService subjectService;

    //회원이 보는 강의 리스트
    @GetMapping("/list.do")
    public String lectureList(HttpServletRequest request, Model model) throws Exception{
        String type = request.getParameter("type");
        String keyword = request.getParameter("keyword");
        int curPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;

        Page page = new Page();
        page.setSearchType(type);
        page.setSearchKeyword(keyword);
        int total = lectureService.lectureCount(page);

        page.makeBlock(curPage, total);
        page.makeLastPageNum(total);
        page.makePostStart(curPage, total);

        model.addAttribute("type", type);
        model.addAttribute("keyword", keyword);
        model.addAttribute("page", page);
        model.addAttribute("curPage", curPage);

        List<Lecture> lectureList = lectureService.lectureList(page);
        model.addAttribute("lectureList", lectureList);

        return "/lect/lectList";
    }

    //회원의 강의 상세보기
    @GetMapping("get.do")
    public String lectureDetail(HttpServletRequest request, Model model) throws Exception{
        int lno = Integer.parseInt(request.getParameter("lno"));

        Lecture dto = lectureService.lectureDetail(lno);

        List<Review> reviewList = reviewService.reviewList(lno);
        List<Curri> curriList = curriService.curriList(lno);
        Subject subject = subjectService.subjectGet(dto.getSno());

        model.addAttribute("reviewList", reviewList);
        model.addAttribute("subject", subject);
        model.addAttribute("curriList", curriList);
        model.addAttribute("lecture", dto);
        model.addAttribute("lno", lno);

        return "/lect/lectGet";

    }

}
