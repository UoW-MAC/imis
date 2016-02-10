package com.imis.presentation.controller;


import java.util.HashMap;
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

import com.imis.domain.entities.User;
import com.imis.domain.valuetypes.ResponseStatus;
import com.imis.presentation.model.Response;
import com.imis.service.IUserService;

/**
 * @author william zhang
 */
@Controller
public class LoginController {
	private static final Logger logger = Logger.getLogger(LoginController.class);
    private static final String LOGIN_PAGE = "login";
    private static final String USER_CENTER_PAGE = "user-center";
    private static final String HOME_PAGE = "home";

    @Resource
    private IUserService userService;

    @RequestMapping(value = "home", method = RequestMethod.GET)
    public ModelAndView show() {
        return new ModelAndView(HOME_PAGE);
    }

    @RequestMapping(value = "makeRegister", method = RequestMethod.POST)
    public @ResponseBody Response handleRegister(@ModelAttribute("registerForm") User user) {
    	Map<String, Object> models = null;
    	
    	try {
    		userService.register(user);
    		models = new HashMap<String, Object>();
            models.put("redirect", USER_CENTER_PAGE);
    		
    	}catch(Exception ex) {
    		return new Response(
    				ResponseStatus.FAILURE.getStatusCode(),
                    ResponseStatus.FAILURE.getStatusDescription(),
                    null);
    	}
        
        return new Response(
                ResponseStatus.SUCCESS.getStatusCode(),
                ResponseStatus.SUCCESS.getStatusDescription(),
                models);
    }
    
    @RequestMapping(value = "userNameValidation", method = RequestMethod.POST)
    public @ResponseBody
    boolean userNameValidation(HttpServletRequest request) {
        return true;
    }
    
    @RequestMapping(value = "emailValidation", method = RequestMethod.POST)
    public @ResponseBody
    boolean emailValidation(HttpServletRequest request) {
        return true;
    } 
    
    @RequestMapping(value = "user-center", method = RequestMethod.GET)
    public ModelAndView showUserCenter() {
        return new ModelAndView(USER_CENTER_PAGE);
    }
    
    @RequestMapping(value = "access-denied", method = RequestMethod.GET)
    public ModelAndView handleAccessDenied() {
        Map<String, Object> models = new HashMap<String, Object>();
        models.put("access-denied", "access-denied");
        return new ModelAndView(LOGIN_PAGE, models);
    }

    @RequestMapping(value = "login-success", method = RequestMethod.POST)
    public @ResponseBody
    Response handleLoginSuccessOnPost(HttpServletRequest request) {
        return handleLoginSuccess(request);
    }

    @RequestMapping(value = "login-success", method = RequestMethod.GET)
    public @ResponseBody
    Response handleLoginSuccess(HttpServletRequest request) {
        Map<String, Object> models = new HashMap<String, Object>();
        models.put("redirect", USER_CENTER_PAGE);
        return new Response(
                ResponseStatus.LOGIN_SUCCESS.getStatusCode(),
                ResponseStatus.LOGIN_SUCCESS.getStatusDescription(),
                models);
    }

    @RequestMapping(value = "login-failure", method = RequestMethod.POST)
    public @ResponseBody
    ModelAndView handleLoginFailureOnPost(HttpServletRequest request) {
        return handleLoginFailure(request);
    }

    @RequestMapping(value = "login-failure", method = RequestMethod.GET)
    public ModelAndView handleLoginFailure(HttpServletRequest request) {
    	 return new ModelAndView(LOGIN_PAGE);
    }

}


