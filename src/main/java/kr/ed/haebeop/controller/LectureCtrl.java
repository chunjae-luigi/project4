package kr.ed.haebeop.controller;

import kr.ed.haebeop.domain.*;
import kr.ed.haebeop.service.*;
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

    @Autowired
    private MemberService memberService;

    //회원이 보는 강의 리스트
    @GetMapping("/list.do")
    public String lectureviewList(HttpServletRequest request, Model model) throws Exception{
        String type = request.getParameter("type");
        String keyword = request.getParameter("keyword");
        int curPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;

        Page page = new Page();
        page.setSearchType(type);
        page.setSearchKeyword(keyword);
        int total = lectureService.lectureviewCount(page);

        page.makeBlock(curPage, total);
        page.makeLastPageNum(total);
        page.makePostStart(curPage, total);

        model.addAttribute("type", type);
        model.addAttribute("keyword", keyword);
        model.addAttribute("page", page);
        model.addAttribute("curPage", curPage);

        List<LectureVO> lectureviewList = lectureService.lectureviewList(page);
        model.addAttribute("lectureviewList", lectureviewList);
        for(LectureVO ldd : lectureviewList) {
            System.out.println(ldd.toString());
        }

        return "/lecture/lectList";
    }

    //회원의 강의 상세보기
    @GetMapping("get.do")
    public String lectureUpdate(HttpServletRequest request, Model model) throws Exception{
        int lno = Integer.parseInt(request.getParameter("lno"));

        Lecture lecture = lectureService.lectureGet(lno);
        Member teacher = memberService.memberGet(lecture.getTeacherId());
        Subject subject = subjectService.subjectGet(lecture.getSno());
        List<Review> reviewList = reviewService.reviewList(lno);
        List<Curri> curriList = curriService.curriList(lno);

        model.addAttribute("teacher", teacher);
        model.addAttribute("reviewList", reviewList);
        model.addAttribute("subject", subject);
        model.addAttribute("curriList", curriList);
        model.addAttribute("lecture", lecture);
        model.addAttribute("lno", lno);

        return "/lecture/lectGet";

    }

}
