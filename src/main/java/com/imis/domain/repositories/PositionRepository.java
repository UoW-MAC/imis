package com.imis.domain.repositories;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.imis.domain.entities.Position;

/**
 * @author william zhang
 * 
 */
@Repository
@Transactional
public interface PositionRepository {
	
	List<Position> getPostionList(Map<String, Object> parms);
	
	Position getPositionInfo(int positionId);
	
}
