package com.imis.domain.repositories;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.imis.domain.entities.Work;

/**
 * @author william zhang
 * 
 */
@Repository
@Transactional
public interface WorkRepository {
	
	void addWorkInfo(List<Work> workList);

	void updateWorkInfo(List<Work> workList);
	
}
