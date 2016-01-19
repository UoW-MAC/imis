package com.imis.domain.entities;

import java.io.Serializable;

/**
 * @author william zhang
 *
 */
public class Employer implements Serializable{
	
	private static final long serialVersionUID = 5868095075237668191L;
	
	private Long EmployerId;
	private String type;
	
	public Long getEmployerId() {
		return EmployerId;
	}
	public void setEmployerId(Long employerId) {
		EmployerId = employerId;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
}
