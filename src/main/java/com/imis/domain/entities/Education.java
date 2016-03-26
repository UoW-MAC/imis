package com.imis.domain.entities;

import java.io.Serializable;
import java.sql.Timestamp;

/**
 * @author william zhang
 *
 */
public class Education implements Serializable {

	private static final long serialVersionUID = -375423964473070765L;
	
	private Long educationId;
	private String degree;
	private String major;
	private String gpa;
	private String institution;
	private String country;
	private String graduationDate;
	private Student student;
	private Timestamp createTime;
	private Timestamp updateTime;
	
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
	public Long getEducationId() {
		return educationId;
	}
	public void setEducationId(Long educationId) {
		this.educationId = educationId;
	}
	public String getDegree() {
		return degree;
	}
	public void setDegree(String degree) {
		this.degree = degree;
	}
	public String getMajor() {
		return major;
	}
	public void setMajor(String major) {
		this.major = major;
	}
	public String getGpa() {
		return gpa;
	}
	public void setGpa(String gpa) {
		this.gpa = gpa;
	}
	public String getInstitution() {
		return institution;
	}
	public void setInstitution(String institution) {
		this.institution = institution;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getGraduationDate() {
		return graduationDate;
	}
	public void setGraduationDate(String graduationDate) {
		this.graduationDate = graduationDate;
	}
	public Student getStudent() {
		return student;
	}
	public void setStudent(Student student) {
		this.student = student;
	}
}
