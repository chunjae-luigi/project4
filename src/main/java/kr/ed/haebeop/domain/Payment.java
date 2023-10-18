package kr.ed.haebeop.domain;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Payment {

    private int payno;          // 결제 번호 : 자동증가
    private String id;      // 회원 아이디
    private int dno;            // 책 공유번호
    private String plec;        //상품 이름
    private int sno;            // 수강 번호
    private int amount;         // 결제 수량
    private String pmethod;     // 결제 방법 - [1:신용카드 | 2:체크카드 | 3:계좌이체]
    private String pcom;        // 결제 대행사
    private String pnum;        // 결제카드(계좌)번호
    private int price;       // 결제 금액
    private int status;      // 배송상태 - [0:결제예정 | 1:결제완료 | 2:결제취소]
    private String resdate;     // 결제 등록일

}
