package kr.ed.haebeop.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Review {
    private int rno;
    private int lno;
    private String memId;
    private String content;
    private int star;
    private String regdate;
}
