package com.imis.presentation.controller;


import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.imis.domain.entities.Student;
import com.imis.domain.valuetypes.ResponseStatus;
import com.imis.presentation.model.Response;
import com.imis.service.IStudentService;


/**
 * @author william zhang
 */
@Controller
public class StudentController {
	private static final Logger logger = Logger.getLogger(StudentController.class);
    private static final String HOME_PAGE = "home";
    private static final String STUDENT_PAGE = "student";
    private static final String STUDENT_COMPLETION_PAGE = "student-completion-page";

    @Resource 
    private IStudentService studentService;

    @RequestMapping(value = "home", method = RequestMethod.GET)
    public ModelAndView show() {
        return new ModelAndView(HOME_PAGE);
    }

    @RequestMapping(value = "student", method = RequestMethod.GET)
    public ModelAndView showLandingPage() {
        Map<String, Object> models = new HashMap<String, Object>();
        return new ModelAndView(STUDENT_PAGE, models);
    }
    
    @RequestMapping(value = "makeStudent", method = RequestMethod.POST)
    public @ResponseBody Response makeApplication(@ModelAttribute("studentForm") Student student) {

    	int statusCode;
        String statusDescription; 
    	
    	try 
    	{
    		if (student.getStudentId() == null)
        	{
        		studentService.studentInfoSubmit(student);
        	}
        	else
        	{
        		studentService.studentInfoUpdate(student);
        	}
    		
    		statusCode = ResponseStatus.SUCCESS.getStatusCode();
    		statusDescription = ResponseStatus.SUCCESS.getStatusDescription();
    	}catch(Exception exception)
    	{
    		statusCode = ResponseStatus.FAILURE.getStatusCode();
    		statusDescription = ResponseStatus.FAILURE.getStatusDescription();
    	}
    	
        return new Response(statusCode, statusDescription);
    }
}


