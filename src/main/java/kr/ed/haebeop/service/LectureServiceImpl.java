package kr.ed.haebeop.service;

import kr.ed.haebeop.domain.Lecture;
import kr.ed.haebeop.persistence.LectureMapper;
import kr.ed.haebeop.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LectureServiceImpl implements LectureService{

    @Autowired
    private LectureMapper lectureMapper;

    @Override
    public List<Lecture> lectureList(Page page) throws Exception {
        return lectureMapper.lectureList(page);
    }

    @Override
    public Lecture lectureGet(int lno) throws Exception {
        return lectureMapper.lectureGet(lno);
    }

    @Override
    public void lectureAdd(Lecture lecture) throws Exception {
        lectureMapper.lectureAdd(lecture);
    }

    @Override
    public void lectureUpdate(Lecture lecture) throws Exception {
        lectureMapper.lectureUpdate(lecture);
    }

    @Override
    public void lectureDelete(int lno) throws Exception {
        lectureMapper.lectureDelete(lno);
    }

    @Override
    public int lectureCount(Page page) throws Exception {
        return lectureMapper.lectureCount(page);
    }

    @Override
    public List<Lecture> lectureList_main() throws Exception {
        return lectureMapper.lectureList_main();
    }
}
