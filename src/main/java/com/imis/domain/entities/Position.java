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
	private String positionName;
	private PositionGroup positionGroup;
    private Employer employer;
    private Timestamp createTime;
    private Timestamp updateTime;
    private int positionStatus;
    
	public int getPositionStatus() {
		return positionStatus;
	}

	public void setPositionStatus(int positionStatus) {
		this.positionStatus = positionStatus;
	}

	public Long getPositionId() {
		return positionId;
	}
	
	public void setPositionId(Long positionId) {
		this.positionId = positionId;
	}
	
	public String getPositionName() {
		return positionName;
	}

	public void setPositionName(String positionName) {
		this.positionName = positionName;
	}

	public PositionGroup getPositionGroup() {
		return positionGroup;
	}
	
	public void setPositionGroup(PositionGroup positionGroup) {
		this.positionGroup = positionGroup;
	}
	
	public Employer getEmployer() {
		return employer;
	}

	public void setEmployer(Employer employer) {
		this.employer = employer;
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
