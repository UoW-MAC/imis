package com.imis.service.impl;

import java.sql.Timestamp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.imis.domain.entities.User;
import com.imis.domain.repositories.UserRepository;
import com.imis.infrastructure.util.PasswordGenerator;
import com.imis.service.IUserService;

@Service
@Transactional(rollbackFor = Exception.class)
public class UserServiceImpl implements IUserService {

    @Autowired
    private UserRepository userRepository;

	public void register(User user) throws Exception {
		String encryptedPassword = PasswordGenerator.encryptPassword(user.getPassword(), user.getUserName());
		user.setPassword(encryptedPassword);
		
		Timestamp createTime = new Timestamp(System.currentTimeMillis());
		user.setCreateTime(createTime);
		user.setUpdateTime(createTime);
		
		userRepository.register(user);
		userRepository.addUserAuthority(user);
	}
}
