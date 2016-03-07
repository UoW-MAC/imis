package com.imis.domain.entities;

import java.io.Serializable;

/**
 * @author Tong Chen
 *
 */
public class EmployerGroup implements Serializable{
	
	private static final long serialVersionUID = 5868095075237668191L;
	
	private Long employerGroupId;
	private String employerGroupType;
	
	public Long getEmployerGroupId() {
		return employerGroupId;
	}
	public void setEmployerGroupId(Long employerGroupId) {
		this.employerGroupId = employerGroupId;
	}
	public String getEmployerGroupType() {
		return employerGroupType;
	}
	public void setEmployerGroupType(String employerGroupType) {
		this.employerGroupType = employerGroupType;
	}

}
