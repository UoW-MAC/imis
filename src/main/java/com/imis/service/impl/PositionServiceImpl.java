package com.imis.service.impl;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.imis.domain.entities.Application;
import com.imis.domain.entities.Employer;
import com.imis.domain.entities.Position;
import com.imis.domain.entities.Student;
import com.imis.domain.entities.User;
import com.imis.domain.repositories.ApplicationRepository;
import com.imis.domain.repositories.PositionRepository;
import com.imis.domain.repositories.StudentRepository;
import com.imis.service.IPositionService;

@Service
@Transactional(rollbackFor = Exception.class)
public class PositionServiceImpl implements IPositionService {

	@Autowired
	private PositionRepository positionRepository;

	@Autowired
	private StudentRepository studentRepository;

	@Autowired
	private ApplicationRepository applicationRepository;

	public boolean positionSubmit(Position position) throws Exception {
		try {
			Timestamp createTime = new Timestamp(System.currentTimeMillis());
			UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			String userName = userDetails.getUsername();
			User user = new User();
			user.setUserName(userName);
			Employer employer = new Employer();
			employer.setUser(user);
			position.setEmployer(employer);
			position.setCreateTime(createTime);
			position.setUpdateTime(createTime);
			positionRepository.addPositionInfo(position);
			return true;
		} catch (Exception e) {
			throw e;
		}
	}

	@Override
	public boolean positionDelete(Long positionId) throws Exception {
		try {
			positionRepository.deletePositionInfo(positionId);
			return true;
		} catch (Exception e) {
			throw e;
		}

	}
	@Override
	public List<Position> positionObtain() throws Exception {
		try {
			UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			String userName = userDetails.getUsername();
			Map<String, String> para = new HashMap<String,String>();
			para.put("userName", userName);
			List<Position> position = positionRepository.showPositionInfo(para);
			
			return position;
		} catch (Exception e) {
			throw e;
		}
	}

	@Override
	public boolean positionUpdate(Position position) throws Exception {
		try {
			Timestamp updateTime = new Timestamp(System.currentTimeMillis());
			position.setUpdateTime(updateTime);
			positionRepository.updatePositionInfo(position);
			return true;
		} catch (Exception e) {
			throw e;
		}
	}

	public List<Application> getPositionStatusList() throws Exception {

		Map<String, Object> parms = new HashMap<String, Object>();

		UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String userName = userDetails.getUsername();

		parms.put("userName", userName);

		return applicationRepository.getPositionList(parms);
	}

	public void positionApply(String positionId) throws Exception {

		UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String userName = userDetails.getUsername();
		Timestamp createTime = new Timestamp(System.currentTimeMillis());

		Position position = new Position();
		position.setPositionId(Long.parseLong(positionId));

		User user = new User();
		user.setUserName(userName);

		Application application = new Application();
		application.setApplicationStatus(1);
		application.setPosition(position);
		application.setCreateTime(createTime);
		application.setUpdateTime(createTime);
		application.setUser(user);

		applicationRepository.positionApply(application);
	}
	
	public Position getPositionInfo(int positionId) throws Exception {

		return positionRepository.getPositionInfo(positionId);
	}

	@Override
	public  List<Application> candidateObtain(int positionId) throws Exception {
		Map<String,Integer> map=null;
		try {
			map=new HashMap<String, Integer>();
			map.put("positionId", positionId);
			List<Application> student = applicationRepository.getCandidateInfo(map);
			return student;
		} catch (Exception e) {
			throw e;
		}

	}

	@Override
	public Student getCandidateDetail(int studentId) throws Exception {
		try {
			Student student = studentRepository.getCandidateDetail(studentId);
			return student;
		} catch (Exception e) {
			throw e;
		}

	}

	@Override
	public void acceptCandidate(int applicationId) throws Exception {
		try {
			applicationRepository.acceptCandidate(applicationId);
		} catch (Exception e) {
			throw e;
		}
	}

	@Override
	public void rejectCandidate(int applicationId) throws Exception {
		try {
			applicationRepository.rejectCandidate(applicationId);
		} catch (Exception e) {
			throw e;
		}

	}

	@Override
	public boolean applicationDelete(Long applicationId) throws Exception {
		try {
			applicationRepository.deleteApplicationInfo(applicationId);
			return true;
		} catch (Exception e) {
			throw e;
		}
	}
	public List<Position> exportPositionInfo() throws Exception {

		try {
			return positionRepository.exportPositionInfo();
		} catch (Exception e) {
			 return null;
		}
	}

}
