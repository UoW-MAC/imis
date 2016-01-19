package com.imis.domain.repositories;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.imis.domain.entities.Student;

/**
 * @author william zhang
 * 
 */
@Repository
@Transactional
public interface StudentRepository {
	
	void addStudentInfo(Student student);
	
	void updateStudentInfo(Student student);
	
	void deleteStudentInfo(Student student);
}
