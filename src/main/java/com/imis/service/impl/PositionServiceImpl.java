package com.imis.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.imis.domain.entities.Position;
import com.imis.domain.repositories.PositionRepository;
import com.imis.service.IPositionService;

@Service
@Transactional(rollbackFor = Exception.class)
public class PositionServiceImpl implements IPositionService {

	@Autowired
	private PositionRepository positionRepository;

	public List<Position> getPostionStatusList() throws Exception {
		
		UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String userName = userDetails.getUsername();
		
		return positionRepository.getPostionList(userName);
	}

	
}
