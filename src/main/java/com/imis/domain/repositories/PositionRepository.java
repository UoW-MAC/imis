package com.imis.domain.repositories;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.imis.domain.entities.Position;
import com.imis.domain.entities.Student;

/**
 * @author Tong Chen
 *
 */
@Repository
@Transactional
public interface PositionRepository {

	void addPositionInfo(Position position);

	void deletePositionInfo(Long positionId);
	
	List<Position> showPositionInfo(Map<String,String> para);

	void updatePositionInfo(Position position);

	Position getPositionInfo(int positionId);
	
	List<Position> exportPositionInfo(Map<String,String> map);
}
