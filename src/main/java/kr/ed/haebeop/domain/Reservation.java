package kr.ed.haebeop.domain;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Reservation {
    private int rno;
    private String id;
    private String name;
    private String email;
    private String tel;
    private String birth;
    private String school;
    private int grade;
    private String rdate;
    private String rtime;
    private String status = "pending";
}