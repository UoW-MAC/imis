/**
 * Created by Freya He 29/01/16
 */
require(['../main'], function () {
    require(['jquery', 'bootstrap', 'ajaxHandler'],
        function($, bootstrap, ajaxHandler) {

            "use strict";

            var employerDetail = {};
            
            employerDetail.View = {
                getEmployerGroupView : function(options) {
    				var employerGroupSelect = $('#employerGroupSelect');
    				$('#employerGroupSelect' + ' option').remove();
    				for (var i = 0; i < options.length; i++) {
    					var optionText = options[i].employerGroupType;
    					var optionValue = options[i].employerGroupId;
    					var option = "<option value=" + optionValue + ">"
    							+ optionText + "</option>";
    					$('#employerGroupSelect').append(option);

    				}
    			}
            };
            employerDetail.Controller = {
            		getEmployerGroup : function() {
        				$.ajax({
        					type : "get",
        					dataType : "json",
        					url : 'getEmployerGroup',
        					success : function(data) {
        						employerDetail.View.getEmployerGroupView(data);
        					}
        				});
        			},
                
                handleAdminEmployerConfirmedSubmit: function(){
                    $("#editEmployerForm").submit();
                }
               
            };
            function registerEventListener() {
                employerDetail.Controller.getEmployerGroup();
                $("#editEmployer").click(function(){
                	$("#myModalTrigger6").click();
                });
                $("#confirmEmployerEdit").click(function(){
                	employerDetail.Controller.handleAdminEmployerConfirmedSubmit();
                });
            }

            $(function() {
                registerEventListener();
            });
    });
});