package com.imis.infrastructure.dataexport;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStreamWriter;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Component;

import com.imis.domain.entities.Application;
import com.imis.domain.entities.Employer;
import com.imis.domain.entities.Position;
import com.imis.domain.entities.Student;
import com.imis.domain.valuetypes.ServiceConstant;

/**
 * Created by William Zhang on 14/03/16.
 */
@Component
public class CsvExporter {

	private static final Logger logger = Logger.getLogger(CsvExporter.class);
	
	public static String export(List<?> objectList) throws Exception {
		
		logger.info("start to call export in CsvExporter.java");
		
		BufferedWriter csvFileOutputStream = null;
	    //String currentPath = CsvExporter.class.getResource("/").getPath().replaceAll("/WEB-INF/classes/", "").replaceAll("%20", " ");
		String currentPath = CsvExporter.class.getResource("/").getPath().replaceAll("/target/classes/", "/src/main/webapp").replaceAll("%20", " ");
		String fileName = String.valueOf(System.currentTimeMillis());
		String filePath = currentPath + "/csvfiles/" + fileName + ".csv";
		String returnFilePath = "/imis/csvfiles/" + fileName + ".csv";
		
		logger.info("restore csv file path: " + filePath);
		logger.info("return file path: " + returnFilePath);
		
		File csvFile = new File(filePath);
		File parent = csvFile.getParentFile();
		
		if (parent != null && !parent.exists()) {
			parent.mkdirs();
		}
		csvFile.createNewFile();

		csvFileOutputStream = new BufferedWriter(new OutputStreamWriter(
				new FileOutputStream(csvFile), "GB2312"), 1024);
		
		Object object = null;
		StringBuffer titleStringBuffer = null;
		String title = "";
		String row = "";
		
	    if (objectList != null && objectList.size() > 0) {
	    	object = objectList.get(0);
	    	titleStringBuffer = new StringBuffer();
	    	
	    	if (object instanceof Student) {
	    		title = titleStringBuffer.append(ServiceConstant.STU_NO).append(",").append(ServiceConstant.STU_FIRST_NAME).append(",").append(ServiceConstant.STU_MIDDLE_NAME)
	    			.append(",").append(ServiceConstant.STU_LAST_NAME).append(",").append(ServiceConstant.STU_GENDER).append(",")
	    				.append(",").append(ServiceConstant.STU_STATUS).append(",").append(ServiceConstant.STU_TELEPHONE).toString();
	    		
	    		csvFileOutputStream.write(title);
	    		csvFileOutputStream.newLine();
	    		
	    		for (Object objectStudent : objectList) {
	    			Student student = (Student)objectStudent;
	    			StringBuffer rowStringBuffer = new StringBuffer();
	    			
	    			row = rowStringBuffer.append(student.getStudentNo()).append(",").append(student.getFirstName()).append(",").append(student.getMiddleName()).append(",")
	    				.append(student.getLastName()).append(",").append(student.getGender()).append(",").append(student.getStatus()).append(",")
	    					.append(student.getTelephone()).toString();
	    			
	    			csvFileOutputStream.write(row);
	    			csvFileOutputStream.newLine();
	    		}
	    		
	    		
	    	}else if (object instanceof Employer) {
	    		title = titleStringBuffer.append(ServiceConstant.EMP_NAME).append(",").append(ServiceConstant.EMP_CITY).append(",").append(ServiceConstant.EMP_CONTACTOR_FIRST_NAME)
	    			.append(",").append(ServiceConstant.EMP_CONTACTOR_LAST_NAME).append(",").append(ServiceConstant.EMP_CONTACTOR_POSITION).append(",")
	    				.append(ServiceConstant.EMP_ADDRESS).append(",").append(ServiceConstant.EMP_TELEPHONE).append(",").append(ServiceConstant.EMP_POST_CODE)
	    					.append(",").append(ServiceConstant.EMP_WEBSITE).append(",").append(ServiceConstant.EMP_EMAIL).append(",").append(ServiceConstant.EMP_NOTES).toString();
	    		
	    		csvFileOutputStream.write(title);
	    		csvFileOutputStream.newLine();
	    		
	    		for (Object objectEmployer : objectList) {
	    			Employer employer = (Employer)objectEmployer;
	    			StringBuffer rowStringBuffer = new StringBuffer();
	    			
	    			row = rowStringBuffer.append(employer.getEmployerName()).append(",").append(employer.getCity()).append(",").append(employer.getContactorFirstName())
	    					.append(",").append(employer.getContactorLastName()).append(",").append(employer.getContactorPosition()).append(",").append(employer.getAddress())
	    						.append(",").append(employer.getTelephone()).append(",").append(employer.getPostCode()).append(",").append(employer.getWebsite()).append(",")
	    							.append(employer.getEmail()).toString();
	    		
	    			csvFileOutputStream.write(row);
	    			csvFileOutputStream.newLine();
	    		}
	    	}else if (object instanceof Position) {
//	    		title = titleStringBuffer.append(ServiceConstant.POSITION_NAME).append(",").append(ServiceConstant.POSITION_GROUP).append(",").append(ServiceConstant.EMP_NAME)
//	    			.append(",").append(ServiceConstant.POSITION_DESCRIPTION).append(",").append(ServiceConstant.POSITION_REQUIREMENTS).append(",")
//	    				.append(ServiceConstant.POSITION_RESPONSIBILITIES).append(",").append(ServiceConstant.POSITION_SALARY).toString();
	    	
	    		title = titleStringBuffer.append(ServiceConstant.POSITION_NAME).append(",").append(ServiceConstant.EMP_NAME).toString();
	    		
	    		csvFileOutputStream.write(title);
	    		csvFileOutputStream.newLine();
	    		
	    		for (Object objectPosition : objectList) {
	    			Position position = (Position)objectPosition;
	    			StringBuffer rowStringBuffer = new StringBuffer();
	    			
//	    			row = rowStringBuffer.append(position.getPositionName()).append(",").append(position.getPositionGroup().getName()).append(",")
//	    					.append(position.getEmployer().getEmployerName()).append(",").append(position.getPositionDescription()).append(",").append(position.getRequirements())
//	    						.append(",").append(position.getResponsibilities()).append(",").append(position.getSalary()).toString();
	    			row = rowStringBuffer.append(position.getPositionName()).append(",").append(position.getEmployer().getEmployerName()).toString();
	    		
	    			csvFileOutputStream.write(row);
	    			csvFileOutputStream.newLine();
	    		}
	    	}else if (object instanceof Application) {
	    		title = titleStringBuffer.append(ServiceConstant.STU_NO).append(",").append(ServiceConstant.STU_FIRST_NAME).append(",").append(ServiceConstant.STU_MIDDLE_NAME)
	    			.append(",").append(ServiceConstant.STU_LAST_NAME).append(",").append(ServiceConstant.POSITION_NAME).append(",")
	    				.append(ServiceConstant.EMP_NAME).append(ServiceConstant.APPLICATION_STATUS).toString();
	    	    
	    		csvFileOutputStream.write(title);
	    		csvFileOutputStream.newLine();
	    		
	    		for (Object objectApplication : objectList) {
	    			Application application = (Application)objectApplication;
	    			StringBuffer rowStringBuffer = new StringBuffer();
	    			
	    			row = rowStringBuffer.append(application.getStudent().getStudentNo()).append(",").append(application.getStudent().getFirstName()).append(",")
	    					.append(application.getStudent().getMiddleName()).append(",").append(application.getStudent().getLastName()).append(",")
	    						.append(application.getPosition().getPositionName()).append(",").append(application.getPosition().getEmployer().getEmployerName())
	    							.append(",").append(application.getApplicationStatus()).toString();
	    			
	    			csvFileOutputStream.write(row);
	    			csvFileOutputStream.newLine();
	    		}
	    	
	    	}
	    	
	    }
		
		csvFileOutputStream.flush();
		csvFileOutputStream.close();
		
		logger.info("end to call export in CsvExporter.java");
		return returnFilePath;
	}
	
}
