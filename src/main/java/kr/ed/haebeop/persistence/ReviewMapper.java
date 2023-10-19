package kr.ed.haebeop.persistence;

import kr.ed.haebeop.domain.Review;

import java.util.List;

public interface ReviewMapper {
    public List<Review> reviewList(int lno) throws Exception;

    void reviewInsert(Review dto) throws Exception;

    void reviewUpdate(Review dto) throws Exception;

    public void reviewDelete(int rno) throws Exception;
}
