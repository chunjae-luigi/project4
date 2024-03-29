package kr.ed.haebeop.controller;

import kr.ed.haebeop.domain.*;
import kr.ed.haebeop.service.*;
import kr.ed.haebeop.util.BoardPage;
import kr.ed.haebeop.util.badwordfiltering.BadWordFiltering;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/board")
public class BoardCtrl {

    @Autowired
    HttpSession session;

    @Autowired
    private BoardService boardService;

    @Autowired
    private BoardMgnService boardMgnService;

    @Autowired
    private FilesService filesService;

    @Autowired
    private CommentService commentService;

    @Autowired
    private MemberService memberService;

    private final String toUseFileByBoard = "board";

    @GetMapping("/")
    public String main() throws Exception {
        return "redirect:/board/list.do?no=1";
    }

    @GetMapping("/list.do")
    public String boardList(HttpServletRequest request, Model model) throws Exception {
        String sid = (String) session.getAttribute("sid");

        String type = request.getParameter("type");
        String keyword = request.getParameter("keyword");
        int curPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;
        int bmNo = request.getParameter("no") != null ? Integer.parseInt(request.getParameter("no")) : 1;

        BoardPage page = new BoardPage();
        page.setSearchType(type);
        page.setSearchKeyword(keyword);
        page.setBmNo(bmNo);
        int total = boardService.boardCount(page);

        page.makeBlock(curPage, total);
        page.makeLastPageNum(total);
        page.makePostStart(curPage, total);

        model.addAttribute("type", type);
        model.addAttribute("keyword", keyword);
        model.addAttribute("page", page);
        model.addAttribute("curPage", curPage);
        List<BoardVO> boardList = boardService.boardList(page);

        String pathGetUrl = "";
        for(BoardVO boardVO : boardList) {

            pathGetUrl = "/board/get.do?bno=" + boardVO.getBno();
            boardVO.setPathGetUrl(pathGetUrl);
            String authorNm = boardVO.getNm();
            if(!authorNm.equals("관리자")) {
                String nm = authorNm.substring(0, 1);
                for(int i = 0; i < authorNm.length()-2; i++){
                    nm += "*";
                }
                nm += authorNm.substring(authorNm.length() - 1);
                boardVO.setNm(nm);
            }
        }

        model.addAttribute("boardList", boardList);

        BoardMgn boardMgn = boardMgnService.getBoardMgn(bmNo);
        model.addAttribute("boardMgn", boardMgn);

        // 권한 관련 - 등록
        boolean addCheck = false;
        if(sid != null && (boardMgn.getAboutAuth() >= memberService.memberGet(sid).getGrade() || sid.equals("admin"))) {
            addCheck = true;
        }

        model.addAttribute("addCheck", addCheck);

        String pathUrl = "/board/list.do";
        model.addAttribute("pathUrl", pathUrl);

        String pathPageUrl = "/board/list.do?no=" + bmNo;
        model.addAttribute("pathPageUrl", pathPageUrl);

        return "/board/boardList";
    }

    @GetMapping("/add.do")
    public String boardAdd(HttpServletRequest request, Model model) throws Exception {
        String sid = (String) session.getAttribute("sid");
        int bmNo = Integer.parseInt(request.getParameter("no"));

        BoardMgn boardMgn = boardMgnService.getBoardMgn(bmNo);
        model.addAttribute("boardMgn", boardMgn);

        return "/board/boardAdd";
    }

    @PostMapping("/add.do")
    public String boardAddPro(HttpServletRequest request, Board board, Model model, RedirectAttributes rttr, List<MultipartFile> uploadFiles) throws Exception {
        String author = (String) session.getAttribute("sid");
        int bmNo = Integer.parseInt(request.getParameter("no"));
        BoardMgn boardMgn = boardMgnService.getBoardMgn(bmNo);

        BadWordFiltering filter = new BadWordFiltering();
        String title = board.getTitle();
        String content = board.getContent();

        Boolean pass = filter.check(title);
        Boolean pass2 = filter.check(content);

        if(pass || pass2) {
            model.addAttribute("msg", "욕설은 등록할 수 없습니다.");
            if(boardMgn.getDepth() != 1) {
                model.addAttribute("url", "/lecture/boardList.do?no=" + bmNo);
                model.addAttribute("url2", "lno=" + boardMgn.getPar());
            } else {
                model.addAttribute("url", "/board/list.do?no=" + bmNo);
            }
            return "/layout/alert";
        } else {
            board.setTitle(title);
            board.setContent(content);
            board.setAuthor(author);
            board.setBmNo(bmNo);

            int bno = boardService.boardInsert(board);


            if (uploadFiles != null) {
                ServletContext application = request.getSession().getServletContext();
                String realPath = application.getRealPath("/resources/upload");                                        // 운영 서버
                //String realPath = "D:\\project\\team\\project4\\team44\\src\\main\\webapp\\resources\\upload";	      // 개발 서버

                SimpleDateFormat sdf = new SimpleDateFormat("yyy/MM/dd");
                Date date = new Date();
                String dateFolder = sdf.format(date);

                File uploadPath = new File(realPath, dateFolder);
                if (!uploadPath.exists()) {
                    uploadPath.mkdirs();
                }

                for (MultipartFile multipartFile : uploadFiles) {
                    if (multipartFile.isEmpty()) {
                        continue;
                    }

                    String originalFilename = multipartFile.getOriginalFilename();
                    UUID uuid = UUID.randomUUID();
                    String uploadFilename = uuid.toString() + "_" + originalFilename;

                    FileDTO fileDTO = new FileDTO();
                    fileDTO.setPar(bno);
                    fileDTO.setSaveFolder(dateFolder);

                    String fileType = multipartFile.getContentType();
                    String[] fileTypeArr = fileType.split("/");
                    fileDTO.setFileType(fileTypeArr[0]);

                    fileDTO.setOriginNm(originalFilename);
                    fileDTO.setSaveNm(uploadFilename);
                    fileDTO.setToUse("board");

                    multipartFile.transferTo(new File(uploadPath, uploadFilename));     // 서버에 파일 업로드 수행
                    filesService.filesInsert(fileDTO);                                  // DB 등록
                }

            }

            if(boardMgn.getDepth() != 1) {
                return "redirect:/lecture/boardList.do?no=" + bmNo + "&lno=" + boardMgn.getPar();
            } else {
                return "redirect:/board/list.do?no=" + bmNo;
            }

        }
    }


    @GetMapping("/get.do")
    public String boardDetail(HttpServletRequest request, Model model, HttpServletResponse response) throws Exception {
        String sid = session.getAttribute("sid") != null ? (String) session.getAttribute("sid") : "";
        int bno = Integer.parseInt(request.getParameter("bno"));

        Cookie[] cookies = request.getCookies();
        boolean hasCookie = false;
        if (cookies != null) {
            String bcookie = "board"+bno;
            for (Cookie cookie : cookies) {
                if (bcookie.equals(cookie.getName())) {
                    hasCookie = true;
                    break;
                }
            }
            if(!hasCookie){
                Cookie cookie = new Cookie(bcookie, bcookie);
                cookie.setMaxAge(3600); // 초 단위, 1시간

                // 응답 헤더에 쿠키 추가
                response.addCookie(cookie);
            }
        }

        BoardVO board = boardService.boardGet(hasCookie, bno, sid);

        String bNm = board.getNm();

        if(!bNm.equals("관리자")) {
            String nm = bNm.substring(0, 1);
            for(int i = 0; i < bNm.length()-2; i++){
                nm += "*";
            }
            nm += bNm.substring(bNm.length() - 1);
            board.setNm(nm);
        }
        model.addAttribute("board", board);

        // 권한 관련 - 수정
        boolean addCheck = false;
        if(!sid.equals("") && board.getAuthor().equals(sid)) {
            addCheck = true;
        }
        model.addAttribute("addCheck", addCheck);

        FileDTO fileDTO = new FileDTO();
        fileDTO.setPar(board.getBno());
        fileDTO.setToUse(toUseFileByBoard);
        List<FileDTO> fileList = filesService.fileListByPar(fileDTO);
        model.addAttribute("fileList", fileList);

        List<CommentVO> commentList = commentService.commentList(bno);
        for(CommentVO commentVO :commentList) {
            String originNm = commentVO.getNm();
            if(!originNm.equals("관리자")) {
                String nm = originNm.substring(0, 1);
                for(int i = 0; i < originNm.length()-2; i++){
                    nm += "*";
                }
                nm += originNm.substring(originNm.length() - 1);
                commentVO.setNm(nm);
            }
        }
        model.addAttribute("commentList", commentList);

        String pathUrl = "/board/list.do?no=" + board.getBmNo();
        model.addAttribute("pathUrl", pathUrl);

        String pathUpdateUrl = "/board/update.do?bno=" + bno;
        model.addAttribute("pathUpdateUrl", pathUpdateUrl);

        BoardMgn boardMgn = boardMgnService.getBoardMgn(board.getBmNo());
        model.addAttribute("boardMgn", boardMgn);

        return "/board/boardGet";
    }

    @GetMapping("/update.do")
    public String boardUpdate(HttpServletRequest request, Model model) throws Exception {
        String sid = session.getAttribute("sid") != null ? (String) session.getAttribute("sid") : "";
        int bno = Integer.parseInt(request.getParameter("bno"));

        BoardVO board = boardService.boardGet(true, bno, sid);
        model.addAttribute("board", board);

        // 권한 관련 - 수정
        boolean addCheck = false;
        if(sid != null && board.getAuthor().equals(sid)) {
            addCheck = true;
        }
        model.addAttribute("addCheck", addCheck);

        FileDTO fileDTO = new FileDTO();
        fileDTO.setPar(board.getBno());
        fileDTO.setToUse(toUseFileByBoard);

        List<FileDTO> fileList = filesService.fileListByPar(fileDTO);
        model.addAttribute("fileList", fileList);

        String pathUrl = "/board/list.do?no=" + board.getBmNo();
        model.addAttribute("pathUrl", pathUrl);

        return "/board/boardUpdate";
    }

    @PostMapping("/update.do")
    public String boardUpdatePro(HttpServletRequest request, List<MultipartFile> uploadFiles, RedirectAttributes rttr, Model model) throws Exception {
        String sid = session.getAttribute("sid") != null ? (String) session.getAttribute("sid") : "";
        int bno = Integer.parseInt(request.getParameter("bno"));

        BadWordFiltering filter = new BadWordFiltering();
        String title = request.getParameter("title");
        String content = request.getParameter("content");

        Boolean pass = filter.check(title);
        Boolean pass2 = filter.check(content);

        BoardVO boardVO = boardService.boardGetInfo(bno);
        BoardMgn boardMgn = boardMgnService.getBoardMgn(boardVO.getBmNo());

        if(pass || pass2) {
            model.addAttribute("msg", "욕설은 등록할 수 없습니다.");

            if(boardMgn.getDepth() != 1) {
                model.addAttribute("url", "/lecture/boardGet.do?bno=" + bno);
            } else {
                model.addAttribute("url", "/board/get.do?bno=" + bno);
            }

            return "/layout/alert";
        } else {

            Board board = new Board();

            board.setTitle(title);
            board.setContent(content);
            board.setBno(bno);

            boardService.boardUpdate(board);

            if (uploadFiles != null) {
                ServletContext application = request.getSession().getServletContext();
                String realPath = application.getRealPath("/resources/upload");                                        // 운영 서버
                //String realPath = "D:\\project\\team\\project4\\team44\\src\\main\\webapp\\resources\\upload";	      // 개발 서버

                SimpleDateFormat sdf = new SimpleDateFormat("yyy/MM/dd");
                Date date = new Date();
                String dateFolder = sdf.format(date);

                File uploadPath = new File(realPath, dateFolder);
                if (!uploadPath.exists()) {
                    uploadPath.mkdirs();
                }

                for (MultipartFile multipartFile : uploadFiles) {
                    if (multipartFile.isEmpty()) {
                        continue;
                    }

                    String originalFilename = multipartFile.getOriginalFilename();
                    UUID uuid = UUID.randomUUID();
                    String uploadFilename = uuid.toString() + "_" + originalFilename;

                    FileDTO fileDTO = new FileDTO();
                    fileDTO.setPar(bno);
                    fileDTO.setSaveFolder(dateFolder);

                    String fileType = multipartFile.getContentType();
                    String[] fileTypeArr = fileType.split("/");
                    fileDTO.setFileType(fileTypeArr[0]);

                    fileDTO.setOriginNm(originalFilename);
                    fileDTO.setSaveNm(uploadFilename);
                    fileDTO.setToUse("board");

                    multipartFile.transferTo(new File(uploadPath, uploadFilename));     // 서버에 파일 업로드 수행
                    filesService.filesInsert(fileDTO);                                  // DB 등록
                }
            }

            if(boardMgn.getDepth() != 1) {
                return "redirect:/lecture/boardGet.do?bno=" + bno;
            } else {
                return "redirect:/board/get.do?bno=" + bno;
            }
        }
    }

    @GetMapping("/delete.do")
    public String boardDeletePro(HttpServletRequest request, RedirectAttributes rttr) throws Exception {
        String sid = session.getAttribute("sid") != null ? (String) session.getAttribute("sid") : "";
        int bno = Integer.parseInt(request.getParameter("bno"));

        BoardVO boardVO = boardService.boardGet(true, bno, sid);
        int bmNo = boardVO.getBmNo();
        BoardMgn boardMgn = boardMgnService.getBoardMgn(bmNo);
        if(sid.equals(boardVO.getAuthor()) || sid.equals("admin")) {

            FileDTO fileDTO = new FileDTO();
            fileDTO.setPar(bno);
            fileDTO.setToUse(toUseFileByBoard);
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

            if(boardMgn.getDepth() != 1) {
                return "redirect:/lecture/boardList.do?no=" + bmNo + "&lno=" + boardMgn.getPar();
            } else {
                return "redirect:/board/list.do?no=" + bmNo;
            }
        } else {
            rttr.addFlashAttribute("msg", "fail");
            if(boardMgn.getDepth() != 1) {
                return "redirect:/lecture/boardGet.do?bno=" + bno;
            } else {
                return "redirect:/board/get.do?bno=" + bno;
            }
        }
    }

    @PostMapping("commentAdd.do")
    @ResponseBody
    public CommentVO commentInsert(@RequestParam("par") int par, @RequestParam("content") String content, RedirectAttributes rttr, HttpServletRequest request) throws Exception {
        String sid = session.getAttribute("sid") != null ? (String) session.getAttribute("sid") : "";
        Comment comment = new Comment();

        BadWordFiltering filter = new BadWordFiltering();
        Boolean pass = filter.check(content);

        if(pass) {
            content = "♡♡";
            comment.setContent(content);
        }else {
            comment.setContent(content);
        }
        comment.setPar(par);
        comment.setAuthor(sid);

        CommentVO commentVO = commentService.commentInsert(comment);

        String originNm = commentVO.getNm();
        if (!originNm.equals("관리자")) {
            String nm = originNm.substring(0, 1);
            for (int i = 0; i < originNm.length() - 2; i++) {
                nm += "*";
            }
            nm += originNm.substring(originNm.length() - 1);
            commentVO.setNm(nm);
        }
        return commentVO;
    }

    @PostMapping("commentRemove.do")
    @ResponseBody
    public boolean commentDelete(@RequestParam("cno") int cno) throws Exception {
        boolean result = false;
        String sid = session.getAttribute("sid") != null ? (String) session.getAttribute("sid") : "";
        CommentVO commentVO = commentService.comment(cno);
        if(commentVO.getAuthor().equals(sid) || sid.equals("admin")) {
            commentService.commentDelete(commentVO.getCno());
            result = true;
        }
        return result;
    }

    @PostMapping("answerAdd.do")
    @ResponseBody
    public String answerInsert(@RequestParam("bno") int bno, @RequestParam("answer") String answer) throws Exception {
        Board board = new Board();

        BadWordFiltering filter = new BadWordFiltering();
        Boolean pass = filter.check(answer);

        if (pass) {
            answer = "♡♡";
            board.setAnswer(answer);
        } else {
            board.setAnswer(answer);
        }

        board.setBno(bno);
        boardService.qnaUpdate(board);

        return answer;

    }

}