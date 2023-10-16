package kr.ed.haebeop.controller;

import kr.ed.haebeop.domain.Course;
import kr.ed.haebeop.domain.CourseList;
import kr.ed.haebeop.domain.Storage;
import kr.ed.haebeop.domain.Teacher;
import kr.ed.haebeop.service.CourseService;
import kr.ed.haebeop.service.StorageService;
import kr.ed.haebeop.service.TeacherService;
import kr.ed.haebeop.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/register/*")
public class RegisterCtrl {
    @Autowired
    private CourseService courseService;

    @Autowired
    private TeacherService teacherService;

    @Autowired
    private StorageService storageService;

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

        List<Course> courses;
        switch (type){
            case "title":
                courses = courseService.courseTitleList(page);
                break;
            default:
                courses = courseService.coursePageList(page);
        }


        List<CourseList> courseList = new ArrayList<>();
        for(Course c: courses){
            CourseList cl = new CourseList();
            cl.setCourse(c);

            Teacher t = teacherService.teacherGet(c.getTeacherNo());
            cl.setTeacher(t);

            Storage s = storageService.storageGet(t.getImageFile());
            cl.setStorage(s);

            courseList.add(cl);
        }

        model.addAttribute("courseList", courseList);
        return "/courseRegister/courseList";
    };

    @GetMapping("courseGet")
    public String courseGet(HttpServletRequest request, Model model) throws Exception{
        int courseNo = Integer.parseInt(request.getParameter("courseNo"));

        CourseList course = new CourseList();
        Course c = courseService.courseGet(courseNo);
        course.setCourse(c);
        Teacher t = teacherService.teacherGet(c.getTeacherNo());
        course.setTeacher(t);
        Storage s = storageService.storageGet(t.getImageFile());
        course.setStorage(s);


        model.addAttribute("course", course);

        return "/courseRegister/courseGet";
    }
}
