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
import com.imis.domain.entities.Position;
import com.imis.domain.entities.User;
import com.imis.domain.repositories.ApplicationRepository;
import com.imis.domain.repositories.PositionRepository;
import com.imis.service.IPositionService;

@Service
@Transactional(rollbackFor = Exception.class)
public class PositionServiceImpl implements IPositionService {

	@Autowired
	private PositionRepository positionRepository;
	
	@Autowired
	private ApplicationRepository applicationRepository;

	public List<Position> getPostionStatusList(String groupId, String positionStatus) throws Exception {
		
		Map<String, Object> parms = new HashMap<String, Object>();
		
		UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String userName = userDetails.getUsername();
		
		parms.put("userName", userName);
		parms.put("groupId", groupId);
		parms.put("positionStatus", positionStatus);
		
		return positionRepository.getPostionList(parms);
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

	
}
