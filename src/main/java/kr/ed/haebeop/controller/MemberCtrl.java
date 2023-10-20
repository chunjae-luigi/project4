package kr.ed.haebeop.controller;

import com.github.scribejava.core.model.OAuth2AccessToken;
import kr.ed.haebeop.domain.Member;
import kr.ed.haebeop.service.MemberService;
import kr.ed.haebeop.util.NaverLogin;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;

@Controller
@RequestMapping("/user/")
public class MemberCtrl {

    @Autowired
    private MemberService memberService;

    @Autowired
    HttpSession session;

    @Autowired
    NaverLogin naverLogin;

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
    public String memberUpdatePost(Member member, Model model) throws Exception {
        member.setId((String) session.getAttribute("sid"));
        memberService.updateMember(member);
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
}