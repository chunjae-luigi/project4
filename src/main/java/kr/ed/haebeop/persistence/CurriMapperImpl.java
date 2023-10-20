package kr.ed.haebeop.persistence;

import kr.ed.haebeop.domain.Curri;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class CurriMapperImpl implements CurriMapper {

    @Autowired
    private SqlSession sqlSession;


    @Override
    public List<Curri> curriList(int lno) throws Exception {
        return sqlSession.selectList("curri.curriList", lno);
    }

    @Override
    public void curriAdd(Curri curri) throws Exception {
        sqlSession.insert("curri.curriAdd", curri);
    }

    @Override
    public void curriUpdate(Curri curri) throws Exception {
        sqlSession.update("curri.curriUpdate", curri);
    }

    @Override
    public void curriDelete(int cno) throws Exception {
        sqlSession.delete("curri.curriDelete", cno);
    }

}
