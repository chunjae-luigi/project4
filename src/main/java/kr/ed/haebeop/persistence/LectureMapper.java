package kr.ed.haebeop.persistence;

import kr.ed.haebeop.domain.LectlistVO;
import kr.ed.haebeop.domain.Lecture;
import kr.ed.haebeop.domain.LectureVO;
import kr.ed.haebeop.util.Page;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface LectureMapper {

    public List<Lecture> lectureList(Page page);

    public List<LectureVO> lectviewList(Page page);

    public Lecture lectureGet(int lno);

    public void lectureAdd(Lecture lecture);

    public void lectureUpdate(Lecture lecture);

    public void lectureDelete(int lno);

    public int lectureCount(Page page);

    public int lectviewCount(Page page);

    public List<LectlistVO> mylectList(String id);
    public int mylectListTeacher(LectureVO lectureVO);

    public List<LectureVO> lectureList_main();

    public int check(LectlistVO lectlistVO);
}
