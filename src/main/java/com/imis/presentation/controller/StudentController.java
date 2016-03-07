package com.imis.presentation.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.imis.domain.entities.Position;
import com.imis.domain.entities.Student;
import com.imis.domain.valuetypes.ResponseStatus;
import com.imis.presentation.model.Response;
import com.imis.service.IPositionService;
import com.imis.service.IStudentService;


/**
 * @author william zhang
 */
@Controller
public class StudentController {
	private static final Logger logger = Logger.getLogger(StudentController.class);
    private static final String STUDENT_PAGE = "student";
    private static final String POSITION_DETAIL_PAGE = "position-detail";
    private static final String ERROR_PAGE = "error";
    

    @Resource 
    private IStudentService studentService;
    
    @Resource
    private IPositionService postionServce;
    
    @RequestMapping(value = "student", method = RequestMethod.GET)
    public ModelAndView showStudentPage() {
        Map<String, Object> models = new HashMap<String, Object>();
        return new ModelAndView(STUDENT_PAGE, models);
    }
    
    @RequestMapping(value = "addOrUpdStudent", method = RequestMethod.POST)
    public @ResponseBody Response makeApplication(@ModelAttribute("studentForm") @Valid Student student, BindingResult result) {

    	int statusCode;
        String statusDescription; 
        
        if (result.hasErrors()) {
        	statusCode = ResponseStatus.FAILURE.getStatusCode();
    		statusDescription = ResponseStatus.FAILURE.getStatusDescription();
    		return new Response(statusCode, statusDescription);
        }
    	
    	try 
    	{
    		if (student.getStudentId() == null || student.getStudentId().equals(""))
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
    
    @RequestMapping(value = "getPostionStatusList", method = RequestMethod.POST)
    public @ResponseBody Map<String, List<Position>>  getPostionStatusList(HttpServletRequest request) {

        Map<String, List<Position>> positionStatusMap = null;
        String groupId = request.getParameter("groupId");
        String positionStatus = request.getParameter("positionStatus");
    	
    	try 
    	{
    		List<Position> positionStatusList = postionServce.getPostionStatusList(groupId, positionStatus);
    		
    		positionStatusMap = new HashMap<String, List<Position>>();
    		positionStatusMap.put("data", positionStatusList);
    	}catch(Exception exception)
    	{
    	}
    	
        return positionStatusMap;
    }
    
    @RequestMapping(value = "positionApply", method = RequestMethod.POST)
    public @ResponseBody Response positionApply(HttpServletRequest request) {

    	int statusCode;
        String statusDescription;
    	
    	try
    	{
    		postionServce.positionApply(request.getParameter("positionId"));
    		
    		statusCode = ResponseStatus.SUCCESS.getStatusCode();
    		statusDescription = ResponseStatus.SUCCESS.getStatusDescription();
    		
    	}catch(Exception exception)
    	{
    		statusCode = ResponseStatus.FAILURE.getStatusCode();
    		statusDescription = ResponseStatus.FAILURE.getStatusDescription();
    	}
    	
        return new Response(statusCode, statusDescription);
    }
    
    @RequestMapping(value = "positionDetail", method = RequestMethod.GET)
    public ModelAndView showPositionDetailInfo(HttpServletRequest request) {
    	
    	String positionId = request.getParameter("positionId");
    	Position position = null;
        Map<String, Object> models = null;
        String returnPage = null;
        
        try {
        	position = postionServce.getPositionInfo(Integer.parseInt(positionId));
        	
        	models = new HashMap<String, Object>();
        	models.put("positionDetail", position);
        	
    		returnPage = POSITION_DETAIL_PAGE;
			
		} catch (Exception e) {
    		returnPage = ERROR_PAGE;
		}
        
        return new ModelAndView(returnPage, models);
    }
    
    @RequestMapping(value = "getStudentInfo", method = RequestMethod.POST)
    public @ResponseBody Response getStudentInfo() {

    	int statusCode;
        String statusDescription;
        Map<String, Object> models = null;
    	
    	try
    	{
    		Student student = studentService.getStudentInfo();
    		
    		if (student != null)
    		{
    			models = new HashMap<String, Object>();
    			models.put("studentInfo", student);
    		}
    		statusCode = ResponseStatus.SUCCESS.getStatusCode();
    		statusDescription = ResponseStatus.SUCCESS.getStatusDescription();
    		
    	}catch(Exception exception)
    	{
    		statusCode = ResponseStatus.FAILURE.getStatusCode();
    		statusDescription = ResponseStatus.FAILURE.getStatusDescription();
    	}
    	
        return new Response(statusCode, statusDescription, models);
    }
    
}


