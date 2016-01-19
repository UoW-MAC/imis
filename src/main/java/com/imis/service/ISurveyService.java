package com.imis.service;

import com.imis.domain.entities.Student;

public interface ISurveyService {
	
    public boolean surveySubmit(Student student) throws Exception;
}
