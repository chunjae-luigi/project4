package kr.ed.haebeop.service;

import kr.ed.haebeop.domain.Curri;

import java.util.List;

public interface CurriService {
    public List<Curri> curriList(int lno) throws Exception;

    void curriAdd(Curri curri) throws Exception;

    void curriUpdate(Curri curri) throws Exception;

    public void curriDelete(int cno) throws Exception;

}
