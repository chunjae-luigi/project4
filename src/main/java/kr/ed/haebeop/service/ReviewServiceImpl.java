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
    public void reviewAdd(Review review) throws Exception {
        reviewMapper.reviewAdd(review);
    }

    @Override
    public void reviewUpdate(Review review) throws Exception {
        reviewMapper.reviewUpdate(review);
    }

    @Override
    public void reviewDelete(int cno) throws Exception {
        reviewMapper.reviewDelete(cno);
    }

    @Override
    public List<Review> reviewList_main() throws Exception {
        return reviewMapper.reviewList_main();
    }
}
