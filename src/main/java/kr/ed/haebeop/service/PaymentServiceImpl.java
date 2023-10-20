package kr.ed.haebeop.service;


import kr.ed.haebeop.domain.Payment;
import kr.ed.haebeop.persistence.PaymentMapper;
import kr.ed.haebeop.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PaymentServiceImpl implements PaymentService{

    @Autowired
    private PaymentMapper paymentMapper;

    @Override
    public List<Payment> paymentList_Member (String id) throws Exception {
        return paymentMapper.paymentList_Member(id);
    }

    @Override
    public List<Payment> paymentList_admin(Page page) throws Exception {
        return paymentMapper.paymentList_admin(page);
    }

    @Override
    public List<Payment> paymentList_mypage(Page page) throws Exception {
        return paymentMapper.paymentList_mypage(page);
    }

    @Override
    public int paymentCount(Page page) throws Exception {
        return paymentMapper.paymentCount(page);
    }

    @Override
    public int insertpayment(Payment pay) throws Exception {
        return paymentMapper.insertpayment(pay);

    }

    @Override
    public void deletepayment(int payno) throws Exception {
            paymentMapper.deletepayment(payno);
    }

    @Override
    public Payment paymentList_Lecture(int dno) throws Exception {
        return paymentMapper.paymentList_Lecture(dno);
    }

}
