package com.imis.domain.repositories;

import java.util.List;

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

	Student getStudentInfo(String userName);
	
	Student getCandidateDetail(int studentId);

	List<Student> getCandidateInfo(int positionId);
}
