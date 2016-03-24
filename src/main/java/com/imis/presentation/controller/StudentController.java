package com.imis.presentation.controller;


import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.imis.domain.entities.Application;
import com.imis.domain.entities.Position;
import com.imis.domain.entities.Student;
import com.imis.domain.valuetypes.ResponseStatus;
import com.imis.infrastructure.dataexport.CsvExporter;
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
    private static final String STUDENT_DETAIL_PAGE= "student-detail";


    @Resource
    private IStudentService studentService;

    @Resource
    private IPositionService positionService;

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
    public @ResponseBody Map<String, List<Application>>  getPostionStatusList(HttpServletRequest request) {

        Map<String, List<Application>> positionStatusMap = null;

        try
    	{
    		List<Application> positionStatusList = positionService.getPositionStatusList();

    		positionStatusMap = new HashMap<String, List<Application>>();
    		positionStatusMap.put("data", positionStatusList);
    	}catch(Exception exception){
    		return null;
    	}

        return positionStatusMap;
    }

    @RequestMapping(value = "positionApply", method = RequestMethod.POST)
    public @ResponseBody Response positionApply(HttpServletRequest request) {

    	int statusCode;
        String statusDescription;

    	try
    	{
    		positionService.positionApply(request.getParameter("positionId"));

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
        	position = positionService.getPositionInfo(Integer.parseInt(positionId));

        	models = new HashMap<String, Object>();
        	models.put("positionDetail", position);

    		returnPage = POSITION_DETAIL_PAGE;

		} catch (Exception e) {
    		returnPage = ERROR_PAGE;
		}

        return new ModelAndView(returnPage, models);
    }

    @RequestMapping(value = "getStudentInfo", method = RequestMethod.POST)
    public @ResponseBody Response getAdminStudentInfo(HttpServletRequest request) {
    	int studentId=Integer.parseInt(request.getParameter("studentId"));
    	int statusCode=0;
        String statusDescription;
        Map<String, Object> models = null;
    	try
    	{
    		Student student = studentService.getStudentInfo(studentId);

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
    @RequestMapping(value = "adminStudentInfo", method = RequestMethod.GET)
	public @ResponseBody Map<String,Object> handleStudentObtain(HttpServletRequest request) {
		Map<String,Object> studentMap = null;
		List<Student> studentList=null;
		try {
			studentList  = studentService.getAdminStudentInfo();
			studentMap = new HashMap<String,Object>();
			studentMap.put("data", studentList);
		} catch (Exception ex) {
			
		}
		return studentMap;
	}
    @RequestMapping(value = "deleteStudent", method = RequestMethod.GET)
   	public @ResponseBody Response handleDeleteStudent(HttpServletRequest request) {
   		String studentId = request.getParameter("studentId");
   		Response rs = new Response(ResponseStatus.SUCCESS.getStatusCode(),ResponseStatus.SUCCESS.getStatusDescription());
   		try {
   			studentService.studentDelete(Long.parseLong(studentId));
   		} catch (Exception e) {
   			return null;
   		}
   		return rs;
   	}
    @RequestMapping(value = "exportCSV", method = RequestMethod.POST)
    public @ResponseBody Response exportAll(HttpServletRequest request) throws Exception {

    	Response response = new Response();
    	Map<String, Object> models = new HashMap<String, Object>();

    	List<Application> positionStatusList = positionService.getPositionStatusList();

        String filePath = CsvExporter.export(positionStatusList);

        String[] filePathSplit = filePath.split("/");
        String fileName = filePathSplit[3];

        models.put("fileName", fileName);
        response.setModels(models);

        return response;
    }
    
    @RequestMapping(value = "downloadCsv", method = RequestMethod.GET)
    public void downloadCsv(HttpServletRequest request, HttpServletResponse response) throws IOException{

        String fileName = request.getParameter("csvFileName");

        java.io.BufferedInputStream bufferInputStream = null;
        java.io.BufferedOutputStream bufferOutputStream = null;

        String ctxPath = request.getSession().getServletContext().getRealPath("/") + "csvfiles/";
        String downLoadPath = ctxPath + fileName;

        try {
            long fileLength = new File(downLoadPath).length();

            response.setContentType("text/csv");
            response.setHeader("Content-Disposition", "attachment; filename=" + new String(fileName.getBytes("utf-8"), "ISO8859-1"));
            response.setHeader("Content-Length", String.valueOf(fileLength));

            bufferInputStream = new BufferedInputStream(new FileInputStream(downLoadPath));
            bufferOutputStream = new BufferedOutputStream(response.getOutputStream());

            byte[] buff = new byte[2048];
            int bytesRead;
            while (-1 != (bytesRead = bufferInputStream.read(buff, 0, buff.length))) {
                bufferOutputStream.write(buff, 0, bytesRead);
            }

        } catch (Exception e) {
            logger.error(e.getMessage());
        } finally {
            if (bufferInputStream != null){
                bufferInputStream.close();
            }
            if (bufferOutputStream != null){
                bufferOutputStream.close();
            }
        }
    }

    @RequestMapping(value = "getAdminStudentInfo", method = RequestMethod.GET)
    public ModelAndView showStudentDetailInfo(HttpServletRequest request) {
    	String returnPage;
    	String studentId = request.getParameter("studentId");
    	Map<String, Integer> model = new HashMap<String, Integer>();
    	model.put("studentId", Integer.parseInt(studentId));
    	try{
    		returnPage = STUDENT_DETAIL_PAGE;

		} catch (Exception e) {
    		returnPage = ERROR_PAGE;
		}

        return new ModelAndView(returnPage,model);
    }
    @RequestMapping(value = "exportStudentCSV", method = RequestMethod.POST)
    public @ResponseBody Response exportStudentAll(HttpServletRequest request) throws Exception {

    	Response response = new Response();
    	Map<String, Object> models = new HashMap<String, Object>();

    	List<Student> studentList = studentService.getAdminStudentInfo();

        String filePath = CsvExporter.export(studentList);

        String[] filePathSplit = filePath.split("/");
        String fileName = filePathSplit[3];

        models.put("fileName", fileName);
        response.setModels(models);

        return response;

}
    @RequestMapping(value = "exportApplicationCSV", method = RequestMethod.POST)
    public @ResponseBody Response exportApplicationAll(HttpServletRequest request) throws Exception {

    	Response response = new Response();
    	Map<String, Object> models = new HashMap<String, Object>();

    	try {
			List<Application> applicationList = studentService.exportApplicationInfo();
			String filePath = CsvExporter.export(applicationList);
			String[] filePathSplit = filePath.split("/");
			String fileName = filePathSplit[3];
			models.put("fileName", fileName);
			response.setModels(models);
			return response;
		} catch (Exception e) {
			return null;
		}
    }
}
