/**
 * Created by Freya He 29/01/16
 */

    define(['jquery', 'bootstrap', 'handlebars', 'validate', 'ajaxHandler',
            'jqueryForm', 'formValidator', 'additionalMethods','jDataTables'],
        function($, bootstrap, handlebars, validate, ajaxHandler,
                 jqueryForm, formValidator, additionalMethods, jDataTables) {

            "use strict";

            var employerForm = {};
            
            var employerShow = {};
            
            employerForm.View = {
                employerFormSubmit: $("#employerForm_submit"),
                enableSubmitButton: function() {
                    employerForm.View.studentlicationFormSubmit.removeClass("disabled");
                },
                disableSubmitButton: function() {
                    employerForm.View.employerFormSubmit.addClass("disabled");
                },
                
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

    			},
            };
            employerShow.View = {
            		showEmployerInfo: function(data){
            			var employerProfiletemplate = handlebars.compile($("#employer-list").html());
            			var employerInfoObject = null;
            			var employerProfileHtml = null;
            			if (data!= null) {
            				employerInfoObject = data.employer;
            			}
            			employerProfileHtml = employerProfiletemplate(employerInfoObject);
				        $("#employerForm").append(employerProfileHtml);
				        $('#employerGroupSelect').val($('#employerGroupId').val());
            		},
            		employerSelectByAdmin:function(){
            			 $('#adminEmployerTest tbody').on( 'click', 'tr', function () {
                             if ( $(this).hasClass('selected') ) {
                                 $(this).removeClass('selected');
                             }
                             else {
                             	$('#adminEmployerTest').DataTable().$('tr.selected').removeClass('selected');
                                 $(this).addClass('selected');
                             }
                         } );
            		}
            };
            employerForm.Controller = {
            		getEmployerGroup : function() {
        				$.ajax({
        					type : "get",
        					dataType : "json",
        					url : 'getEmployerGroup',
        					success : function(data) {
        						employerForm.View.getEmployerGroupView(data);
        					}
        				});
        			},
        			 exportEmployerCSV : function(){
      	                $.ajax({
      	 	                        type : "post",
      	 	                        dataType : "json",
      	 	                        url : "exportEmployerCSV",
      	 	                        success : function(data) {
      	 	                            location.href = "downloadCsv?csvFileName=" + data.models.fileName;
      	 	                        }
      	 	                });
      	                  },
                handleFormSubmit: function(){
                    if ($("#employerForm_submit").hasClass("disabled") == true)
                    { 
                        return;
                    }
                    $("#employerModelTrigger").click();
                },
                handleConfirmedSubmit: function(){
                    $("#employerForm").submit();
                }
               
               
            };
            employerShow.Controller = {
            		showEmployer: function(){ 
            			$.ajax({
            				type: "get",       
            				dataType: "json",            
            				url: 'showEmployer',   
            				success: function(data) {     
            					employerShow.View.showEmployerInfo(data);
            			    }      
            	        });       
            	},
            	loadEmployerByAdmin:function(){
            		 $('#adminEmployerTest').DataTable({
     			        ajax:  {
     			        	"url" : "showAdminEmployer",
     			        	"type" : "get",
     			        	//"data" : {"groupId" : groupId, "positionStatus" : positionStatus}
     			        },
     			        columns: [
     			            { data: "employerId" },
     			            { data: "employerName" },
     			            { data: "employerGroup.employerGroupType" },
     			            { data: "allPositionNum" },
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
     		            { data: "allPositionNum" },
     			        ],
     			        "rowCallback": function(row, data) { //data是后端返回的数据
     			              $('td:eq(1)', row).html('<a href=employerDetail?employerId='+ data.employerId + '>' + data.employerName + '</a>');
     			              $('td:eq(5)', row).html('<a href=javascript:void(0) onclick=delEmployerRow()>delete</a>');
     			        },
     			        "order": [[ 0, "asc" ]],
     			        select: true
     			    } );
            	}
            };
            function registerEventListener() {
                $("#employerForm_submit").click(function () {
                	if (formValidator.getEmployerValidator("#employerForm").form() == true){
                    employerForm.Controller.handleFormSubmit();
                	}
                });

                $("#confirmedSubmit").click(function () {
                    employerForm.Controller.handleConfirmedSubmit();
                });
                employerForm.Controller.getEmployerGroup();
                employerShow.Controller.showEmployer();
                $('#exportEmployerCSV').click(function(){
                	employerForm.Controller.exportEmployerCSV();
                 });
                employerShow.Controller.loadEmployerByAdmin();
                employerShow.View.employerSelectByAdmin();
            }

            $(function() {
                registerEventListener();
                
            });

});
