package kr.ed.haebeop.service;


import kr.ed.haebeop.domain.Review;
import kr.ed.haebeop.persistence.ReviewMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ReviewServiceImpl implements ReviewService {

    @Autowired
    private ReviewMapper reviewMapper;

    @Override
    public List<Review> reviewList(int par) throws Exception {
        return reviewMapper.reviewList(par);
    }

    @Override
    public void reviewInsert(Review dto) throws Exception {
        reviewMapper.reviewInsert(dto);
    }

    @Override
    public void reviewUpdate(Review dto) throws Exception {
        reviewMapper.reviewUpdate(dto);
    }

    @Override
    public void reviewDelete(int cno) throws Exception {
        reviewMapper.reviewDelete(cno);
    }
}
