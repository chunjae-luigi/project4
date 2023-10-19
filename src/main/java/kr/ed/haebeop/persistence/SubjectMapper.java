package kr.ed.haebeop.persistence;

import kr.ed.haebeop.domain.Subject;

import java.util.List;

public interface SubjectMapper {
    public List<Subject> subjectList() throws Exception;

    public Subject subjectGet(int sno) throws Exception;

    void subjectAdd(Subject subject) throws Exception;

    void subjectUpdate(Subject subject) throws Exception;

    public void subjectDelete(int sno) throws Exception;
}
