/**
 * Created by Freya He 29/01/16
 */
require(['../main'], function () {
    require(['jquery', 'bootstrap', 'ajaxHandler', 'handlebars', 'jqueryForm'],
        function($, bootstrap, ajaxHandler,handlebars,jqueryForm) {

            "use strict";

            var studentDetail = {};
            
            studentDetail.View = {};
            studentDetail.Controller = {
            		
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
            			var adminstudentId=0;
                    	if($("#adminstudentId").val()!=null){
                    		var adminstudentId = $("#adminstudentId").val();
                    	}
                    	$.ajax({
    				        type: "post",
    					    dataType: "json",
    				        url: 'getStudentInfo',
    				        data: {"studentId":adminstudentId},
    				        success: function(data) {
    					        var studentProfileSource = $("#studentDetailProfileTable").html(),
    			                	studentProfiletemplate = handlebars.compile(studentProfileSource),
    			                	studentInfoObject = null,
    			                	studentProfileHtml = null;

    		                	if (data.models != null) {

    		                		studentInfoObject = data.models.studentInfo;
    		                	}

    		                	studentProfileHtml = studentProfiletemplate(studentInfoObject);
    					        $("#studentDetailInfoForm").append(studentProfileHtml);

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
            		},
                
            };
            function registerEventListener() {
            	studentDetail.Controller.loadStudentProfile();
            	$("#cancelStudent").click(function(){
            		location.href="user-center";
            	});
            	$("#studentDetailProfile_submit").click(function () {
            		$("#studentDetailModelTrigger").click();
                });

                $("#confirmedStudentDetailSubmit").click(function () {
                	studentDetail.Controller.handleConfirmedSubmit();
                });
            };
            $(function() {
                registerEventListener();
            });
    });
});