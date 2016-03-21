/**
 * Created by William Zhang 18/02/16
 */
            
require(['../main'], function () {
    require(['jquery', 'bootstrap', 'validate', 'ajaxHandler', 'jqueryForm', 'imis'],        
            
        function($, bootstrap,  validate, ajaxHandler, jqueryForm, imis) {

            "use strict";

            var application = {};
            
            application.View = {};

            application.Controller = {
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

                $("#confirmApply").click(function(){
                	application.Controller.positionApply();
                });
                
                $("#positionApply").click(function(){
                	$("#myModalTrigger").click();
                });
                
                $("#cancelApply").click(function(){
                	location.href = "user-center";
                });
            }
            
            $(function() {
                registerEventListener();
            });

    imis.application = application;
    return application;

    });
});
