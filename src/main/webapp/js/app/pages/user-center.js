/**
 * Created by William on 11/27/14.
 */
require(['../main'], function () {

    require(['jquery', 'bootstrap', 'handlebars', 'validate', 'ajaxHandler',
            'formValidator', 'additionalMethods', 'jqueryForm',
            'eventHandler', 'studentProfile', 'position', 'imis', 'employer','jDataTables'],
            
        function($, bootstrap, handlebars, validate, ajaxHandler,
                 formValidator, additionalMethods, jqueryForm,
                 eventHandler, studentProfile, position, imis, employer, jDataTables) {

            "use strict";

            var userPersonalCenter = {};
            userPersonalCenter.Model = {};
            userPersonalCenter.View = {
            };

            userPersonalCenter.init = function(){
            	if ($("#menuSwitch").val() == "position") {
					$("#positionApplicationMenu").addClass("active");
                	$("#studentProfileMenu").removeClass("active");
                	$("#positionApplicationTabPane").addClass("active");
                	$("#studentProfileTabPane").removeClass("active");
            	}else if($("#menuSwitch").val() == "adminPosition"){
            		$("#positionManagementMenu").addClass("active");
            		$("#positionProfileMenu").addClass("active");
                	$("#studnetManagementMenu").removeClass("active");
                	$("#applicationManagementMenu").removeClass("active");
                	$("#employerManagementMenu").removeClass("active");
                	$("#employerProfileMenu").removeClass("active");
                	$("#positionManagementTabPane").addClass("active");
                	$("#positionProfileTabPane").addClass("active");
                	$("#studentManagementTabPane").removeClass("active");
                	$("#applicationManagementTabPane").removeClass("active");
                	$("#employerManagementTabPane").removeClass("active");
                	$("#employerProfileTabPane").removeClass("active");
            	}else if($("#menuSwitch").val() == "adminEmployer"){
            		$("#employerManagementMenu").addClass("active");
            		$("#positionManagementMenu").removeClass("active");
                	$("#studnetManagementMenu").removeClass("active");
                	$("#applicationManagementMenu").removeClass("active");
                	$("#employerManagementTabPane").addClass("active");
                	$("#studentManagementTabPane").removeClass("active");
                	$("#positionManagementTabPane").removeClass("active");
                	$("#applicationManagementTabPane").removeClass("active");
            	}else if($("#menuSwitch").val() == "employerCandidate"){
            		$("#positionProfileMenu").addClass("active");
            		$("#employerProfileMenu").removeClass("active");
                	$("#positionProfileTabPane").addClass("active");
                	$("#employerProfileTabPane").removeClass("active");
            	}
            }

            $(function() {
                eventHandler.registerEventListener();
                userPersonalCenter.init();
            })

            imis.UserPersonalCenter = userPersonalCenter;
            return userPersonalCenter;
        });
});
