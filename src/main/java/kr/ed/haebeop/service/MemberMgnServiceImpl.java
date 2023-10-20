package kr.ed.haebeop.service;

import kr.ed.haebeop.domain.MemberMgn;
import kr.ed.haebeop.persistence.MemberMgnMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberMgnServiceImpl implements MemberMgnService {

    @Autowired
    private MemberMgnMapper memberMgnMapper;

    @Override
    public MemberMgn memberMgnGet(String id) throws Exception {
        return memberMgnMapper.memberMgnGet(id);
    }

    @Override
    public void memberMgnInsert(String id) throws Exception {
        memberMgnMapper.memberMgnInsert(id);
    }

}