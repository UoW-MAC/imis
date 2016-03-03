/**
 * Created by William Zhang 18/02/16
 */

require(['../main'], function () {
    require(['jquery', 'bootstrap', 'handlebars', 'login', 'validate', 'ajaxHandler',
            'jqueryForm', 'formValidator', 'selector', 'additionalMethods', 'custom'],
        function($, bootstrap, handlebars, login, validate, ajaxHandler,
                 jqueryForm, formValidator, selector, additionalMethods, custom) {

            "use strict";

            var studentProfile = {};

            studentProfile.View = {
            	
            };

            studentProfile.Controller = {
                handleFormSubmit: function(){
                    $("#studentModelTrigger").click();
                },
                handleConfirmedSubmit: function(){
                    $("#studentForm").submit();
                },
                loadStudentProfile : function(){
                	$.ajax({
				        type: "post",
					    dataType: "json",
				        url: 'getStudentInfo',
				        success: function(data) {
					        var studentProfileSource = $("#studentProfileTable").html(),
			                	studentProfiletemplate = handlebars.compile(studentProfileSource),
			                	studentInfoObject = null,
			                	studentProfileHtml = null;
			                	
		                	if (data.models != null) {
		                		
		                		studentInfoObject = data.models.studentInfo;
		                	}
			                	
		                	studentProfileHtml = studentProfiletemplate(studentInfoObject);
					        $("#studentForm").append(studentProfileHtml);
					        
					        //Notice: loading order
					        if (data.models != null) {
						        if (data.models.studentInfo.semesterRegistered = 'fall') {
		                			$('#fall').parents(".radioCustom").addClass("radioCustom-checked");
		                		}else if (data.models.studentInfo.semesterRegistered = 'winter'){
		                			$('#winter').parents(".radioCustom").addClass("radioCustom-checked");
		                		}
		                		if (data.models.studentInfo.status = '0') {
		                			$('#is').parents(".radioCustom").addClass("radioCustom-checked");
		                		}else if (data.models.studentInfo.status = '1') {
		                			$('#pr').parents(".radioCustom").addClass("radioCustom-checked");
		                		}
		                		if (data.models.studentInfo.gender = 'Male') {
		                			$('#male').parents(".radioCustom").addClass("radioCustom-checked");
		                		}else if (data.models.studentInfo.gender = 'Female') {
		                			$('#female').parents(".radioCustom").addClass("radioCustom-checked");
		                		}
					        }
				        }
				    });
                }
               
            };

            function registerEventListener() {
                $("#studentProfile_submit").click(function () {
                    studentProfile.Controller.handleFormSubmit();
                });

                $("#confirmedSubmit").click(function () {
                    studentProfile.Controller.handleConfirmedSubmit();
                });
                
                studentProfile.Controller.loadStudentProfile();
                
            }


            $(function() {
                registerEventListener();
            });

    imis.studentProfile = studentProfile;
    return studentProfile;

    });
});
