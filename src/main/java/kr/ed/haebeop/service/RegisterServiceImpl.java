package kr.ed.haebeop.service;

import kr.ed.haebeop.domain.Register;
import kr.ed.haebeop.persistence.RegisterMapper;
import kr.ed.haebeop.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RegisterServiceImpl implements RegisterService{
    @Autowired
    RegisterMapper registerMapper;

    @Override
    public List<Register> registerList() {
        return registerMapper.registerList();
    }

    @Override
    public Register registerGet(int registerNo) {
        return registerMapper.registerGet(registerNo);
    }

    @Override
    public void registerInsert(Register register) {
        registerMapper.registerInsert(register);
    }

    @Override
    public void registerDelete(int registerNo) {
        registerMapper.registerDelete(registerNo);
    }

    @Override
    public void registerUpdate(Register register) {
        registerMapper.registerUpdate(register);
    }


    @Override
    public int registerCount() {
        return registerMapper.registerCount();
    }

    @Override
    public List<Register> registerCourseList(String id) {
        return registerMapper.registerCourseList(id);
    }

    @Override
    public List<Register> registerStudentList(int courseNo) {
        return registerMapper.registerStudentList(courseNo);
    }

    @Override
    public int registerStudentCount(int courseNo) {
        return registerMapper.registerStudentCount(courseNo);
    }
}
