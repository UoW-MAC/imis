package com.imis.domain.entities;

import java.io.Serializable;
import java.sql.Timestamp;

/**
 * @author william zhang
 *
 */
public class Employer implements Serializable{
	
	private static final long serialVersionUID = -8912396103619326281L;
	
	private Long employerId;
	private String employerName;
	private String address;
	private String city;
	private String postCode;
	private String country;
	private String contactorFirstName;
	private String contactorLastName;
	private String contactorPosition;
	private String telephone;
	private String email;
	private String website;
	private String notes;
	private EmployerGroup employerGroup;
	private Application application;
	private User user;
	private Timestamp createTime;
	private Timestamp updateTime;
	
	public Application getApplication() {
		return application;
	}

	public void setApplication(Application application) {
		this.application = application;
	}

	public Long getEmployerId() {
		return employerId;
	}

	public void setEmployerId(Long employerId) {
		this.employerId = employerId;
	}

	public EmployerGroup getEmployerGroup() {
		return employerGroup;
	}

	public void setEmployerGroup(EmployerGroup employerGroup) {
		this.employerGroup = employerGroup;
	}
	public String getContactorPosition() {
		return contactorPosition;
	}
	
	public void setContactorPosition(String contactorPosition) {
		this.contactorPosition = contactorPosition;
	}
	
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
	
	public String getEmployerName() {
		return employerName;
	}

	public void setEmployerName(String employerName) {
		this.employerName = employerName;
	}

	public String getAddress() {
		return address;
	}
	
	public void setAddress(String address) {
		this.address = address;
	}
	
	public String getCity() {
		return city;
	}
	
	public void setCity(String city) {
		this.city = city;
	}
	
	public String getPostCode() {
		return postCode;
	}
	
	public void setPostCode(String postCode) {
		this.postCode = postCode;
	}
	
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	
	public String getContactorFirstName() {
		return contactorFirstName;
	}
	
	public void setContactorFirstName(String contactorFirstName) {
		this.contactorFirstName = contactorFirstName;
	}
	
	public String getContactorLastName() {
		return contactorLastName;
	}
	public void setContactorLastName(String contactorLastName) {
		this.contactorLastName = contactorLastName;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getWebsite() {
		return website;
	}
	public void setWebsite(String website) {
		this.website = website;
	}
	public String getNotes() {
		return notes;
	}
	public void setNotes(String notes) {
		this.notes = notes;
	}
}
