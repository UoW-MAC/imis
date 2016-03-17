/**
 * Created by William Zhang 18/02/16
 */

require(['../main'], function () {
    require(['jquery', 'bootstrap', 'handlebars', 'validate', 'ajaxHandler',
            'jqueryForm', 'formValidator', 'selector', 'additionalMethods', 'custom'],
        function($, bootstrap, handlebars, validate, ajaxHandler,
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
                	$("#studentForm").ajaxSubmit(function(response) {
	                        if (response.statusCode == 1000){
	                            location.href = "user-center";
	                        }else{
	                            return;
	                        }
                    });
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
					        $("#studentInfoForm").append(studentProfileHtml);
					        
					        //Notice: loading order
					        if (data.models != null) {
						        if (data.models.studentInfo.semesterRegistered == 'fall') {
		                			$('#fall').parents(".radioCustom").addClass("radioCustom-checked");
		                			$('#fall').attr("checked","checked");
		                		}else if (data.models.studentInfo.semesterRegistered == 'winter'){
		                			$('#winter').parents(".radioCustom").addClass("radioCustom-checked");
		                			$('#winter').attr("checked","checked");
		                		}
		                		if (data.models.studentInfo.status == '0') {
		                			$('#is').parents(".radioCustom").addClass("radioCustom-checked");
		                			$('#is').attr("checked","checked");
		                			
		                		}else if (data.models.studentInfo.status == '1') {
		                			$('#pr').parents(".radioCustom").addClass("radioCustom-checked");
		                			$('#pr').attr("checked","checked");
		                		}
		                		if (data.models.studentInfo.gender == 'Male') {
		                			$('#male').parents(".radioCustom").addClass("radioCustom-checked");
		                			$('#male').attr("checked","checked");
		                			
		                		}else if (data.models.studentInfo.gender == 'Female') {
		                			$('#female').parents(".radioCustom").addClass("radioCustom-checked");
		                			$('#female').attr("checked","checked");
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
