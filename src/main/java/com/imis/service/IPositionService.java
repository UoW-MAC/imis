package com.imis.service;

import java.util.List;
import java.util.Map;
import com.imis.domain.entities.Position;
import com.imis.domain.entities.Student;

public interface IPositionService {
	public List<Position> getPostionStatusList() throws Exception;

	public boolean positionSubmit(Position position) throws Exception;

	public boolean positionDelete(Long positionId) throws Exception;

	public Map<String, Object> positionObtain() throws Exception;

	public boolean positionUpdate(Position position) throws Exception;

	public List<Position> getPostionStatusList(String groupId, String positionStatus) throws Exception;

	public void positionApply(String positionId) throws Exception;

	public Position getPositionInfo(int positionId) throws Exception;

	public List<Student> candidateObtain(int positionId) throws Exception;

	public Student getCandidateDetail(int studentId) throws Exception;

	public void acceptCandidate(int applicationId) throws Exception;

	public void rejectCandidate(int applicationId) throws Exception;

}
