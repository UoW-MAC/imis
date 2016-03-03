package com.imis.domain.repositories;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.imis.domain.entities.Application;

/**
 * @author william zhang
 * 
 */
@Repository
@Transactional
public interface ApplicationRepository {
	
	void positionApply(Application application); 
	
}
