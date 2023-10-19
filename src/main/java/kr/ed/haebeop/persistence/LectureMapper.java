package kr.ed.haebeop.persistence;

import kr.ed.haebeop.domain.Lecture;
import kr.ed.haebeop.util.Page;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface LectureMapper {

    public List<Lecture> lectureList(Page page);

    public Lecture lectureDetail(int lno);

    public void lectureInsert(Lecture lecture);

    public void lectureEdit(Lecture lecture);

    public void lectureDelete(int lno);

    public int lectureCount(Page page);
}
