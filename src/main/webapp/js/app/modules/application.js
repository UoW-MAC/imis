/**
 * Created by William Zhang 18/02/16
 */

require(['../main'], function () {
    require(['jquery', 'bootstrap', 'handlebars', 'login', 'validate', 'ajaxHandler',
            'jqueryForm', 'formValidator', 'selector', 'additionalMethods', 'custom', 'eventHandler'],
        function($, bootstrap, handlebars, login, validate, ajaxHandler,
                 jqueryForm, formValidator, selector, additionalMethods, custom, eventHandler) {

            "use strict";

            var application = {};

            application.View = {
            	 renderPositionStatusList : function(data) {
                	
		            var positionStatusListSource = $("#positionStatusTable").html(),
		                positionStatusListtemplate = handlebars.compile(positionStatusListSource),
		                positionStatusListHtml = null,
		                positionList = data.models.positionStatusList;
		               
		            
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

            application.Controller = {
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
                
                $('.dropdown-toggle').dropdown();
                
                //eventHandler.subscribe("application:confirmApply", application.Controller.positionApply);
            }


            $(function() {
                registerEventListener();
              
            });

    imis.application = application;
    return application;

    });
});
