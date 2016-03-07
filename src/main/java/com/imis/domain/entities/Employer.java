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
	private String employerAddress;
	private String employerCity;
	private String employerPostCode;
	private String employerCountry;
	private String contactorFirstName;
	private String contactorLastName;
	private String contactorPosition;
	private String employerTelephone;
	private String employerEmail;
	private String employerWebsite;
	private String employerNotes;
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

	public String getEmployerAddress() {
		return employerAddress;
	}

	public void setEmployerAddress(String employerAddress) {
		this.employerAddress = employerAddress;
	}

	public String getEmployerCity() {
		return employerCity;
	}

	public void setEmployerCity(String employerCity) {
		this.employerCity = employerCity;
	}

	public String getEmployerPostCode() {
		return employerPostCode;
	}

	public void setEmployerPostCode(String employerPostCode) {
		this.employerPostCode = employerPostCode;
	}

	public String getEmployerCountry() {
		return employerCountry;
	}

	public void setEmployerCountry(String employerCountry) {
		this.employerCountry = employerCountry;
	}

	public String getEmployerTelephone() {
		return employerTelephone;
	}

	public void setEmployerTelephone(String employerTelephone) {
		this.employerTelephone = employerTelephone;
	}

	public String getEmployerEmail() {
		return employerEmail;
	}

	public void setEmployerEmail(String employerEmail) {
		this.employerEmail = employerEmail;
	}

	public String getEmployerWebsite() {
		return employerWebsite;
	}

	public void setEmployerWebsite(String employerWebsite) {
		this.employerWebsite = employerWebsite;
	}

	public String getEmployerNotes() {
		return employerNotes;
	}

	public void setEmployerNotes(String employerNotes) {
		this.employerNotes = employerNotes;
	}
	
}
