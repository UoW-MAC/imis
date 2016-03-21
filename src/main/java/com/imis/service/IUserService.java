package com.imis.service;

import com.imis.domain.entities.User;

public interface IUserService {
	
    public void register(User user) throws Exception;
    public boolean isUserNameExisted(String userName) throws Exception;
    public boolean isEmailExisted(String email) throws Exception;
    public boolean isLogged() throws Exception;
}
