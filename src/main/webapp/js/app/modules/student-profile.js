/**
 * Created by William Zhang 18/02/16
 */


    define(['jquery', 'bootstrap', 'handlebars', 'validate', 'ajaxHandler',
            'jqueryForm', 'formValidator', 'additionalMethods', 'imis', 'jDataTables'],
        function($, bootstrap, handlebars, validate, ajaxHandler,
                 jqueryForm, formValidator, additionalMethods, imis, jDataTables) {

            "use strict";

            var studentProfile = {};

            studentProfile.View = {
                studentInfoSelectByAdmin : function() {
	            	$('#adminStudentTest tbody').on( 'click', 'tr', function () {
	                       if ( $(this).hasClass('selected') ) {
	                           $(this).removeClass('selected');
	                       }
	                       else {
	                       	$('#adminStudentTest').DataTable().$('tr.selected').removeClass('selected');
	                           $(this).addClass('selected');
	                       }
	                });
                },
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
                exportStudentCSV : function(){
  	                $.ajax({
                        type : "post",
                        dataType : "json",
                        url : "exportStudentCSV",
                        data:{"keyword":$("#adminStudentTest_filter").find("input").val()},
                        success : function(data) {
                            location.href = "downloadCsv?csvFileName=" + data.models.fileName;
                        }
  	 	            });
  	            },
                loadStudentProfile : function(){
                	var a = 0;
                	$.ajax({
				        type: "post",
					    dataType: "json",
				        url: 'getStudentInfo',
				        data: {"studentId":a},
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
                },
                loadStudentProfileByAdmin : function() {
                
	                $('#adminStudentTest').DataTable({
	   			        ajax:  {
	   			        	"url" : "adminStudentInfo",
	   			        	"type" : "get",
	   			        	//"data" : {"groupId" : groupId, "positionStatus" : positionStatus}
	   			        },
	   			        columns: [
	   			            { data: "studentNo" },
	   			            { data: "lastName" },
	   			            { data: "semesterRegistered" },
	   			            { data: "registeredYear"},
	   			            { data: "studentId" }
	   			         ],
	   			         "rowCallback": function(row, data) { //data是后端返回的数据
	   			           $('td:eq(1)', row).html('<a href=getAdminStudentInfo?studentId='+data.studentId+ '>' + data.firstName +'&nbsp' +data.middleName +'&nbsp'+ data.lastName + '</a>');
				           $('td:eq(4)', row).html('<a href=javascript:void(0) onclick=delRow()>delete</a>');
	   			         },
	   			         "order": [[ 0, "asc" ]],
	   			         select: true
	   			    });
                }

            };

            function registerEventListener() {
                $("#studentProfile_submit").click(function () {
                	if (formValidator.getStudentValidator("#studentForm").form() == true){
                		studentProfile.Controller.handleFormSubmit();
                	}
                });

                $("#confirmedSubmit").click(function () {
                    studentProfile.Controller.handleConfirmedSubmit();
                });
                
                $('#exportStudentCSV').click(function(){
                	   studentProfile.Controller.exportStudentCSV();
                });
                
                studentProfile.Controller.loadStudentProfile();
                studentProfile.Controller.loadStudentProfileByAdmin();
                
                studentProfile.View.studentInfoSelectByAdmin();
            }
           
           
            $(function() {
                registerEventListener();
            });

    imis.studentProfile = studentProfile;
    return studentProfile;

});
