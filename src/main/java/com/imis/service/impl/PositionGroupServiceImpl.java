package com.imis.service.impl;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.imis.domain.entities.PositionGroup;
import com.imis.domain.repositories.PositionGroupRepository;
import com.imis.service.IPositionGroupService;



@Service
@Transactional(rollbackFor = Exception.class)
public class PositionGroupServiceImpl implements IPositionGroupService {

    @Autowired
    private PositionGroupRepository positionGroupRepository;
    
    public List<PositionGroup> positionGroupObtain() throws Exception {
        try {
        	List<PositionGroup> positionGroup = positionGroupRepository.selectPositionGroupInfo();
            return positionGroup;
        } catch (Exception e) {
            throw e;
        }
    }

   
}
