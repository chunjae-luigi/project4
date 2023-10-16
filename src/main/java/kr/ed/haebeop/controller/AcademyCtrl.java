package kr.ed.haebeop.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.ibm.icu.text.SimpleDateFormat;
import kr.ed.haebeop.domain.RestDay;
import kr.ed.haebeop.domain.Unavailable;
import kr.ed.haebeop.service.ReservationService;
import kr.ed.haebeop.service.UnavailableService;
import kr.ed.haebeop.util.DatePicker;
import kr.ed.haebeop.util.RestDayUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/academy/*")
public class AcademyCtrl {
    @Autowired
    HttpSession session;

    @Autowired
    private ReservationService reservationService;

    @Autowired
    private UnavailableService unavailableService;

    @GetMapping("academyCalendar")
    public String calendar(Model model) throws Exception{
        Date today = new Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
        String yyyymmdd = dateFormat.format(today);
        String yyyy= yyyymmdd.substring(0,4);
        String mm = yyyymmdd.substring(4, 6);
        String dd = yyyymmdd.substring(6);

        DatePicker datePicker = new DatePicker();

        List<String[]> calList = datePicker.getDatePicker(yyyy+mm);
        String cal = "";
        for(String[] row:calList){
            cal = cal + "<tr>";
            for(String col:row){
                cal = cal + ("<td>"+col+"</td>");
            }
            cal = cal + "</tr>";
        }

        RestDayUtil restUtil = new RestDayUtil();
        List<RestDay> restList = restUtil.getRestDayList(yyyy+mm);

        Unavailable unavailable = new Unavailable();
        unavailable.setRdate(yyyy+"-"+mm+"-"+dd);

        List<Unavailable> unavailableList = unavailableService.unavailableMonthList(unavailable);

        Map<Integer, String> restDays = new HashMap<>();

        for(RestDay r:restList){
            int rd = Integer.parseInt(r.getLocdate().substring(6));
            restDays.put(rd,  r.getDateName());
        }

        Map<Integer, String> udayList = new HashMap<>();
        for(Unavailable u: unavailableList){
            int rd = Integer.parseInt(u.getRdate().substring(8));
            String reason = u.getReason();
            udayList.put(rd, reason);
        }

        ObjectMapper objectMapper = new ObjectMapper();
        String restDayList = objectMapper.writeValueAsString(restDays);
        String unDayList = objectMapper.writeValueAsString(udayList);


        model.addAttribute("yyyy", yyyy);
        model.addAttribute("mm", mm);
        model.addAttribute("cal", cal);
        model.addAttribute("calList", calList);
        model.addAttribute("today", dd);
        model.addAttribute("restDayList", restDayList);
        model.addAttribute("unavailableList", unDayList);

        return "/academy/academyReservationCalendar";
    }

}
