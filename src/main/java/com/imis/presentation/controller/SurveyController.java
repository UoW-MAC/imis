package com.imis.presentation.controller;


import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.imis.domain.entities.Student;
import com.imis.service.ISurveyService;


/**
 * @author william zhang
 */
@Controller
public class SurveyController {
	private static final Logger logger = Logger.getLogger(SurveyController.class);
    private static final String HOME_PAGE = "home";
    private static final String SURVEY_PAGE = "survey";
    private static final String SURVEY_COMPLETION_PAGE = "survey-completion-page";

    @Resource
    private ISurveyService surveyService;

    @RequestMapping(value = "home", method = RequestMethod.GET)
    public ModelAndView show() {
        return new ModelAndView(HOME_PAGE);
    }

    @RequestMapping(value = "survey", method = RequestMethod.GET)
    public ModelAndView showLandingPage() {
        Map<String, Object> models = new HashMap<String, Object>();
        return new ModelAndView(SURVEY_PAGE, models);
    }
    
    @RequestMapping(value = "makeSurvey", method = RequestMethod.POST)
    public ModelAndView makeApplication(@ModelAttribute("surveyForm") Student student) throws Exception {

        surveyService.surveySubmit(student);
        return new ModelAndView(SURVEY_COMPLETION_PAGE);
    }
}


