package kr.ed.haebeop.domain;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Lecture {

    private int lno;
    private String title;
    private String subtitle;
    private String content;
    private int lecturetype;
    private int studentcnt;
    private String startdate;
    private String enddate;
    private String daily;
    private int prono;
    private String teacherid;
    private int thumbnail;
    private boolean useyn;
    private int dno;            // 배송 번호
    private int price;

}
