package com.imis.presentation.controller;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.imis.service.IPositionGroupService;
import com.imis.service.IPositionService;
import com.imis.service.IStudentService;
import com.imis.domain.entities.Application;
import com.imis.domain.entities.Position;
import com.imis.domain.entities.PositionGroup;
import com.imis.domain.entities.Student;
import com.imis.domain.valuetypes.ResponseStatus;
import com.imis.infrastructure.dataexport.CsvExporter;
import com.imis.presentation.model.Response;

/**
 * @author Tong Chen
 */
@Controller
public class PositionController {
	private static final Logger logger = Logger.getLogger(PositionController.class);
	private static final String POSITION_PAGE = "position";
	private static final String USER_CENTER_PAGE = "user-center";
	private static final String CANDIDATE_DETAIL_PAGE="candidate-detail";
	private static final String CANDIDATE_PAGE="candidate";
    private static final String ERROR_PAGE = "error";
    private static final String ADMIN_POSITION_DETAIL_PAGE="admin-position-detail";
	
	//private static final String SURVEY_COMPLETION_PAGE = "survey-completion-page";

	@Resource
	private IPositionService positionService;
	@Resource
	private IPositionGroupService positionGroupService;
    @Resource 
    private IStudentService studentService;

	@RequestMapping(value = "position", method = RequestMethod.GET)
	public ModelAndView show() {
		return new ModelAndView(POSITION_PAGE);
	}

	@RequestMapping(value = "getPositionGroup", method = RequestMethod.GET)
	public @ResponseBody List<PositionGroup> handlePositionGroupObtain(HttpServletRequest request) {
		List<PositionGroup> positonGroupList = null;
		try {
			positonGroupList  = positionGroupService.positionGroupObtain();
		} catch (Exception ex) {
			return null;
		}

		return positonGroupList;
	}

	@RequestMapping(value = "makePosition", method = RequestMethod.POST)
	public ModelAndView makeApplication(@ModelAttribute("positionForm") Position position) throws Exception {
		positionService.positionSubmit(position);
		return new ModelAndView(USER_CENTER_PAGE);
	}
	@RequestMapping(value = "deletePosition", method = RequestMethod.GET)
	public @ResponseBody Response handleDeletePosition(HttpServletRequest request) {
		String positionId = request.getParameter("positionId");
		Response rs = new Response(ResponseStatus.SUCCESS.getStatusCode(),ResponseStatus.SUCCESS.getStatusDescription());
		try {
			positionService.positionDelete(Long.parseLong(positionId));
		} catch (Exception e) {
			return null;
		}
		return rs;
	}
	
	@RequestMapping(value = "showPosition", method = RequestMethod.GET)
	public @ResponseBody Map<String,Object> handlePositionObtain(HttpServletRequest request) {
		Map<String,Object> positionMap = null;
		try {
			positionMap  = new HashMap<String, Object>();
			positionMap.put("data",positionService.positionObtain());
		} catch (Exception ex) {
			return null;
		}
		return positionMap;
	}
	@RequestMapping(value = "updatePosition", method = RequestMethod.POST)
	public @ResponseBody Response updateApplication(@ModelAttribute("updatePositionForm") Position position) throws Exception {
		positionService.positionUpdate(position);
		Response rs = new Response(ResponseStatus.SUCCESS.getStatusCode(),ResponseStatus.SUCCESS.getStatusDescription());
		return rs;
	}
	
    @RequestMapping(value = "canditateDetail", method = RequestMethod.GET)
	    public ModelAndView showCandidateDetailInfo(HttpServletRequest request) {
	    	
	    	String applicationId = request.getParameter("applicationId");
	    	String studentId = request.getParameter("studentId");
	    	String positionId = request.getParameter("positionId");
	    	Student student = null;
	        Map<String, Object> models = null;
	        String returnPage = null;
	        
	        try {
	        	student = positionService.getCandidateDetail(Integer.parseInt(studentId));
	        	models = new HashMap<String, Object>();
	        	models.put("candidateDetail", student);
	        	models.put("applicationId", applicationId);
	        	models.put("positionId", positionId);
	    		returnPage = CANDIDATE_DETAIL_PAGE;
				
			} catch (Exception e) {
	    		returnPage = ERROR_PAGE;
			}
	        
	        return new ModelAndView(returnPage, models);
	    }
    @RequestMapping(value = "canditateInfo", method = RequestMethod.GET)
    public @ResponseBody Map<String,Object> showCandidateInfo(HttpServletRequest request) {
    	
    	String positionId = request.getParameter("positionId");
    	List<Application> student = null;
        Map<String, Object> data = null;     
        try {
        	student = positionService.candidateObtain(Integer.parseInt(positionId));
        	data= new HashMap<String, Object>();
        	data.put("data", student);     
		} catch (Exception e) {
    		return null;
		}
		return data;
    } 
    @RequestMapping(value = "candidate", method = RequestMethod.GET)
    public ModelAndView showCandidate(HttpServletRequest request) {
    	String positionId = request.getParameter("positionId");
        Map<String, Object> models = null;
        String returnPage = null;
        try {
        	models = new HashMap<String, Object>();
        	models.put("positionId", positionId);
    		returnPage = CANDIDATE_PAGE;	
		} catch (Exception e) {
    		returnPage = ERROR_PAGE;
		}
        
        return new ModelAndView(returnPage, models);
    }
    @RequestMapping(value = "candidateAccept", method = RequestMethod.GET)
	public @ResponseBody int candidateAccept(HttpServletRequest request) throws Exception {
    	String applicationId = request.getParameter("applicationId");
    	int positionId = Integer.parseInt(request.getParameter("positionId"));
    	
		try {
			positionService.acceptCandidate(Integer.parseInt(applicationId));
			
		} catch (Exception e) {
			throw e;
		}
		return positionId;
	}
    @RequestMapping(value = "candidateReject", method = RequestMethod.GET)
   	public @ResponseBody int candidateReject(HttpServletRequest request) throws Exception {
       	String applicationId = request.getParameter("applicationId");
       	int positionId = Integer.parseInt(request.getParameter("positionId"));
       	
   		try {
   			positionService.rejectCandidate(Integer.parseInt(applicationId));
   			
   		} catch (Exception e) {
   			throw e;
   		}
   		return positionId;
   	}
    @RequestMapping(value = "deleteApplication", method = RequestMethod.GET)
	public @ResponseBody Response handleDeleteApplication(HttpServletRequest request) {
		String applicationId = request.getParameter("applicationId");
		Response rs = new Response(ResponseStatus.SUCCESS.getStatusCode(),ResponseStatus.SUCCESS.getStatusDescription());
		try {
			positionService.applicationDelete(Long.parseLong(applicationId));
		} catch (Exception e) {
			return null;
		}
		return rs;
	}
    @RequestMapping(value = "exportPositionCSV", method = RequestMethod.POST)
    public @ResponseBody Response exportPositionAll(HttpServletRequest request) throws Exception {

    	Response response = new Response();
    	Map<String, Object> models = new HashMap<String, Object>();
    	
    	List<Position> positionList = positionService.exportPositionInfo();
      
        String filePath = CsvExporter.export(positionList);

        String[] filePathSplit = filePath.split("/");
        String fileName = filePathSplit[3];

        models.put("fileName", fileName);
        response.setModels(models);
        
        return response;
    }
    @RequestMapping(value = "adminPositionDetail", method = RequestMethod.GET)
    public ModelAndView showPositionDetailInfo(HttpServletRequest request) {

    	String positionId = request.getParameter("positionId");
    	Position position = null;
        Map<String, Object> models = null;
        String returnPage = null;

        try {
        	position = positionService.getPositionInfo(Integer.parseInt(positionId));

        	models = new HashMap<String, Object>();
        	models.put("positionDetail", position);

    		returnPage = ADMIN_POSITION_DETAIL_PAGE;

		} catch (Exception e) {
    		returnPage = ERROR_PAGE;
		}

        return new ModelAndView(returnPage, models);
    }
}
