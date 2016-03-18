package com.imis.domain.repositories;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import com.imis.domain.entities.PositionGroup;

/**
 * @author Tong Chen
 * 
 */
@Repository
@Transactional
public interface PositionGroupRepository {
	List<PositionGroup> selectPositionGroupInfo();
}
