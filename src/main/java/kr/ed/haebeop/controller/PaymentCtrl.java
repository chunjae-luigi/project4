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
        int pass = paymentService.paymentList_Member(id, lno);

        if(0 < pass){

            model.addAttribute("msg", "이미 결제한 강의입니다.");
            model.addAttribute("url", "/lecture/get.do?lno="+ lno);
            return "/layout/alert";
        }else if(id == null){
            model.addAttribute("msg", "로그인이 필요합니다.");
            model.addAttribute("url", "/lecture/get.do?lno="+ lno);
            return "/layout/alert";
        }else{
            model.addAttribute("mem", mem);
            model.addAttribute("lecture", lecture);

            return "/payment/paymentInsert";
        }
    }
    @PostMapping("payinsert.do")
    public String insertpaypro(@ModelAttribute Payment payment, @ModelAttribute Member member, Model model )throws Exception{
        paymentService.insertpayment(payment);
        memberService.firepoint(member);
        return "redirect:/user/paylistMem.do";
    }


}