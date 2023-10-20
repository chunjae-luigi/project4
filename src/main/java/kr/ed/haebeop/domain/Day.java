package kr.ed.haebeop.domain;

import lombok.Data;

@Data
public class Day {
    private String day = " "; // 일자
    private String  dayW; // 요일
    private String className = ""; // open, close, holiday
    private String holiday;
}
