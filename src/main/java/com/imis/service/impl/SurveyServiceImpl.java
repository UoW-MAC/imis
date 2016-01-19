package com.imis.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.imis.domain.entities.Student;
import com.imis.domain.repositories.StudentRepository;
import com.imis.service.ISurveyService;

@Service
@Transactional(rollbackFor = Exception.class)
public class SurveyServiceImpl implements ISurveyService {

    @Autowired
    private StudentRepository studentRepository;

    public boolean surveySubmit(Student student) throws Exception {
        try {
        	studentRepository.addStudentInfo(student);
            return true;
        } catch (Exception e) {
            throw e;
        }
    }

   
}
