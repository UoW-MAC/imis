
package com.imis.domain.repositories;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.imis.domain.entities.User;

@Repository
@Transactional
public interface UserRepository {
	
	void register(User user);
	void addUserAuthority(User user);
	User getUserByUserName(String userName);
	User getUserByEmail(String email);
	
}

