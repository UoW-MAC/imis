package com.imis.service;

import java.util.List;

import com.imis.domain.entities.Position;

public interface IPositionService {
	
    List<Position> getPostionStatusList(String groupId, String positionStatus) throws Exception;
    
    void positionApply(String positionId) throws Exception;
    
    Position getPositionInfo(int positionId) throws Exception;
	
}
