package kr.ed.haebeop.service;

import kr.ed.haebeop.domain.Lecture;
import kr.ed.haebeop.util.Page;

import java.util.List;

public interface LectureService {
    public List<Lecture> lectureList(Page page) throws Exception;
<<<<<<< HEAD

    public List<Lecture>  myLectList(int lno) throws Exception;
=======
>>>>>>> 9dc6e84ce33b6a21d6b84742f1782d4a7151a167

    public Lecture lectureGet(int lno) throws Exception;

    public void lectureAdd(Lecture lecture) throws Exception;

    public void lectureUpdate(Lecture lecture) throws Exception;

    public void lectureDelete(int lno) throws Exception;

    public int lectureCount(Page page) throws Exception;

    public List<Lecture> lectureList_main() throws Exception;

}
