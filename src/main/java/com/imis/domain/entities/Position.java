package com.imis.domain.entities;

import java.io.Serializable;

/**
 * @author william zhang
 *
 */
public class Position implements Serializable{

	private static final long serialVersionUID = 6267272562976652479L;
	
	private Long positionId;
	private String type;
	
	public Long getPositionId() {
		return positionId;
	}
	public void setPositionId(Long positionId) {
		this.positionId = positionId;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
}
