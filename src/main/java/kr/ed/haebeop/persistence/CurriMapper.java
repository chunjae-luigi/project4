package kr.ed.haebeop.persistence;

import kr.ed.haebeop.domain.Curri;

import java.util.List;

public interface CurriMapper {
    public List<Curri> curriList(int lno) throws Exception;

    void curriAdd(Curri curri) throws Exception;

    void curriUpdate(Curri curri) throws Exception;

    public void curriDelete(int cno) throws Exception;
}
