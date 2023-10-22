package kr.ed.haebeop.service;

import kr.ed.haebeop.domain.Review;

import java.util.List;

public interface ReviewService {
    public List<Review> reviewList(int lno) throws Exception;

    void reviewAdd(Review review) throws Exception;

    void reviewUpdate(Review review) throws Exception;

    public void reviewDelete(int rno) throws Exception;

    public List<Review> reviewList_main() throws Exception;


}
