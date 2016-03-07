package com.imis.domain.entities;

import java.io.Serializable;

/**
 * @author william zhang
 *
 */
public class PositionGroup implements Serializable{
	
	private static final long serialVersionUID = -8912396103619326281L;
	
	private Long positionGroupId;
	private String positionGroupName;
	public Long getPositionGroupId() {
		return positionGroupId;
	}
	public void setPositionGroupId(Long positionGroupId) {
		this.positionGroupId = positionGroupId;
	}
	public String getPositionGroupName() {
		return positionGroupName;
	}
	public void setPositionGroupName(String positionGroupName) {
		this.positionGroupName = positionGroupName;
	}
	

	
}
