package com.imis.service;

import java.util.List;

import com.imis.domain.entities.EmployerGroup;

public interface IEmployerGroupService {
	
    public List<EmployerGroup> employerGroupObtain() throws Exception;
}
