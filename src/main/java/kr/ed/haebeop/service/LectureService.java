package kr.ed.haebeop.service;

import kr.ed.haebeop.domain.Lecture;
import kr.ed.haebeop.util.Page;

import java.util.List;

public interface LectureService {
    public List<Lecture> lectureList(Page page) throws Exception;

    public Lecture lectureDetail(int lno) throws Exception;

    public void lectureInsert(Lecture lecture) throws Exception;

    public void lectureEdit(Lecture lecture) throws Exception;

    public void lectureDelete(int lno) throws Exception;

    public int lectureCount(Page page) throws Exception;
}
