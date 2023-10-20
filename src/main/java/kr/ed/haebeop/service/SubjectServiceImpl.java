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
    public void subjectAdd(Subject subject) throws Exception {
        subjectMapper.subjectAdd(subject);
    }

    @Override
    public void subjectUpdate(Subject subject) throws Exception {
        subjectMapper.subjectUpdate(subject);
    }

    @Override
    public void subjectDelete(int sno) throws Exception {
        subjectMapper.subjectDelete(sno);
    }
}
