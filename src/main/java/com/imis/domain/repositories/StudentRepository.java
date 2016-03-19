package com.imis.domain.repositories;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.imis.domain.entities.Application;
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
			 
	void deleteStudentInfo(Long studentId);

	Student getStudentInfo(Map<String,Object>map);

	Student getCandidateDetail(int studentId);
	
	List<Student> adminStudentInfo();
	
}
