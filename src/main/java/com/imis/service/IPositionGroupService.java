package com.imis.service;

import java.util.List;

import com.imis.domain.entities.PositionGroup;

public interface IPositionGroupService {
	
    public List<PositionGroup> positionGroupObtain() throws Exception;
}
