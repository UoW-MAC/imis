package com.imis.domain.entities;

import java.io.Serializable;

import javax.validation.constraints.NotNull;

/**
 * @author william zhang
 */
public class User implements Serializable{
	
	private static final long serialVersionUID = 4891642085331481252L;
	
    @NotNull(message = "{user.userName.null}")
	private String userName;
	private String password;
	
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
}
