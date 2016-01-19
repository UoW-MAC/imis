package com.imis.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.imis.domain.entities.User;
import com.imis.domain.repositories.UserRepository;
import com.imis.service.IUserService;

@Service
@Transactional(rollbackFor = Exception.class)
public class UserServiceImpl implements IUserService {

    @Autowired
    private UserRepository userRepository;

    public List<User> getUserByCondition(Map<String, Object> map) {
        return userRepository.getUserByCondition(map);
    }

    public boolean updatePassword(User user) throws Exception {
        try {
            userRepository.updatePassword(user);
            return true;
        } catch (Exception e) {
            throw e;
        }
    }

    public boolean updateUser(User user) throws Exception {
        try {
            userRepository.updateUserInfo(user);
            return true;
        } catch (Exception e) {
            throw e;
        }
    }

    public List<User> getUserByFuzzyMatch(Map<String, Object> map) {
        return userRepository.getUserByFuzzyMatch(map);
    }

    public int getUserTotalCount(Map<String, Object> map) throws Exception {
        return userRepository.getUserTotalCount(map);
    }

    public String getUserNameByCellphone(String cellphone) throws Exception{
        return userRepository.getUserNameByCellphone(cellphone);
    }
}
