package com.imis.domain.repositories;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.imis.domain.entities.Education;

/**
 * @author william zhang
 * 
 */
@Repository
@Transactional
public interface EducationRepository {
	
	void addEducationInfo(List<Education> educationList);
	
}
