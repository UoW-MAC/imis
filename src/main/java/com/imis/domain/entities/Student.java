package com.imis.domain.entities;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.List;

/**
 * @author william zhang
 *
 */
public class Student implements Serializable {

	private static final long serialVersionUID = 2048034625158986631L;

	private Long studentId;
	private Long studentNo;
	private String firstName;
	private String middleName;
	private String lastName;
	private String email;
	private String telephone;
	private int status;
	private String gender;
	private String semesterRegistered;
	private String registeredYear;
	private Organization organization;
	private Position position;
	private List<Work> workList;
	private List<Education> educationlist;
	private User user;
	private Timestamp createTime;
	private Timestamp updateTime;

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
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

	public Long getStudentId() {
		return studentId;
	}

	public void setStudentId(Long studentId) {
		this.studentId = studentId;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getMiddleName() {
		return middleName;
	}

	public void setMiddleName(String middleName) {
		this.middleName = middleName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getSemesterRegistered() {
		return semesterRegistered;
	}

	public void setSemesterRegistered(String semesterRegistered) {
		this.semesterRegistered = semesterRegistered;
	}

	public String getRegisteredYear() {
		return registeredYear;
	}

	public void setRegisteredYear(String registeredYear) {
		this.registeredYear = registeredYear;
	}

	public Organization getOrganization() {
		return organization;
	}

	public void setCompany(Organization organization) {
		this.organization = organization;
	}

	public Position getPosition() {
		return position;
	}

	public void setPosition(Position position) {
		this.position = position;
	}

	public Long getStudentNo() {
		return studentNo;
	}

	public void setStudentNo(Long studentNo) {
		this.studentNo = studentNo;
	}
	public List<Work> getWorkList() {
		return workList;
	}

	public void setWorkList(List<Work> workList) {
		this.workList = workList;
	}

	public List<Education> getEducationlist() {
		return educationlist;
	}

	public void setEducationlist(List<Education> educationlist) {
		this.educationlist = educationlist;
	}
}
