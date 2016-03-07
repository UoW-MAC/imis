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
    private Application application;
	private Timestamp createTime;
    private Timestamp updateTime;
    private int positionStatus;
    private String positionDescription;
    private String responsibilities;
    private String requirements;
    private Long salary;
    private Long applicationNum;
    private Long unreadApplicationNum;
    
    public Application getApplication() {
		return application;
	}

	public void setApplication(Application application) {
		this.application = application;
	}

	public Long getUnreadApplicationNum() {
		return unreadApplicationNum;
	}

	public void setUnreadApplicationNum(Long unreadApplicationNum) {
		this.unreadApplicationNum = unreadApplicationNum;
	}

	public Long getApplicationNum() {
		return applicationNum;
	}

	public void setApplicationNum(Long applicationNum) {
		this.applicationNum = applicationNum;
	}

	public String getPositionDescription() {
		return positionDescription;
	}

	public void setPositionDescription(String positionDescription) {
		this.positionDescription = positionDescription;
	}

	public String getResponsibilities() {
		return responsibilities;
	}

	public void setResponsibilities(String responsibilities) {
		this.responsibilities = responsibilities;
	}

	public String getRequirements() {
		return requirements;
	}

	public void setRequirements(String requirements) {
		this.requirements = requirements;
	}

	public Long getSalary() {
		return salary;
	}

	public void setSalary(Long salary) {
		this.salary = salary;
	}

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
