package kr.ed.haebeop.service;


import kr.ed.haebeop.domain.Subject;
import kr.ed.haebeop.persistence.SubjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SubjectServiceImpl implements SubjectService {

    @Autowired
    private SubjectMapper subjectMapper;

    @Override
    public List<Subject> subjectList() throws Exception {
        return subjectMapper.subjectList();
    }

    @Override
    public Subject subjectGet(int sno) throws Exception {
        return subjectMapper.subjectGet(sno);
    }

    @Override
    public void subjectInsert(Subject dto) throws Exception {
        subjectMapper.subjectInsert(dto);
    }

    @Override
    public void subjectUpdate(Subject dto) throws Exception {
        subjectMapper.subjectUpdate(dto);
    }

    @Override
    public void subjectDelete(int sno) throws Exception {
        subjectMapper.subjectDelete(sno);
    }
}
