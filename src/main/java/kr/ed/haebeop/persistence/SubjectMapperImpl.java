package kr.ed.haebeop.persistence;

import kr.ed.haebeop.domain.Subject;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class SubjectMapperImpl implements SubjectMapper {

    @Autowired
    private SqlSession sqlSession;


    @Override
    public List<Subject> subjectList() throws Exception {
        return sqlSession.selectList("subject.subjectList");
    }

    @Override
    public Subject subjectGet(int sno) throws Exception {
        return sqlSession.selectOne("subject.subjectGet");
    }

    @Override
    public void subjectInsert(Subject dto) throws Exception {
        sqlSession.insert("subject.subjectInsert", dto);
    }

    @Override
    public void subjectUpdate(Subject dto) throws Exception {
        sqlSession.update("subject.subjectEdit", dto);
    }

    @Override
    public void subjectDelete(int sno) throws Exception {
        sqlSession.delete("subject.subjectDelete", sno);
    }
}
