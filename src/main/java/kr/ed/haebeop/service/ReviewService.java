package kr.ed.haebeop.service;

import kr.ed.haebeop.domain.Review;

import java.util.List;

public interface ReviewService {
    public List<Review> reviewList(int lno) throws Exception;

    void reviewInsert(Review dto) throws Exception;

    void reviewUpdate(Review dto) throws Exception;

    public void reviewDelete(int rno) throws Exception;

}
