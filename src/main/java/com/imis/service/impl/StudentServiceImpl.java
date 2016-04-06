package com.imis.service.impl;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.imis.domain.entities.Application;
import com.imis.domain.entities.Education;
import com.imis.domain.entities.Student;
import com.imis.domain.entities.User;
import com.imis.domain.entities.Work;
import com.imis.domain.repositories.ApplicationRepository;
import com.imis.domain.repositories.EducationRepository;
import com.imis.domain.repositories.StudentRepository;
import com.imis.domain.repositories.WorkRepository;
import com.imis.service.IStudentService;

import oracle.net.aso.w;

@Service
@Transactional(rollbackFor = Exception.class)
public class StudentServiceImpl implements IStudentService {

	@Autowired
	private StudentRepository studentRepository;

	@Autowired
	private WorkRepository workRepository;

	@Autowired
	private EducationRepository educationRepository;
	
	@Autowired
	private ApplicationRepository applicationRepository;

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


	public Student getStudentInfo(int studentId) throws Exception {
		
		UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String userName = userDetails.getUsername();
		Map<String,Object> map = new HashMap<String, Object>();
		Student student;
		try {
			map.put("userName", userName);
			map.put("studentId", studentId);
			student = studentRepository.getStudentInfo(map);
			return student;
		} catch (Exception e) {
			return null;
		}
	}

	public void studentInfoUpdate(Student student) throws Exception {
		
		Timestamp updateTime = new Timestamp(System.currentTimeMillis());
		List<Work> updateWorkList = new ArrayList<Work>();
		List<Work> insertWorkList = new ArrayList<Work>();
		List<Education> UpdateEducationList = new ArrayList<Education>();
		List<Education> insertEducationList = new ArrayList<Education>();
		
		student.setUpdateTime(updateTime);
		studentRepository.updateStudentInfo(student);
		
		for (Education education : student.getEducationList()) {
			education.setUpdateTime(updateTime);
			
			if (education.getEducationId() != null) {
				UpdateEducationList.add(education);
			}else {
				Student newStudent = new Student();
				newStudent.setStudentId(student.getStudentId());
				education.setStudent(newStudent);
				education.setCreateTime(updateTime);
				insertEducationList.add(education);
			}
		}
		
		for (Work work : student.getWorkList()) {
			work.setUpdateTime(updateTime);
			
			if (work.getWorkId() != null) {
				updateWorkList.add(work);
			}else {
				Student newStudent = new Student();
				newStudent.setStudentId(student.getStudentId());
				work.setStudent(newStudent);
				work.setCreateTime(updateTime);
				insertWorkList.add(work);
			}
		}
        
		if (insertWorkList != null && insertEducationList.size() > 0) {
			workRepository.addWorkInfo(insertWorkList);
		}
		if (insertEducationList != null && insertEducationList.size() > 0) {
			educationRepository.addEducationInfo(insertEducationList);
		}
		
		workRepository.updateWorkInfo(updateWorkList);
		educationRepository.updateEducationInfo(UpdateEducationList);
	}


	@Override
	public List<Student> getAdminStudentInfo(String keyword) throws Exception {
		try {
			Map<String,String> map=new HashMap<String,String>();
			map.put("keyword", "%"+keyword+"%");
			List<Student> student = studentRepository.adminStudentInfo(map);
			return student;
		} catch (Exception e) {
			throw e;
		}
	}
	public boolean studentDelete(Long studentId) throws Exception {
		try {
			studentRepository.deleteStudentInfo(studentId);
			return true;
		} catch (Exception e) {
			throw e;
		}
	}
	public List<Application> exportApplicationInfo(String keyword) throws Exception {
		Map<String,String> map=new HashMap<String,String>();
		map.put("keyword", "%"+keyword+"%");
		try {
			return applicationRepository.exportApplicationInfo(map);
		} catch (Exception e) {
			 return null;
		}
	}


	@Override
	public boolean isStudentNumberExisted(Long studentNo) throws Exception {
		UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String userName = userDetails.getUsername();
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("userName",userName);
		map.put("studentNo",studentNo);
		Student student = studentRepository.getStudentByStudentNo(map);
		Boolean isUserNameExisted = false;
		
		if (student != null) {
			isUserNameExisted = true;
		}
		
		return isUserNameExisted;
	}
}
