package com.imis.domain.repositories;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.imis.domain.entities.Employer;

/**
 * @author Tong Chen
 * 
 */
@Repository
@Transactional
public interface EmployerRepository {
	void addEmployerInfo(Employer employer);
	Employer showEmployerInfo(Map<String,Object> map);
	void updateEmployerInfo(Employer employer);
	void deleteEmployerInfo(Long employerId);
	List<Employer> getAdminEmployerInfo();
	List<Employer> exportAdminEmployerInfo();
}
