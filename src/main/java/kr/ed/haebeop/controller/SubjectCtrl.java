package kr.ed.haebeop.controller;

import kr.ed.haebeop.domain.Subject;
import kr.ed.haebeop.service.SubjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/subject/*")
public class SubjectCtrl {

    @Autowired
    private SubjectService subjectService;

    @Autowired
    HttpSession session;

    @GetMapping("insert.do")
    public String insertForm(HttpServletRequest request, Model model) throws Exception {
        return "/admin/lectDetail";
    }

    @PostMapping("insert.do")
    public String subjectInsert(HttpServletRequest request, Model model) throws Exception {
        Subject subject = new Subject();
        subject.setTitle(request.getParameter("title"));

        subjectService.subjectInsert(subject);
        return "redirect:/admin/lectDetail.do?fno="+request.getParameter("par");
    }

    @GetMapping("delete.do")
    public ModelAndView subjectDelete(HttpServletRequest request, Model model) throws Exception {
        int sno = Integer.parseInt(request.getParameter("sno"));
        subjectService.subjectDelete(sno);

        ModelAndView mav = new ModelAndView();

        return mav;
    }
}
