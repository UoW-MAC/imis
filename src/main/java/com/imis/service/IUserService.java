package com.imis.service;

import com.imis.domain.entities.User;

public interface IUserService {
	
    public void register(User user) throws Exception;
}
