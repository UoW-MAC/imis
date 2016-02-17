package com.imis.domain.entities;

import java.io.Serializable;

/**
 * @author william zhang
 *
 */
public class EmployerGroup implements Serializable{
	
	private static final long serialVersionUID = 5868095075237668191L;
	
	private Long employerGroupId;
	private String type;
	
	public Long getEmployerGroupId() {
		return employerGroupId;
	}
	public void setEmployerGroupId(Long employerGroupId) {
		this.employerGroupId = employerGroupId;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
}
