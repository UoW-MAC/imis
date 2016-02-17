package com.imis.domain.entities;

import java.io.Serializable;
import java.sql.Timestamp;

/**
 * @author william zhang
 *
 */
public class Application implements Serializable{
	
	private static final long serialVersionUID = -7789710960436175314L;
	
	private int applicationStatus;

	public int getApplicationStatus() {
		return applicationStatus;
	}

	public void setApplicationStatus(int applicationStatus) {
		this.applicationStatus = applicationStatus;
	}
	
}
