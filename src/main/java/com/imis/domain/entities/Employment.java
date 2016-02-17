package com.imis.domain.entities;

import java.io.Serializable;
import java.sql.Timestamp;

/**
 * @author william zhang
 *
 */
public class Employment implements Serializable {

	private static final long serialVersionUID = -375423964473070765L;
	
	private Long employmentId;
	private Student student;
	private Position position;
	private String status;
	private Timestamp createTime;
	private Timestamp updateTime;
	
	public Long getEmploymentId() {
		return employmentId;
	}
	public void setEmploymentId(Long employmentId) {
		this.employmentId = employmentId;
	}
	public Student getStudent() {
		return student;
	}
	public void setStudent(Student student) {
		this.student = student;
	}
	public Position getPosition() {
		return position;
	}
	public void setPosition(Position position) {
		this.position = position;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
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
