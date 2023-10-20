package kr.ed.haebeop.controller;

import kr.ed.haebeop.domain.*;
import kr.ed.haebeop.service.*;
import kr.ed.haebeop.util.BoardPage;
import kr.ed.haebeop.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/payment")
public class PaymentCtrl {

    @Autowired
    HttpSession session;

    @Autowired
    private MemberService memberService;

    @Autowired
    private PaymentService paymentService;

    @Autowired
    private LectureService lectureService;

    //    회원 페이지
    @GetMapping("/rrr.do")
    public String rrr( Model model) throws Exception {

        return "/payment/rrr";

    }
    @GetMapping("payinsert.do")
    public String insertpay(@RequestParam int lno, HttpServletRequest req, Model model )throws Exception{
        String id = (String) session.getAttribute("sid");
        Member mem = memberService.memberGet(id);
        Lecture lecture = lectureService.lectureGet(lno);

        model.addAttribute("mem", mem);
        model.addAttribute("lecture", lecture);

        return "/payment/paymentInsert";
}
    @PostMapping("payinsert.do")
    public String insertpaypro(@ModelAttribute Payment payment,Model model )throws Exception{
        paymentService.insertpayment(payment);
        return "redirect:/payment/list.do";
    }
//    임시 강의목록
    @GetMapping("list.do")
    public String lecture(HttpServletRequest request, Model model )throws Exception{
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

        List<Lecture> lecture = lectureService.lectureList(page);
        model.addAttribute("type", type);
        model.addAttribute("keyword", keyword);
        model.addAttribute("page", page);
        model.addAttribute("curPage", curPage);
        model.addAttribute("lecture", lecture);
        return "/payment/tt";
    }

//    회원 페이지
    @GetMapping("/paylistMember.do")
    public String paymentList(HttpServletRequest request, Model model) throws Exception {
        String id = (String) session.getAttribute("sid");

        List<Payment> paymentList = paymentService.paymentList_Member(id);
        Member member = memberService.memberGet(id);

        model.addAttribute("paymentList", paymentList);
        model.addAttribute("mem", member);
        return "/member/paymentList";

    }

    //관리자페이지
    @GetMapping("/paymentlistAdmin.do")
    public String payment(HttpServletRequest request, Model model) throws Exception {
        HttpSession session = request.getSession();
        String id = (String) session.getAttribute("sid");

        String type = request.getParameter("type");
        String keyword = request.getParameter("keyword");
        int curPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;
        int bmNo = request.getParameter("no") != null ? Integer.parseInt(request.getParameter("no")) : 1;

        Page page = new Page();
        page.setSearchType(type);
        page.setSearchKeyword(keyword);
        int total = paymentService.paymentCount(page);

        page.makeBlock(curPage, total);
        page.makeLastPageNum(total);
        page.makePostStart(curPage, total);

        List<Payment> paymentList = paymentService.paymentpage(page);

        model.addAttribute("type", type);
        model.addAttribute("keyword", keyword);
        model.addAttribute("page", page);
        model.addAttribute("curPage", curPage);
        model.addAttribute("paymentList", paymentList);


        return "/admin/paymentListAdmin";

    }
}