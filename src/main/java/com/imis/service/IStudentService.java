package com.imis.service;

import java.util.List;

import com.imis.domain.entities.Application;
import com.imis.domain.entities.Student;

public interface IStudentService {

    void studentInfoSubmit(Student student) throws Exception;

    void studentInfoUpdate(Student student) throws Exception;

    Student getStudentInfo(int studentId) throws Exception;
    
    List<Student> getAdminStudentInfo() throws Exception;
    
   List<Application> exportApplicationInfo() throws Exception;

    boolean studentDelete(Long studentId) throws Exception;
}
