package com.imis.service.impl;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.imis.domain.entities.EmployerGroup;
import com.imis.domain.repositories.EmployerGroupRepository;
import com.imis.service.IEmployerGroupService;



@Service
@Transactional(rollbackFor = Exception.class)
public class EmployerGroupServiceImpl implements IEmployerGroupService {

    @Autowired
    private EmployerGroupRepository employerGroupRepository;
    
    public List<EmployerGroup> employerGroupObtain() throws Exception {
        try {
        	List<EmployerGroup> employerGroup = employerGroupRepository.selectEmployerGroupInfo();
        	System.out.println(employerGroup);
            return employerGroup;
            
        } catch (Exception e) {
            throw e;
        }
    }

   
}
