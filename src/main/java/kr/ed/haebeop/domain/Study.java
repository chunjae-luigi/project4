package kr.ed.haebeop.domain;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Study {
    private int sno;
    private int lno;
    private String studentId;
    private boolean studyYn;
    private boolean canYn;
}
