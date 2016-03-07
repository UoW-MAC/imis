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

	List<Position> getPostionList(String userName);

	void deletePositionInfo(Long positionId);

	List<Position> showPositionInfo();

	void updatePositionInfo(Position position);

	List<Position> getPostionList(Map<String, Object> parms);

	Position getPositionInfo(int positionId);

}
