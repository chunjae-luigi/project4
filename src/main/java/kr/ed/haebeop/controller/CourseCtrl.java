package kr.ed.haebeop.controller;

import kr.ed.haebeop.domain.Course;

import kr.ed.haebeop.service.CourseService;

import kr.ed.haebeop.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/course/*")
public class CourseCtrl {
    @Autowired
    private CourseService courseService;

    @GetMapping("courseList")
    public String courseList(HttpServletRequest request, Model model){
        String type = request.getParameter("type");
        String keyword = request.getParameter("keyword");
        
        int curPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;

        Page page = new Page();
        page.setSearchType(type);
        page.setSearchKeyword(keyword);

        int total;
        if(type==null){type="";}
        switch (type){
            case "title":
                total = courseService.courseTitleCount(page);
                break;
            default:
                total = courseService.courseCount();
        }

        page.makeBlock(curPage, total);
        page.makeLastPageNum(total);
        page.makePostStart(curPage, total);


        model.addAttribute("type", type);
        model.addAttribute("keyword", keyword);
        model.addAttribute("page", page);
        model.addAttribute("curPage", curPage);

        List<Course> courseList;
        switch (type){
            case "title":
                courseList = courseService.courseTitleList(page);
                break;
            default:
                courseList = courseService.coursePageList(page);
        }

        model.addAttribute("courseList", courseList);
        return "/course/courseList";
    };

    @GetMapping("courseGet")
    public String courseGet(HttpServletRequest request, Model model) throws Exception{
        int courseNo = Integer.parseInt(request.getParameter("no"));
        Course course = courseService.courseGet(courseNo);
        model.addAttribute("course", course);

        return "/course/courseGet";
    }
}
