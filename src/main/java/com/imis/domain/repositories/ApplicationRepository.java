package com.imis.domain.repositories;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import com.imis.domain.entities.Application;

/**
 * @author william zhang
 *
 */
@Repository
@Transactional
public interface ApplicationRepository {

	void positionApply(Application application);
	void deleteApplicationInfo(Long applicationId);
	void acceptCandidate(int applicationId);
	void rejectCandidate(int applicationId);
	List<Application> exportApplicationInfo(Map<String,String> map);
	List<Application> getPositionList(Map<String, Object> parms);
	List<Application> getCandidateInfo(Map<String,Integer> positionId);
}
