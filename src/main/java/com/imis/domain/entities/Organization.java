package com.imis.domain.entities;

import java.io.Serializable;
import java.sql.Timestamp;

/**
 * @author william zhang
 *
 */
public class Organization implements Serializable{
	
	private static final long serialVersionUID = -8912396103619326281L;
	
	private Long organizationId;
	private String name;
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
	private Employer employer;
	private User user;
	private Timestamp createTime;
	private Timestamp updateTime;
	
	public Long getOrganizationId() {
		return organizationId;
	}
	
	public void setOrganizationId(Long organizationId) {
		this.organizationId = organizationId;
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
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
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
	public Employer getEmployer() {
		return employer;
	}
	public void setEmployer(Employer employer) {
		this.employer = employer;
	}
}
