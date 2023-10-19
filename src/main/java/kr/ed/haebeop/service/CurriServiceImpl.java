package kr.ed.haebeop.service;


import kr.ed.haebeop.domain.Curri;
import kr.ed.haebeop.persistence.CurriMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CurriServiceImpl implements CurriService {

    @Autowired
    private CurriMapper curriMapper;

    @Override
    public List<Curri> curriList(int par) throws Exception {
        return curriMapper.curriList(par);
    }

    @Override
    public void curriInsert(Curri dto) throws Exception {
        curriMapper.curriInsert(dto);
    }

    @Override
    public void curriUpdate(Curri dto) throws Exception {
        curriMapper.curriUpdate(dto);
    }

    @Override
    public void curriDelete(int cno) throws Exception {
        curriMapper.curriDelete(cno);
    }
}
