/**
 * Created by William Zhang 18/02/16
 */

require(['../main'], function () {
    require(['jquery', 'bootstrap', 'handlebars', 'validate', 'ajaxHandler',
            'jqueryForm', 'formValidator', 'selector', 'additionalMethods', 'custom', 'jDataTables'],
        function($, bootstrap, handlebars, validate, ajaxHandler,
                 jqueryForm, formValidator, selector, additionalMethods, custom, jDataTables) {

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
                exportStudentCSV : function(){
  	                $.ajax({
  	 	                        type : "post",
  	 	                        dataType : "json",
  	 	                        url : "exportStudentCSV",
  	 	                        success : function(data) {
  	 	                            location.href = "downloadCsv?csvFileName=" + data.models.fileName;
  	 	                        }
  	 	                });
  	                  },
                loadStudentProfile : function(){
                	var a=0;
                	if($("#adminstudentId").val()!=null){
                		a=$("#adminstudentId").val();
                	}
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
                }
               
            };

            function registerEventListener() {
            	studentProfile.Controller.loadStudentProfile();
            	   $("#studentProfile_submit").click(function () {
                       studentProfile.Controller.handleFormSubmit();
                   });
                   $("#confirmedSubmit").click(function () {
                       studentProfile.Controller.handleConfirmedSubmit();
                   });
                 
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
   			            { data:null,render:function(data){
   			            	function add0(m){return m<10?'0'+m:m };
   			            	var time = new Date(data.updateTime);
   			            	var y = time.getFullYear();
   			            	var m = time.getMonth()+1;
   			            	var d = time.getDate();
   			            	var h = time.getHours();
   			            	var mm = time.getMinutes();
   			            	var s = time.getSeconds();
   			            	return y+'-'+add0(m)+'-'+add0(d)+' '+add0(h)+':'+add0(mm)+':'+add0(s);
   		            		}
   			            },
   			         { data: "studentId" },
   			        ],
   			        "rowCallback": function(row, data) { //data是后端返回的数据
   			           $('td:eq(1)', row).html('<a href=getAdminStudentInfo?studentId='+data.studentId+ '>' + data.firstName +'&nbsp' +data.middleName +'&nbsp'+ data.lastName + '</a>');
			           $('td:eq(4)', row).html('<a href=javascript:void(0) onclick=delRow()>delete</a>');
   			        },
   			        "order": [[ 0, "asc" ]],
   			        select: true
   			    } );
                   $('#adminStudentTest tbody').on( 'click', 'tr', function () {
                       if ( $(this).hasClass('selected') ) {
                           $(this).removeClass('selected');
                       }
                       else {
                       	$('#adminStudentTest').DataTable().$('tr.selected').removeClass('selected');
                           $(this).addClass('selected');
                       }
                   } );
                   $('#exportStudentCSV').click(function(){
                	   studentProfile.Controller.exportStudentCSV();
                    });  
           }
            $(function() {
                registerEventListener();
            });

    imis.studentProfile = studentProfile;
    return studentProfile;

    });
});
