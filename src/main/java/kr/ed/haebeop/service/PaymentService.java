package kr.ed.haebeop.service;

import kr.ed.haebeop.domain.Payment;
import kr.ed.haebeop.util.Page;

import java.util.List;

public interface PaymentService {

    public int paymentList_Member(String id, int pno) throws Exception;
    public Payment paymentList_Lecture(int dno) throws Exception;
    public List<Payment> paymentList_admin(Page page) throws Exception;
    public List<Payment> paymentList_mypage(Page page) throws Exception;
    public int paymentCount(Page page) throws Exception;
    public int insertpayment(Payment pay) throws Exception;
    public void deletepayment(int payno) throws Exception;

}