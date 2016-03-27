package com.imis.service;

import java.util.List;

import com.imis.domain.entities.Application;
import com.imis.domain.entities.Student;

public interface IStudentService {

    void studentInfoSubmit(Student student) throws Exception;

    void studentInfoUpdate(Student student) throws Exception;

    Student getStudentInfo(int studentId) throws Exception;
    
    List<Student> getAdminStudentInfo(String keyword) throws Exception;
    
   List<Application> exportApplicationInfo(String keyword) throws Exception;

    boolean studentDelete(Long studentId) throws Exception;
    
    boolean isStudentNumberExisted(Long studentNo) throws Exception;
}
