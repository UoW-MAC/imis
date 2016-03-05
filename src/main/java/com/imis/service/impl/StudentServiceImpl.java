package com.imis.service.impl;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.imis.domain.entities.Education;
import com.imis.domain.entities.Student;
import com.imis.domain.entities.User;
import com.imis.domain.entities.Work;
import com.imis.domain.repositories.EducationRepository;
import com.imis.domain.repositories.StudentRepository;
import com.imis.domain.repositories.WorkRepository;
import com.imis.service.IStudentService;

@Service
@Transactional(rollbackFor = Exception.class)
public class StudentServiceImpl implements IStudentService {

	@Autowired
	private StudentRepository studentRepository;

	@Autowired
	private WorkRepository workRepository;

	@Autowired
	private EducationRepository educationRepository;

	public void studentInfoSubmit(Student student) throws Exception {
		
		// step 1:
		Timestamp createTime = new Timestamp(System.currentTimeMillis());
		student.setCreateTime(createTime);
		student.setUpdateTime(createTime);
		
		UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String userName = userDetails.getUsername();
		User user = new User();
		user.setUserName(userName);
		student.setUser(user);
		
		studentRepository.addStudentInfo(student);

		// step 2:
		for (Work work : student.getWorkList()) {
			work.setStudent(student);
			work.setCreateTime(createTime);
			work.setUpdateTime(createTime);
		}
		
		workRepository.addWorkInfo(student.getWorkList());

		// step 3:
		for (Education education : student.getEducationList()) {
			education.setStudent(student);
			education.setCreateTime(createTime);
			education.setUpdateTime(createTime);
		}
		educationRepository.addEducationInfo(student.getEducationList());

	}


	public Student getStudentInfo() throws Exception {
		
		UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String userName = userDetails.getUsername();
		
		Student student = studentRepository.getStudentInfo(userName);
		
		return student;
	}

	public void studentInfoUpdate(Student student) throws Exception {
		
		Timestamp updateTime = new Timestamp(System.currentTimeMillis());
		List<Work> workList = student.getWorkList();
		List<Education> educationList = student.getEducationList();
		
		student.setUpdateTime(updateTime);
		studentRepository.updateStudentInfo(student);
		
		for (Education education : student.getEducationList()) {
			education.setUpdateTime(updateTime);
		}
		
		for (Work work : student.getWorkList()) {
			work.setUpdateTime(updateTime);
		}

		workRepository.updateWorkInfo(workList);

		educationRepository.updateEducationInfo(educationList);
	}
}
