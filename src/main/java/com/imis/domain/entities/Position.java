package com.imis.domain.entities;

import java.io.Serializable;
import java.sql.Timestamp;

/**
 * @author william zhang
 *
 */
public class Position implements Serializable{

	private static final long serialVersionUID = 6267272562976652479L;
	
	private Long positionId;
	private String name;
	private PositionGroup positionGroup;
    private Organization organization;
    private Timestamp createTime;
    private Timestamp updateTime;
    
	public Long getPositionId() {
		return positionId;
	}
	
	public void setPositionId(Long positionId) {
		this.positionId = positionId;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public PositionGroup getPositionGroup() {
		return positionGroup;
	}
	
	public void setPositionGroup(PositionGroup positionGroup) {
		this.positionGroup = positionGroup;
	}
	
	public Organization getOrganization() {
		return organization;
	}
	
	public void setOrganization(Organization organization) {
		this.organization = organization;
	}
	
	public Timestamp getCreateTime() {
		return createTime;
	}
	
	public void setCreateTime(Timestamp createTime) {
		this.createTime = createTime;
	}
	
	public Timestamp getUpdateTime() {
		return updateTime;
	}
	
	public void setUpdateTime(Timestamp updateTime) {
		this.updateTime = updateTime;
	}
	
}
