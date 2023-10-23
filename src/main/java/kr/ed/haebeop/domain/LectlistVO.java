package kr.ed.haebeop.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class LectlistVO {
        private int lno;
        private String title;
        private String teacherNm;
        private String thumbnail;
        private String id;
}
