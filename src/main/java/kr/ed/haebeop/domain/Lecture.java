package kr.ed.haebeop.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Lecture {

    private int lno;
    private String title;
    private String subTitle;
    private String content;
    private int lectureType;
    private int studentCnt;
    private String startDate;
    private String endDate;
    private String daily;
    private String teacherId;
    private String teacherNm;
    private String thumbnail;
    private String lvideo;
    private int sno;
    private int cost;
    private String bookname;
    private String bthumbnail;

}
