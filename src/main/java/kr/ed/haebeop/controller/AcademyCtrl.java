package kr.ed.haebeop.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.ibm.icu.text.SimpleDateFormat;
import kr.ed.haebeop.domain.Day;

import kr.ed.haebeop.domain.Member;
import kr.ed.haebeop.domain.Reservation;
import kr.ed.haebeop.service.MemberService;
import kr.ed.haebeop.service.ReservationService;
import kr.ed.haebeop.service.UnavailableService;
import kr.ed.haebeop.util.BoardPage;
import kr.ed.haebeop.util.DatePicker;

import kr.ed.haebeop.util.SettingConfig;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.ParseException;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;


@Controller
@RequestMapping("/academy/*")
public class AcademyCtrl {
    @Autowired
    HttpSession session;

    @Autowired
    private MemberService memberService;

    @Autowired
    private ReservationService reservationService;

    @Autowired
    private UnavailableService unavailableService;

    @GetMapping("calendar")
    public String calendar(HttpServletRequest request, Model model) throws Exception{
        ServletContext application = request.getSession().getServletContext();

        int calNo = 0;
        String calstr = request.getParameter("calNo");

        if(calstr != null){
            calNo = Integer.parseInt(calstr);
        }

        // 현재 날짜
        LocalDate today = LocalDate.now();
        LocalDate callday = today.plusMonths(calNo);

        // 연도, 월, 일을 문자열로 추출
        String year = callday.format(DateTimeFormatter.ofPattern("yyyy"));
        String month = callday.format(DateTimeFormatter.ofPattern("MM"));
        String day = "32";

        if(today.equals(callday)){
            day = callday.format(DateTimeFormatter.ofPattern("dd"));
        } else if(today.isBefore(callday)){
            day = "-1";
        }

        DatePicker datePicker = new DatePicker();
        List<List<Day>> calendar = datePicker.makeRestDayCalendar(year+month, application);

        model.addAttribute("yyyy", year);
        model.addAttribute("mm", month);
        model.addAttribute("today", day);
        model.addAttribute("calNo", calNo);
        model.addAttribute("calendar", calendar);

        return "/academy/calendar";
    }

    @PostMapping("selectDay")
    @ResponseBody
    public Map<String, Integer> calendarSelectDay(HttpServletRequest request, @RequestParam("rdate") String rdate, @RequestParam("dayW") String dayW) throws IOException, ParseException {
        ServletContext application = request.getSession().getServletContext();

        Map<String, Integer> businesshour = new TreeMap<>(SettingConfig.businesshour(dayW, application));

        Reservation reservedDate = new Reservation();
        reservedDate.setRdate(rdate);
        for (Map.Entry<String, Integer> entry : businesshour.entrySet()) {
            String rtime = entry.getKey();
            Integer rcapcity = entry.getValue();

            reservedDate.setRtime(rtime);
            List<Reservation> reserved = reservationService.reservationGetTimeList(reservedDate);

            businesshour.put(rtime, rcapcity-reserved.size());
        }


        return businesshour;
    }

    @GetMapping("insertReservation")
    public String insertReservationForm(Model model, HttpServletRequest request) throws Exception {
        String rdate = request.getParameter("rdate");
        model.addAttribute("rdate", rdate);

        String rtime = request.getParameter("rtime");
        model.addAttribute("rtime", rtime);

        String id = (String) session.getAttribute("sid");
        Member member = memberService.memberGet(id);

        model.addAttribute("member", member);

        return "academy/reservation";
    }

    @PostMapping("insertReservation")
    public String insertReservation(Model model, HttpServletRequest request) throws IOException {
        ServletContext application = request.getSession().getServletContext();

        String id = (String) session.getAttribute("sid");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String tel = request.getParameter("tel");
        String birth = request.getParameter("birth");
        String school = request.getParameter("school");
        int grade = Integer.parseInt(request.getParameter("grade"));
        String rdate = request.getParameter("rdate");
        String rtime = request.getParameter("rtime");

        Reservation reservation = new Reservation();
        reservation.setId(id);
        reservation.setName(name);
        reservation.setEmail(email);
        reservation.setTel(tel);
        reservation.setBirth(birth);
        reservation.setSchool(school);
        reservation.setGrade(grade);
        reservation.setRdate(rdate);
        reservation.setRtime(rtime);


        boolean success = reservationService.reservationInsert(reservation, application);

        if(success){
            model.addAttribute("msg", "상담 신청에 성공했습니다. 관리자 승인 시 예약이 확정됩니다. 마이페이지에서 예약 내역을 확인할 수 있습니다.");
            model.addAttribute("url", "/");
        } else{
            model.addAttribute("msg", "상담 신청에 실패했습니다.");
            model.addAttribute("url", "/academy/calendar");
        }
        return "/layout/alert";
    }

    @GetMapping("adminReservationList")
    public String reservationList(HttpServletRequest request, Model model){
        int curPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;
        int bmNo = request.getParameter("no") != null ? Integer.parseInt(request.getParameter("no")) : 1;

        BoardPage page = new BoardPage();
        int total = reservationService.reservationCount();

        page.makeBlock(curPage, total);
        page.makeLastPageNum(total);
        page.makePostStart(curPage, total);
        List<Reservation> reservationList = reservationService.reservationList(page);

        model.addAttribute("page", page);
        model.addAttribute("curPage", curPage);

        model.addAttribute("reservationList", reservationList);
        return "/admin/academy/reservationList";
    }

    @GetMapping("adminReservationGet")
    public String reservationGet(HttpServletRequest request, Model model){
        int rno = Integer.parseInt(request.getParameter("rno"));
        Reservation reservation = reservationService.reservationGet(rno);

        model.addAttribute("reservation", reservation);

        return "/admin/academy/reservationGet";
    }

    @PostMapping("adminReservationUpdate")
    public String adminReservationUpdate(HttpServletRequest request, Model model){
        int rno = Integer.parseInt(request.getParameter("rno"));
        String status = request.getParameter("status");

        Reservation reservation = reservationService.reservationGet(rno);
        reservation.setStatus(status);

        reservationService.reservationUpdateStatus(reservation);

        return "redirect: reservationList";
    }

    @GetMapping("adminReservationSetting")
    public String adminReservationSetting(HttpServletRequest request, Model model) throws IOException {
        ServletContext application = request.getSession().getServletContext();

        Map<String, String> business = SettingConfig.businessSetting(application);
        Map<String, String> open = SettingConfig.openSetting(application);
        Map<String, String> close = SettingConfig.closeSetting(application);
        Map<String, Integer> reservation = SettingConfig.reservationSetting(application);

        String[] weekday = new String[]{"monday", "tuesday", "wednesday", "thursday", "friday", "saturday", "sunday", "holiday"};

        ObjectMapper objectMapper = new ObjectMapper();
        String businessS = objectMapper.writeValueAsString(business);
        String openS = objectMapper.writeValueAsString(open);
        String closeS = objectMapper.writeValueAsString(close);
//        String reservationS = objectMapper.writeValueAsString(reservation);


        model.addAttribute("business", businessS);
        model.addAttribute("open", openS);
        model.addAttribute("close", closeS);
        model.addAttribute("reservation", reservation);
        model.addAttribute("weekday", weekday);


        return "/admin/academy/reservationSetting";
    }

    @PostMapping("adminReservationSettingUpdate")
    public String adminReservationSettingUpdate(HttpServletRequest request, Model model) throws IOException {
        ServletContext application = request.getSession().getServletContext();

        String[] weekday = new String[]{"monday", "tuesday", "wednesday", "thursday", "friday", "saturday", "sunday", "holiday"};

        Map<String, String> setting = new HashMap<>();
        for(String w: weekday){
            String businessday = request.getParameter(w);
            if(businessday == null){
                setting.put("businessday."+w, "false");
                setting.put("openhour."+w, "none");
                setting.put("closehour."+w, "none");
            } else{
                setting.put("businessday."+w, "true");
                setting.put("openhour."+w, request.getParameter("open"+w));
                setting.put("closehour."+w, request.getParameter("close"+w));
            }
        }

        setting.put("reservation.interval", request.getParameter("interval"));
        setting.put("reservation.capacity", request.getParameter("capacity"));

        for (String key : setting.keySet()) {
            String value = setting.get(key);
            SettingConfig.editProperty(key, value, application);
        }

        return "redirect: adminReservationSetting";
    }

    @GetMapping("myReservation")
    public String myReservation(Model model){
        String id = (String) session.getAttribute("sid");

        List<Reservation> reservations = reservationService.reservationMyList(id);
        model.addAttribute("reservations", reservations);

        return "/member/myReservation";
    }
}
