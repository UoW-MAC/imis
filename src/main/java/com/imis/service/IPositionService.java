package com.imis.service;

import java.util.List;

import com.imis.domain.entities.Position;

public interface IPositionService {
	
    List<Position> getPostionStatusList() throws Exception;
	
}
