package kr.ed.haebeop.controller;

import com.github.scribejava.core.model.OAuth2AccessToken;
import kr.ed.haebeop.domain.Board;
import kr.ed.haebeop.domain.FileDTO;
import kr.ed.haebeop.domain.Member;
import kr.ed.haebeop.domain.MemberMgn;
import kr.ed.haebeop.domain.Payment;
import kr.ed.haebeop.service.FilesService;
import kr.ed.haebeop.service.MemberMgnService;
import kr.ed.haebeop.service.MemberService;
import kr.ed.haebeop.service.PaymentService;
import kr.ed.haebeop.util.NaverLogin;
import kr.ed.haebeop.util.Page;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/user/")
public class MemberCtrl {

    @Autowired
    private MemberService memberService;

    @Autowired
    private MemberMgnService memberMgnService;

    @Autowired
    HttpSession session;

    @Autowired
    NaverLogin naverLogin;

    @Autowired
    private FilesService filesService;

    @Autowired
    private PaymentService paymentService;

    @GetMapping("term.do")
    public String term(Model model) throws Exception {
        return "/member/joinTerm";
    }

    @GetMapping("join.do")
    public String join(Model model) throws Exception {
        return "/member/join";
    }

    @RequestMapping(value="idCheckPro.do", method=RequestMethod.POST)
    public ResponseEntity idCheck(@RequestBody Member member) throws Exception {
        String id = member.getId();
        boolean result = memberService.idCheck(id);
        return new ResponseEntity<>(result, HttpStatus.OK);
    }

    @PostMapping("joinPro.do")
    public String joinPro(Member member, Model model) throws Exception {
        memberService.insert(member);
        return "redirect:/user/finish.do";
    }

    @GetMapping("finish.do")
    public String joinFinish(Model model) throws Exception {
        return "/member/joinFinish";
    }

    @GetMapping("login.do")
    public String login(HttpServletRequest request, Model model) throws Exception {
        String msg = request.getParameter("msg") != null ? request.getParameter("msg") : "";
        model.addAttribute("msg", msg);
        String naverAuthUrl = naverLogin.getAuthorizationUrl(session);
        model.addAttribute("naver", naverAuthUrl);

        return "/member/login";
    }

    @PostMapping("loginPro.do")
    public String loginPro(@RequestParam String id, @RequestParam String pw, Model model) throws Exception {
        boolean pass = memberService.loginPro(id, pw);
        if (pass) {
            session.setAttribute("sid", id);
            return "redirect:/";
        } else {
            return "redirect:/user/login.do?msg=fail";
        }
    }

    @GetMapping("/logout.do")
    public String logout(Model model) throws Exception {
        session.invalidate();
        return "redirect:/";
    }

    @GetMapping("/fire")
    public String firepoint(HttpServletRequest req, Model model) throws Exception {
        String id = (String) session.getAttribute("sid");
        int pt = 10000;
        Member member = memberService.memberGet(id);
        member.setPt(pt);
        member.setId(id);
        memberService.firepoint(member);
        return "redirect:/firework";
    }

    @GetMapping("/myPage.do")
    public String myPage(Model model) throws Exception {
        String sid = (String) session.getAttribute("sid");
        Member member = memberService.memberGet(sid);
        model.addAttribute("member", member);

        String checkTeacher = "";
        MemberMgn memberMgn = memberMgnService.memberMgnGet(sid);
        if(memberMgn != null){
            if(!memberMgn.isApproveYn()) {
                if(memberMgn.getContent() == null) {
                    checkTeacher = "ing";
                } else {
                    checkTeacher = "fail";
                }
            } else {
                checkTeacher = "finish";
            }
        } else {
            checkTeacher = "noApply";
        }
        model.addAttribute("checkTeacher", checkTeacher);

        return "/member/myPage";
    }

    @GetMapping("/myPageEdit.do")
    public String memberUpdate(Model model) throws Exception {
        String sid = (String) session.getAttribute("sid");
        Member member = memberService.memberGet(sid);
        model.addAttribute("member", member);
        return "/member/myPageEdit";
    }

    @PostMapping("/myPageEdit.do")
    public String memberUpdatePro(Member member, Model model) throws Exception {
        member.setId((String) session.getAttribute("sid"));
        memberService.updateMember(member);
        return "redirect:/user/myPage.do";
    }

    @GetMapping("/removeUser.do")
    public String memberDeletePost(Model model) throws Exception {
        String id = (String) session.getAttribute("sid");
        if(id != "admin") {
            memberService.removeMember(id);
        }
        return "redirect:/user/logout.do";
    }

    @GetMapping("/changePw.do")
    public String memberUpdatePw(Model model) throws Exception {
        String sid = (String) session.getAttribute("sid");
        Member member = memberService.memberGet(sid);
        model.addAttribute("member", member);
        return "/member/myPageEditPw";
    }

    @PostMapping("/changePw.do")
    public String memberUpdatePwPro(HttpServletRequest request, Model model, RedirectAttributes rttr) throws Exception {
        String sid = (String) session.getAttribute("sid");

        String checkPw = request.getParameter("checkPw");
        String pw = request.getParameter("pw");

        boolean pass = false;
        if(sid != "admin") {
            pass = memberService.loginPro(sid, checkPw);
            if(pass) {
                Member member = new Member();
                member.setId(sid);
                member.setPw(pw);
                memberService.updatePw(member);
                rttr.addFlashAttribute("msg", "pwSuccess");
                return "redirect:/user/myPage.do";
            } else {
                rttr.addFlashAttribute("msg", "fail");
                return "redirect:/user/changePw.do";
            }
        } else {
            return "redirect:/user/myPage.do";
        }
    }

    @GetMapping("/changeGrade.do")
    public String memberUpgrade(Model model) throws Exception {
        String sid = (String) session.getAttribute("sid");
        Member member = memberService.memberGet(sid);
        model.addAttribute("member", member);

        String checkTeacher = "";
        MemberMgn memberMgn = memberMgnService.memberMgnGet(sid);
        if(memberMgn != null){
            model.addAttribute("memberMgn", memberMgn);
            if(!memberMgn.isApproveYn()) {
                if(memberMgn.getContent() == null) {
                    checkTeacher = "ing";
                } else {
                    checkTeacher = "fail";
                }
            } else {
                checkTeacher = "finish";
            }
        } else {
            checkTeacher = "noApply";
        }
        model.addAttribute("checkTeacher", checkTeacher);

        return "/member/myPageUpgrade";
    }

    @PostMapping("/changeGrade.do")
    public String memberUpgradePro(HttpServletRequest request, List<MultipartFile> uploadFiles) throws Exception {
        String sid = (String) session.getAttribute("sid");
        String checkTeacher = request.getParameter("checkTeacher") != null ? request.getParameter("checkTeacher") : "'";
        Member member = memberService.memberGet(sid);

        if (sid != null) {

            if(checkTeacher.equals("noApply")) {
                memberMgnService.memberMgnInsert(sid);
            }

            if(checkTeacher.equals("fail")) {
                int par = member.getMno();
                FileDTO files = filesService.fileByParForGrade(par);
                File file = new File(files.getSaveFolder() + File.separator + files.getSaveNm());
                if (file.exists()) { // 해당 파일이 존재하면
                    file.delete(); // 파일 삭제
                    filesService.filesDelete(files.getFno());
                }
            }

            if(uploadFiles != null) {

                ServletContext application = request.getSession().getServletContext();
                //String realPath = application.getRealPath("/resources/upload");                                        // 운영 서버
                String realPath = "D:\\project\\team\\project4\\team44\\src\\main\\webapp\\resources\\upload";	      // 개발 서버

                System.out.println(realPath);

                SimpleDateFormat sdf = new SimpleDateFormat("yyy/MM/dd");
                Date date = new Date();
                String dateFolder = sdf.format(date);

                File uploadPath = new File(realPath, dateFolder);
                if(!uploadPath.exists()) {uploadPath.mkdirs();}

                for(MultipartFile multipartFile : uploadFiles) {
                    if(multipartFile.isEmpty()) {continue;}

                    String originalFilename = multipartFile.getOriginalFilename();
                    UUID uuid = UUID.randomUUID();
                    String uploadFilename = uuid.toString() + "_" + originalFilename;

                    FileDTO fileDTO = new FileDTO();
                    fileDTO.setPar(member.getMno());
                    fileDTO.setSaveFolder(String.valueOf(uploadPath));

                    String fileType = multipartFile.getContentType();
                    String[] fileTypeArr = fileType.split("/");
                    fileDTO.setFileType(fileTypeArr[0]);

                    fileDTO.setOriginNm(originalFilename);
                    fileDTO.setSaveNm(uploadFilename);
                    fileDTO.setToUse("member");

                    multipartFile.transferTo(new File(uploadPath, uploadFilename));     // 서버에 파일 업로드 수행
                    filesService.filesInsert(fileDTO);                                  // DB 등록
                }

            }
        }

        return "redirect:/user/myPage.do";
    }

    /*
    @InitBinder
    protected void initBinder(WebDataBinder binder){
        binder.setValidator(new CheckValidator());
    }

    @PostMapping("idCheck.do")
    public void idCheck(@ModelAttribute @Valid Member member, BindingResult result, HttpServletResponse response, HttpServletRequest request, Model model) throws Exception {
        String id = request.getParameter("id");
        //Member mem = memberService.getMember(id);
        boolean result = false;

        if(!result.hasErrors()) {
            result = true;
        }

        JSONObject json = new JSONObject();
        json.put("result", result);
        PrintWriter out = response.getWriter();
        out.println(json.toString());
    }
    */


    @GetMapping("naver/login")

    public String callbackNaver(Model model, @RequestParam String code, @RequestParam String state, HttpSession session) throws Exception {
        OAuth2AccessToken oauthToken = naverLogin.getAccessToken(session, code, state);
        String apiResult = naverLogin.getUserProfile(oauthToken);

        JSONParser jsonParser = new JSONParser();
        JSONObject jsonObj;

        jsonObj = (JSONObject) jsonParser.parse(apiResult);
        JSONObject response_obj = (JSONObject) jsonObj.get("response");

        String id = (String) response_obj.get("id");
        String email = (String) response_obj.get("email");
        String name = (String) response_obj.get("name");
        String tel = (String) response_obj.get("mobile");
        String birth = (String) response_obj.get("birthyear")+"-"+(String) response_obj.get("birthday");

        System.out.println(birth);


        String sid = name + "_naver";
        session.setAttribute("sid", sid);

        return "redirect:/";

    }
    
    //멤버 payList
    @GetMapping("/paylistMem.do")
    public String paymentMem(HttpServletRequest request, Model model) throws Exception {
        String id = (String) session.getAttribute("sid");

        String type = request.getParameter("type");
        String keyword = request.getParameter("keyword");
        int curPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;

        Page page = new Page();
        page.setSearchType(type);
        page.setSearchKeyword(keyword);
        page.setId(id);
        int total = paymentService.paymentCount(page);

        page.makeBlock(curPage, total);
        page.makeLastPageNum(total);
        page.makePostStart(curPage, total);

        List<Payment> paymentList = paymentService.paymentList_mypage(page);

        model.addAttribute("type", type);
        model.addAttribute("keyword", keyword);
        model.addAttribute("page", page);
        model.addAttribute("curPage", curPage);
        model.addAttribute("paymentList", paymentList);


        return "/member/payList";

    }

    
}