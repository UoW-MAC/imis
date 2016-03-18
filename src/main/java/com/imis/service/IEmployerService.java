package com.imis.service;

import java.util.List;
import java.util.Map;

import com.imis.domain.entities.Employer;

public interface IEmployerService {
	
	public boolean employerInfoSubmit(Employer employer) throws Exception;
	public Map<String,Employer> employerObtain() throws Exception;
	public boolean employerInfoUpdate(Employer employer) throws Exception;
	public List<Employer> getAdminEmployerInfo() throws Exception;
	public List<Employer> exportAdminEmployerInfo() throws Exception;
	public Employer getAdminEmployerDetail(int employerId) throws Exception;
	public boolean employerDelete(Long employerId) throws Exception;
}
