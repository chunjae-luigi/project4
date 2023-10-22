package kr.ed.haebeop.persistence;

import kr.ed.haebeop.domain.Lecture;
import kr.ed.haebeop.util.Page;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface LectureMapper {

    public List<Lecture> lectureList(Page page);

<<<<<<< HEAD
    public List<Lecture>  myLectList(int lno);

=======
>>>>>>> 9dc6e84ce33b6a21d6b84742f1782d4a7151a167
    public Lecture lectureGet(int lno);

    public void lectureAdd(Lecture lecture);

    public void lectureUpdate(Lecture lecture);

    public void lectureDelete(int lno);

    public int lectureCount(Page page);

    public List<Lecture> lectureList_main();
}
