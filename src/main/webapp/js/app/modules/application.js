/**
 * Created by William Zhang 18/02/16
 */

require(['../main'], function () {
    require(['jquery', 'bootstrap', 'handlebars', 'validate', 'ajaxHandler',
            'jqueryForm', 'formValidator', 'additionalMethods', 'custom', 'eventHandler',
            'jDataTables'],
        function($, bootstrap, handlebars, validate, ajaxHandler,
                 jqueryForm, formValidator, additionalMethods, custom, eventHandler,
                 jDataTables) {

            "use strict";

            var application = {};
            
            var editor;

            application.View = {
            	 renderPositionStatusList : function(data) {
                	
		            var positionStatusListSource = $("#positionStatusTable").html(),
		                positionStatusListtemplate = handlebars.compile(positionStatusListSource),
		                positionStatusListHtml = null,
		                positionList = data.models.positionStatusList;
		                
		            //$("#positionStatusList").empty();
		               
		            for (var index in positionList){
		                handlebars.registerHelper("positionStatus",function(){
		                    
		                    if (positionList[index].application == null) {
		                    	return 'New';	
		                    }
		                    else if (positionList[index].application.applicationStatus == 1) {
		                    	return 'In process';
		                    }
		                    else if (positionList[index].application.applicationStatus == 2) {
		                    	return 'Success';
		                    }
		                    else if (positionList[index].application.applicationStatus == 3) {
		                    	return 'Rejected';
		                    }
		                });
		                
			            positionStatusListHtml = positionStatusListtemplate(positionList[index]);
				        $("#positionStatusList").append(positionStatusListHtml);
				        $("#positionStatusList").append("</tbody></table>")
		            }
                }
            };

            application.Controller = {
                loadPostionStatusList : function(){
                	tableDemo();
                },
                positionApply : function(){
                	
                	$.ajax({
				        type: "post",
					    dataType: "json",
				        url: 'positionApply',
				        data : "positionId=" + $("#positionId").attr("value"),
				        success: function(data) {
				        	application.Controller.loadPostionStatusList();
				        	location.href = "user-center";
				        }
				    });
                },
                exportCSV : function(){
	                $.ajax({
	                        type : "post",
	                        dataType : "json",
	                        url : "exportCSV",
	                        success : function(data) {
	                            location.href = "downloadCsv?csvFileName=" + data.models.fileName;
	                        }
	                });
                }
            };

            function registerEventListener() {
                $("#positionApplicationTab").click(function(){
                	application.Controller.loadPostionStatusList();
                });
                
                $("#confirmApply").click(function(){
                	application.Controller.positionApply();
                });
                
                $("#positionApply").click(function(){
                	$("#myModalTrigger").click();
                });
                
                $("#cancelApply").click(function(){
                	location.href = "user-center";
                });
                
                $('#searchPosition').click(function(){
                	application.Controller.loadPostionStatusList();
                });
                
                $('#exportCSV').click(function(){
                	application.Controller.exportCSV();
                });
                
                tableDemo();
                
                //eventHandler.subscribe("application:confirmApply", application.Controller.positionApply);
            }
            
            function tableDemo() {
            	
            	var groupId = $('#employerGroup').find("option:selected").val();
                var positionStatus = $('#positionStatus').find("option:selected").val();
                
			    $('#example').DataTable({
			        ajax:  {
			        	"url" : "getPostionStatusList",
			        	"type" : "post",
			        	"data" : {"groupId" : groupId, "positionStatus" : positionStatus}
			        	//"dataSrc": "data"
			        },
			        columns: [
			            { data: "positionName" },
			            { data: "employer.employerName" },
			            { data: null, render: 
			                function ( data, type, row ) {
				            	var result;
				            	
				            	if (data.application == null)
				            		result = 'New'; 
				            	else if (data.application.applicationStatus == 1)
				                	result = 'In process';
				                else if (data.application.applicationStatus == 2)
				                	result = 'Success';
				                else if (data.application.applicationStatus == 3)
				                    result = 'Regected';
				                return result;
			                }  
			            }
			            
			        ],
			        rowCallback : function(row, data) {
			        	$('td:eq(0)', row).html('<a href=positionDetail?positionId='+ data.positionId + '>' + data.positionName + '</a >');
			        },
			        select: true
			    } );
			 
			    //table.buttons().container().appendTo($('.col-sm-6:eq(0)', table.table().container()));
            	
            }


            $(function() {
                registerEventListener();
            });

    imis.application = application;
    return application;

    });
});
