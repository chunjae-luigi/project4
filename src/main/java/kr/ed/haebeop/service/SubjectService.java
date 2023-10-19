package kr.ed.haebeop.service;


import kr.ed.haebeop.domain.Subject;

import java.util.List;

public interface SubjectService {
    public List<Subject> subjectList() throws Exception;

    public Subject subjectGet(int sno) throws Exception;

    void subjectInsert(Subject dto) throws Exception;

    void subjectUpdate(Subject dto) throws Exception;


    public void subjectDelete(int sno) throws Exception;

}
