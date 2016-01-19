package com.imis.domain.entities;

import java.io.Serializable;

/**
 * @author william zhang
 *
 */
public class Education implements Serializable {

	private static final long serialVersionUID = -375423964473070765L;
	
	private Long educationId;
	private String degree;
	private String major;
	private float gpa;
	private String instituation;
	private String country;
	private String date;
	private Student student;
	
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
	public float getGpa() {
		return gpa;
	}
	public void setGpa(float gpa) {
		this.gpa = gpa;
	}
	public String getInstituation() {
		return instituation;
	}
	public void setInstituation(String instituation) {
		this.instituation = instituation;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public Student getStudent() {
		return student;
	}
	public void setStudent(Student student) {
		this.student = student;
	}
}
