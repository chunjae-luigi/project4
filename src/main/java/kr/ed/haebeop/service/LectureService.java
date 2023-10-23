package kr.ed.haebeop.service;

import kr.ed.haebeop.domain.LectlistVO;
import kr.ed.haebeop.domain.Lecture;
import kr.ed.haebeop.domain.LectureVO;
import kr.ed.haebeop.domain.Review;
import kr.ed.haebeop.util.Page;

import java.util.List;

public interface LectureService {
    public List<Lecture> lectureList(Page page) throws Exception;

    public List<LectureVO> lectureviewList(Page page) throws Exception;

    public Lecture lectureGet(int lno) throws Exception;

    public void lectureAdd(Lecture lecture) throws Exception;

    public void lectureUpdate(Lecture lecture) throws Exception;

    public void lectureDelete(int lno) throws Exception;

    public int lectureCount(Page page) throws Exception;

    public int lectureviewCount(Page page) throws Exception;

    public List<Lecture> lectureList_main() throws Exception;

    public List<LectlistVO> mylectList(int lno) throws Exception;

}

