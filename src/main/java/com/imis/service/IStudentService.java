package com.imis.service;

import com.imis.domain.entities.Student;

public interface IStudentService {
	 void studentInfoSubmit(Student student) throws Exception;
		
	    void studentInfoUpdate(Student student) throws Exception;
	    
	    Student getStudentInfo() throws Exception;
}
