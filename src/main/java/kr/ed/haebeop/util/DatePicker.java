package kr.ed.haebeop.util;

import kr.ed.haebeop.domain.Day;
import kr.ed.haebeop.domain.RestDay;

import javax.servlet.ServletContext;
import java.text.SimpleDateFormat;
import java.util.*;

public class DatePicker {
    //달력 구하기 + 공휴일 추가
    public List<List<Day>> makeRestDayCalendar(String yyyymm, ServletContext servletContext) throws Exception {
        List<List<Day>> calendar = getCalendar(yyyymm);

        // 영업일 추가
        List<String> businessClosed = SettingConfig.businessClosed(servletContext);
        for(int w=0; w<calendar.size(); w++){
            List<Day> week = calendar.get(w);
            for(int i=0; i<7; i++){
                Day day = week.get(i);
                if(businessClosed.contains(day.getDayW())){
                    day.setClassName("closed");
                }
                week.set(i, day);
            }
            calendar.set(w, week);
        }


        // 공휴일 불러오기
        RestDayUtil restUtil = new RestDayUtil();
        List<RestDay> restList = restUtil.getRestDayList(yyyymm);
        if(!restList.isEmpty()){
            List<String> restdd= new ArrayList<>();

            Map<String, String> restDays = new HashMap<>();
            for(RestDay r:restList){
                String rd = r.getLocdate().substring(6);
                String dd = String.valueOf(Integer.parseInt(rd));
                restdd.add(dd);
                restDays.put(dd,  r.getDateName());
            }


            // 공휴일 추가
            if(businessClosed.contains("holiday")){
                for(int w=0; w<calendar.size(); w++){
                    List<Day> week = calendar.get(w);
                    for(int i=0; i<7; i++){
                        Day day = week.get(i);
                        if(restdd.contains(day.getDay())){
                            day.setClassName(day.getClassName()+" holiday");
                            day.setHoliday(restDays.get(day.getDay()));
                        }
                        week.set(i, day);
                    }
                    calendar.set(w, week);
                }
            } else{
                for(int w=0; w<5; w++){
                    List<Day> week = calendar.get(w);
                    for(int i=0; i<7; i++) {
                        Day day = week.get(i);
                        if (restdd.contains(day.getDay())) {
                            System.out.println(day.getDay());
                            day.setClassName(day.getClassName() + " closed holiday");
                            day.setHoliday(restDays.get(day.getDay()));
                        }
                        week.set(i, day);
                    }
                    calendar.set(w, week);
                }
            }
        }

        return calendar;
    }


    // 달력 구하기
    public List<List<Day>> getCalendar(String yyyymm) throws Exception {
        int year = Integer.parseInt(yyyymm.substring(0, 4));       //해당 년도 추출
        int month = Integer.parseInt(yyyymm.substring(4));    //해당 월 추출


        Calendar cal = Calendar.getInstance();

        //입력 받은 년도, 월, 일
        cal.set(Calendar.YEAR, year); //입력받은 년도로 세팅
        cal.set(Calendar.MONTH, month); //입력받은 월로 세팅
        cal.set(year,month-1,1); //입력받은 월의 1일로 세팅

        int end = cal.getActualMaximum(Calendar.DATE); //해당 월 마지막 날짜
        int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK); //해당 날짜의 요일(1:일요일 … 7:토요일)
        String[] dow = new String[]{"empty","sunday", "monday", "tuesday", "wednesday", "thursday", "friday", "saturday"};


        int day = 1;

        List<List<Day>> calendar = new ArrayList<>();
        List<Day> firstWeek = new ArrayList<>();
        for(int j=1; j<=7; j++){

            if(j<dayOfWeek){
                Day empty = new Day();
                empty.setClassName("empty");
                firstWeek.add(empty);
            }
            else{
                Day dayNow = new Day();
                dayNow.setDay(Integer.toString(day));
                dayNow.setDayW(dow[j]);
                firstWeek.add(dayNow);
                day++;
            }
        }
        calendar.add(firstWeek);

        int last = ((end - day + 1) / 7) + 1;

        for(int week=2; week<=last; week++){
            List<Day> nthWeek = new ArrayList<>();
            for(int j=1; j<=7; j++){
                Day dayNow = new Day();
                dayNow.setDay(Integer.toString(day));
                dayNow.setDayW(dow[j]);
                nthWeek.add(dayNow);
                day++;
            }
            calendar.add(nthWeek);
        }

        List<Day> lastWeek = new ArrayList<>();
        for(int j=1; j<=7; j++){
            if(day>end){
                Day empty = new Day();
                empty.setClassName("empty");
                lastWeek.add(empty);
            } else{
                Day dayNow = new Day();
                dayNow.setDay(Integer.toString(day));
                dayNow.setDayW(dow[j]);
                lastWeek.add(dayNow);
                day++;
            }
        }
        calendar.add(lastWeek);

        return calendar;
    }



   //요일 구하기
   public String generateWeekDay(Calendar cal){
       String wk = "";
       int weekday = cal.get(Calendar.DAY_OF_WEEK);
       switch(weekday) {
           case 1:
               wk = "일요일";               break;
           case 2:
               wk = "월요일";               break;
           case 3:
               wk = "화요일";               break;
           case 4:
               wk = "수요일";               break;
           case 5:
               wk = "목요일";               break;
           case 6:
               wk = "금요일";               break;
           case 7:
               wk = "토요일";               break;
       }
       return wk;
   }
   //요일 생성2
    public String generateWeekDay2(Calendar cal) {
        String[] week = {"일요일","월요일","화요일","수요일","목요일","금요일","토요일"};
        int d = cal.get(Calendar.DAY_OF_WEEK);
        return week[d-1];
    }
    //Calendar를 String으로 변환
    public String CalendarParseString(Calendar cal) {
       SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
       String data = sdf.format(cal.getTime());
       return data;
    }
    //Date를 String으로 변환
    public String DateParseString(Date date) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String data = sdf.format(date);
        return data;
    }
    //String을 Date로 변환
    public Date stringParseDate(String data) throws Exception {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date date =  sdf.parse(data);
        return date;
    }
    //String을 Calendar로 변환
    public Calendar stringParseCalendar(String data) throws Exception {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date date = sdf.parse(data);
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);
        return cal;
    }
    //Date를 Calendar로 변환
    public Calendar dateParseCalendar(Date date) {
       Calendar cal = Calendar.getInstance();
       cal.setTime(date);
       return cal;
    }
    //Calendar를 Date로 변환
    public Date calendarParseDate(Calendar cal){
       Date date = cal.getTime();
       return date;
    }

}
