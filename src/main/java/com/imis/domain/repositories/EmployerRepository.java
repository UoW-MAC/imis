package com.imis.domain.repositories;

import java.util.List;

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
	List<Employer> showEmployerInfo();
	void updateEmployerInfo(Employer employer);
}
