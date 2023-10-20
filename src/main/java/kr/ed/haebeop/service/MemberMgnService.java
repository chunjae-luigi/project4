package kr.ed.haebeop.service;

import kr.ed.haebeop.domain.MemberMgn;

public interface MemberMgnService {

    public MemberMgn memberMgnGet(String id) throws Exception;

    public void memberMgnInsert(String id) throws Exception;

}