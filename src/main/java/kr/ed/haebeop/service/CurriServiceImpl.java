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
    public void curriAdd(Curri curri) throws Exception {
        curriMapper.curriAdd(curri);
    }

    @Override
    public void curriUpdate(Curri curri) throws Exception {
        curriMapper.curriUpdate(curri);
    }

    @Override
    public void curriDelete(int cno) throws Exception {
        curriMapper.curriDelete(cno);
    }
}
