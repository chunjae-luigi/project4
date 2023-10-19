package kr.ed.haebeop.service;

import kr.ed.haebeop.domain.Curri;

import java.util.List;

public interface CurriService {
    public List<Curri> curriList(int lno) throws Exception;

    void curriInsert(Curri dto) throws Exception;

    void curriUpdate(Curri dto) throws Exception;

    public void curriDelete(int cno) throws Exception;

}
