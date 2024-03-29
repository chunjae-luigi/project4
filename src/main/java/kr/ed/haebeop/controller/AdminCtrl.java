package kr.ed.haebeop.controller;

import kr.ed.haebeop.domain.*;
import kr.ed.haebeop.service.*;
import kr.ed.haebeop.util.LecturePage;
import kr.ed.haebeop.util.Page;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
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
@Slf4j
@RequiredArgsConstructor
@RequestMapping("/admin")
public class AdminCtrl {

    @Autowired
    HttpSession session;

    @Autowired
    private MemberService memberService;

    @Autowired
    private MemberMgnService memberMgnService;

    @Autowired
    private BoardMgnService boardMgnService;

    @Autowired
    private BoardService boardService;

    @Autowired
    private FilesService filesService;

    @Autowired
    private CommentService commentService;

    @Autowired
    private LectureService lectureService;

    @Autowired
    private CurriService curriService;

    @Autowired
    private SubjectService subjectService;

    @Autowired
    private PaymentService paymentService;

    private final ChatService chatService;

    @GetMapping("/")
    public String home(Model model) throws Exception {
        return "redirect:/admin/memberConf.do";
    }

    @GetMapping("/memberConf.do")
    public String memberList(HttpServletRequest request, Model model) throws Exception {
        String type = request.getParameter("type");
        String keyword = request.getParameter("keyword");
        int curPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;

        Page page = new Page();
        page.setSearchType(type);
        page.setSearchKeyword(keyword);
        int total = memberService.memberCount(page);
        page.makeBlock(curPage, total);
        page.makeLastPageNum(total);
        page.makePostStart(curPage, total);

        model.addAttribute("type", type);
        model.addAttribute("keyword", keyword);
        model.addAttribute("page", page);
        model.addAttribute("curPage", curPage);

        List<Member> memberList = memberService.memberList(page);
        model.addAttribute("memberList", memberList);

        return "/admin/memberList";
    }

    @GetMapping("/memberMgnConf.do")
    public String memberMgnList(HttpServletRequest request, Model model) throws Exception {
        String type = request.getParameter("type") != null ? request.getParameter("type") : "";
        String keyword = request.getParameter("keyword") != null ? request.getParameter("keyword") : "";
        int curPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;

        int total = memberMgnService.memberMgnCount();

        Page page = new Page();
        page.setSearchType(type);
        page.setSearchKeyword(keyword);
        page.makeBlock(curPage, total);
        page.makeLastPageNum(total);
        page.makePostStart(curPage, total);

        model.addAttribute("type", type);
        model.addAttribute("keyword", keyword);
        model.addAttribute("page", page);
        model.addAttribute("curPage", curPage);

        List<MemberMgnVO> memberMgnList = memberMgnService.memberMgnList(page);
        for(MemberMgnVO member : memberMgnList) {
            Member mem = memberService.memberGet(member.getAuthor());
            FileDTO fileDTO = filesService.fileByParForGrade(mem.getMno());
            if(fileDTO != null) {
                member.setFno(fileDTO.getFno());
            }
        }
        model.addAttribute("memberMgnList", memberMgnList);

        return "/admin/memberApprove";
    }

    @GetMapping("/boardMgnConf.do")
    public String boardMgnList(HttpServletRequest request, Model model) throws Exception {
        int curPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;

        Page page = new Page();
        int total = boardMgnService.countBoardMgn(page);
        page.makeBlock(curPage, total);
        page.makeLastPageNum(total);
        page.makePostStart(curPage, total);

        model.addAttribute("page", page);
        model.addAttribute("curPage", curPage);

        List<BoardMgn> boardMgnList = boardMgnService.listBoardMgn(page);
        model.addAttribute("boardMgnList", boardMgnList);


        return "/admin/boardTypeList";
    }

    @GetMapping("/getBoardMgn.do")
    public String boardMgnGet(HttpServletRequest request, Model model) throws Exception {
        int bmNo = Integer.parseInt(request.getParameter("no"));

        BoardMgn boardMgn = boardMgnService.getBoardMgn(bmNo);
        model.addAttribute("boardMgn", boardMgn);

            return "/admin/boardTypeGet";
    }

    @GetMapping("/boardMgnAdd.do")
    public String boardMgnAdd(Model model) throws Exception {

        return "/admin/boardTypeAdd";
    }

    @PostMapping("/boardMgnAdd.do")
    public String boardMgnAddPro(BoardMgn boardMgn, Model model) throws Exception {
        boardMgnService.boardMgnInsert(boardMgn);

        return "redirect:/admin/boardMgnConf.do";
    }

    @GetMapping("/boardMgnModify.do")
    public String boardMgnModify(HttpServletRequest request, Model model) throws Exception {
        int bmNo = Integer.parseInt(request.getParameter("no"));

        BoardMgn boardMgn = boardMgnService.getBoardMgn(bmNo);
        model.addAttribute("boardMgn", boardMgn);

        return "/admin/boardTypeUpdate";
    }

    @PostMapping("/boardMgnModify.do")
    public String boardMgnModifyPro(BoardMgn boardMgn, Model model) throws Exception {

        int par = boardMgn.getPar();

        boardMgnService.boardMgnUpdate(boardMgn);

        return "redirect:/admin/getBoardMgn.do?no="+boardMgn.getBmNo();
    }

    @GetMapping("/boardMgnDel.do")
    public String boardMgnDeletePro(HttpServletRequest request, Model model) throws Exception {
        int bmNo = Integer.parseInt(request.getParameter("no"));

        List<BoardVO> boardList = boardService.boardListForAdmin(bmNo);

        for (BoardVO board : boardList) {
            int bno = board.getBno();

            FileDTO fileDTO = new FileDTO();
            fileDTO.setPar(bno);
            fileDTO.setToUse("board");
            List<FileDTO> fileList = filesService.fileListByPar(fileDTO);
            for(FileDTO files : fileList) {
                File file = new File(files.getSaveFolder() + File.separator + files.getSaveNm());
                if (file.exists()) {
                    file.delete();
                    filesService.filesDeleteAll(bno);
                }
            }
            commentService.commentDeleteAll(bno);
            boardService.boardDelete(bno);
        }

        boardMgnService.boardMgnDelete(bmNo);

        return "redirect:/admin/boardMgnConf.do";
    }

    @GetMapping("/lectList.do")
    public String lectviewList(HttpServletRequest request, Model model) throws Exception{
        String type = request.getParameter("type");
        String keyword = request.getParameter("keyword");
        int curPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;

        LecturePage page = new LecturePage();
        page.setSearchType(type);
        page.setSearchKeyword(keyword);
        int total = lectureService.lectviewCount(page);

        page.makeBlock(curPage, total);
        page.makeLastPageNum(total);
        page.makePostStart(curPage, total);

        model.addAttribute("type", type);
        model.addAttribute("keyword", keyword);
        model.addAttribute("page", page);
        model.addAttribute("curPage", curPage);

        List<LectureVO> lectviewList = lectureService.lectviewList(page);
        model.addAttribute("lectviewList", lectviewList);
        for(LectureVO ldd : lectviewList) {
            System.out.println(ldd.toString());
        }
        return "/admin/lectList";
    }

    @GetMapping("/lectAdd.do")
    public String lectureAdd(Model model) throws Exception {
        return "/admin/lectAdd";
    }

    @PostMapping("lectAdd.do")
    public String lectureInsertpro(HttpServletRequest request, Model model, MultipartFile thumbnail, MultipartFile lvideo, MultipartFile bthumbnail) throws Exception{
        String msg = "";

        ServletContext application = request.getSession().getServletContext();
        String realPath = application.getRealPath("/resources/upload/lecture");       // 운영 서버

        Lecture lecture = new Lecture();
        lecture.setTitle(request.getParameter("title"));
        lecture.setSubTitle(request.getParameter("subTitle"));
        lecture.setContent(request.getParameter("content"));
        lecture.setBthumbnail(request.getParameter("thumbnail"));
        lecture.setTeacherId(request.getParameter("teacherId"));
        lecture.setTeacherNm(request.getParameter("teacherNm"));
        lecture.setBookname(request.getParameter("bookname"));
        lecture.setBthumbnail(request.getParameter("bthumbnail"));
        lecture.setLectureType(Integer.parseInt(request.getParameter("lectureType")));
        lecture.setStudentCnt(Integer.parseInt(request.getParameter("studentCnt")));
        lecture.setCost(Integer.parseInt(request.getParameter("cost")));
        lecture.setSno(Integer.parseInt(request.getParameter("sno")));


        if(thumbnail != null) {
            String originalThumbnailname = thumbnail.getOriginalFilename();
            UUID uuid = UUID.randomUUID();
            String uploadThumbnailname = uuid.toString() + "_" + originalThumbnailname;
            thumbnail.transferTo(new File(realPath, uploadThumbnailname));     //파일 등록
            lecture.setThumbnail(uploadThumbnailname);
        }
        if(lvideo != null) {
            String originalFilename = lvideo.getOriginalFilename();
            UUID uuid = UUID.randomUUID();
            String uploadFilename = uuid.toString() + "_" + originalFilename;
            lvideo.transferTo(new File(realPath, uploadFilename));     //파일 등록
            lecture.setLvideo(uploadFilename);
        }
        if(bthumbnail != null) {
            String originalFilename = bthumbnail.getOriginalFilename();
            UUID uuid = UUID.randomUUID();
            String uploadFilename = uuid.toString() + "_" + originalFilename;
            bthumbnail.transferTo(new File(realPath, uploadFilename));     //파일 등록
            lecture.setBthumbnail(uploadFilename);
        }

        lectureService.lectureAdd(lecture);
        return "redirect:/admin/lectList.do";
    }

    @GetMapping("/findTeacher.do")
    public String findTeacher(HttpServletRequest request, Model model) throws Exception {
        String type = request.getParameter("type");
        String keyword = request.getParameter("keyword");
        int curPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;

        Page page = new Page();
        page.setSearchType(type);
        page.setSearchKeyword(keyword);
        int total = memberService.memberTeacherCount(page);

        page.makeBlock(curPage, total);
        page.makeLastPageNum(total);
        page.makePostStart(curPage, total);

        model.addAttribute("type", type);
        model.addAttribute("keyword", keyword);
        model.addAttribute("page", page);
        model.addAttribute("curPage", curPage);

        List<Member> teacherList = memberService.memberTeacherList(page);
        model.addAttribute("teacherList", teacherList);

        return "/admin/findTeacher";
    }

    @GetMapping("/findLecture.do")
    public String findLecture(HttpServletRequest request, Model model) throws Exception {
        String type = request.getParameter("type");
        String keyword = request.getParameter("keyword");
        int curPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;

        LecturePage page = new LecturePage();
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

        return "/admin/findLecture";
    }

    @GetMapping("lectGet.do")
    public String lectureGet(HttpServletRequest request, Model model) throws Exception{
        int lno = Integer.parseInt(request.getParameter("lno"));

        Lecture lecture = lectureService.lectureGet(lno);
        Member teacher = memberService.memberGet(lecture.getTeacherId());
        Subject subject = subjectService.subjectGet(lecture.getSno());
        List<Curri> curriList = curriService.curriList(lno);

        model.addAttribute("curriList", curriList);
        model.addAttribute("subject", subject);
        model.addAttribute("lecture", lecture);
        model.addAttribute("lno", lno);
        model.addAttribute("teacher", teacher);

        return "/admin/lectGet";
    }

    @GetMapping("lectUpdate.do")
    public String lectureUpdate(HttpServletRequest request, Model model) throws Exception{
        int lno = Integer.parseInt(request.getParameter("lno"));
        Lecture lecture = lectureService.lectureGet(lno);
        model.addAttribute("lecture", lecture);
        return "/admin/lectUpdate";
    }

    @PostMapping("lectUpdate.do")
    public String lectureUpdatepro(HttpServletRequest request, Model model, MultipartFile thumbnail, MultipartFile lvideo, MultipartFile bthumbnail) throws Exception{

        int lno = Integer.parseInt(request.getParameter("lno"));

        ServletContext application = request.getSession().getServletContext();
        String realPath = application.getRealPath("/resources/upload");       // 운영 서버

        Lecture lecture = new Lecture();
        lecture.setLno(lno);
        lecture.setTitle(request.getParameter("title"));
        lecture.setSubTitle(request.getParameter("subTitle"));
        lecture.setContent(request.getParameter("content"));
        lecture.setBthumbnail(request.getParameter("thumbnail"));
        lecture.setTeacherId(request.getParameter("teacherId"));
        lecture.setTeacherNm(request.getParameter("teacherNm"));
        lecture.setBookname(request.getParameter("bookname"));
        lecture.setBthumbnail(request.getParameter("bthumbnail"));
        lecture.setLectureType(Integer.parseInt(request.getParameter("lectureType")));
        lecture.setStudentCnt(Integer.parseInt(request.getParameter("studentCnt")));
        lecture.setCost(Integer.parseInt(request.getParameter("cost")));
        lecture.setSno(Integer.parseInt(request.getParameter("sno")));



        if(thumbnail != null) {
            String originalThumbnailname = thumbnail.getOriginalFilename();
            UUID uuid = UUID.randomUUID();
            String uploadThumbnailname = uuid.toString() + "_" + originalThumbnailname;
            thumbnail.transferTo(new File(realPath, uploadThumbnailname));     //파일 등록
            lecture.setThumbnail(uploadThumbnailname);
        }
        if(lvideo != null) {
            String originalFilename = lvideo.getOriginalFilename();
            UUID uuid = UUID.randomUUID();
            String uploadFilename = uuid.toString() + "_" + originalFilename;
            lvideo.transferTo(new File(realPath, uploadFilename));     //파일 등록
            lecture.setLvideo(uploadFilename);
        }
        if(bthumbnail != null) {
            String originalFilename = bthumbnail.getOriginalFilename();
            UUID uuid = UUID.randomUUID();
            String uploadFilename = uuid.toString() + "_" + originalFilename;
            bthumbnail.transferTo(new File(realPath, uploadFilename));     //파일 등록
            lecture.setBthumbnail(uploadFilename);
        }

        lectureService.lectureUpdate(lecture);
        return "redirect:/admin/lectList.do";
    }

    @GetMapping("lectDelete.do")
    public String lectureDelete(HttpServletRequest request, Model model) throws Exception{
        int lno = Integer.parseInt(request.getParameter("lno"));
        lectureService.lectureDelete(lno);
        return "redirect:/admin/lectList.do";
    }


    //관리자페이지 payList
    @GetMapping("/paylistAdmin.do")
    public String payment(HttpServletRequest request, Model model) throws Exception {
        String id = (String) session.getAttribute("sid");

        String type = request.getParameter("type");
        String keyword = request.getParameter("keyword");
        int curPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;

        Page page = new Page();
        page.setSearchType(type);
        page.setSearchKeyword(keyword);
        int total = paymentService.paymentCount(page);

        page.makeBlock(curPage, total);
        page.makeLastPageNum(total);
        page.makePostStart(curPage, total);

        List<Payment> paymentList = paymentService.paymentList_admin(page);
        model.addAttribute("type", type);
        model.addAttribute("keyword", keyword);
        model.addAttribute("page", page);
        model.addAttribute("curPage", curPage);
        model.addAttribute("paymentList", paymentList);


        return "/admin/payList";

    }

    @GetMapping("memberget.do")
    public String memberGet(HttpServletRequest request, Model model) throws Exception {
        String id = (String) request.getParameter("id");
        Member member = memberService.memberGet(id);
        model.addAttribute("member", member);
        return "/admin/memberGet";
    }
}