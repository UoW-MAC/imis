/**
 * Created by Tong Chen 03/03/16
 */

require(['../main'], function () {
    require(['jquery', 'bootstrap', 'handlebars',  'validate', 'ajaxHandler',
            'jqueryForm', 'formValidator', 'additionalMethods', 'custom', 'eventHandler','jDataTables'],
        function($, bootstrap, handlebars, validate, ajaxHandler,
                 jqueryForm, formValidator, additionalMethods, custom, eventHandler,jDataTables) {

            "use strict";

            var candidate = {};
        
            candidate.View = {
            	 renderPositionStatusList : function(data) {
                	
		            var positionStatusListSource = $("#positionStatusTable").html(),
		                positionStatusListtemplate = handlebars.compile(positionStatusListSource),
		                positionStatusListHtml = null,
		                positionList = data.models.positionStatusList;
		               
		            
		            for (var index in positionList){
		                handlebars.registerHelper("positionStatus",function(){
		                    
		                    if (positionList[index].application == 0) {
		                    	return 'New';	
		                    }
		                    else if (positionList[index].application.applicationStatus == 1) {
		                    	return 'In process';
		                    }
		                    else if (positionList[index].application.applicationStatus == 2) {
		                    	return 'Success';
		                    }
		                    else if (positionList[index].application.applicationStatus == 2) {
		                    	return 'Rejected';
		                    }
		                });
		                
			            positionStatusListHtml = positionStatusListtemplate(positionList[index]);
				        $("#positionStatusList").append(positionStatusListHtml);
		            }
		            $("#positionStatusList").append("</tbody></table>");
		           
                }
            };

            candidate.Controller = {
                loadPostionStatusList : function(){
                	$.ajax({
                      type: "post",
                	  dataType: "json",
                      url: 'getPostionStatusList',
                      success: function(data) {
                        application.View.renderPositionStatusList(data);
                      }
                    });
                },
                candidateAccept : function(){
                	$.ajax({
				        type: "get",
					    dataType: "json",
				        url: 'candidateAccept',
				        data:"applicationId="+$('#applicationId').attr('value')+"&positionId="+$('#positionId').attr('value'),
				        success: function(data) {
				        	 location.href="candidate?positionId="+data; 
				        }
				    });
                },
                candidateReject : function(){
                	$.ajax({
				        type: "get",
					    dataType: "json",
				        url: 'candidateReject',
				        data:"applicationId="+$('#applicationId').attr('value')+"&positionId="+$('#positionId').attr('value'),
				        success: function(data) {
				        	 location.href="candidate?positionId="+data; 
				        }
				    });
                }
            };

            function registerEventListener() {
                
                $("#confirmAccept").click(function(){
                	candidate.Controller.candidateAccept();
                });
                $("#confirmReject").click(function(){
                	candidate.Controller.candidateReject();
                });
                
                $("#candidateAccept").click(function(){
                	$("#myAcceptTrigger").click();
                });
                $("#candidateReject").click(function(){
                	$("#myRejectTrigger").click();
                });
                $("#cancelApply").click(function(){
                	location.href = "candidate";
                });
              	var b = $("#positionId").val();
                $('#candidateTest').DataTable({
                	 ajax:  {
 			        	"url" : "canditateInfo",
 			        	"type" : "post",
 			        	"data" : {"positionId" : b}
 			        },
			        columns: [
			            { data: "student.studentNo" },
			            { data:  "position.positionName" },
			            { data: null, render:
			                function ( data, type, row ) {
			            	var result;
			            	if (data.applicationStatus == 0)
			            		result = 'New';
			            	else if (data.applicationStatus == 1)
			                	result = 'Unread';
			                else if (data.applicationStatus == 2)
			                	result = 'Accepted';
			                else if (data.applicationStatus == 3)
			                    result = 'Rejected';
			                return result;
		                	}
			            },
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
			        ],
			        "rowCallback": function(row, data) { //data是后端返回的数据
			              $('td:eq(1)', row).html('<a href=canditateDetail?applicationId='+data.applicationId + '&studentId='+data.student.studentId+'&positionId=' +b+ '>' + data.student.firstName +'&nbsp' +data.student.middleName +'&nbsp'+ data.student.lastName + '</a>');
			        },
			        select: true
			    } );
                $("#cancelCandidate").click(function(){
                	location.href = "user-center?menu=employerCandidate";
                });
                
                $("#candidateDetailPageCancel").click(function(){
                	var positionId = $("#positionId").val();
                	location.href = "candidate?positionId=" + positionId;
                });
            }
            $(function() {
                registerEventListener();
            });
    imis.candidate = candidate;
    return candidate;
    });
});