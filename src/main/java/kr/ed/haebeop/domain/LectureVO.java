package kr.ed.haebeop.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class LectureVO {

    private int lno;
    private String lect_tit;
    private String subTitle;
    private int studentCnt;
    private String teacherNm;
    private String teacherId;
    private String thumbnail;
    private int cost;
    private int sno;
    private String sub_tit;

}
