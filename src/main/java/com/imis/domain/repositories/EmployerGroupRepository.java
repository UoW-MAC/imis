package com.imis.domain.repositories;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.imis.domain.entities.EmployerGroup;

/**
 * @author Tong Chen
 * 
 */
@Repository
@Transactional
public interface EmployerGroupRepository {
	List<EmployerGroup> selectEmployerGroupInfo();
}
