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
                	                  },
                	exportApplicationCSV : function(){
                      	                $.ajax({
                      	 	                        type : "post",
                      	 	                        dataType : "json",
                      	 	                        url : "exportApplicationCSV",
                      	 	                        success : function(data) {
                      	 	                            location.href = "downloadCsv?csvFileName=" + data.models.fileName;
                      	 	                        }
                      	 	                });
                      	                  },
                handleConfirmedSubmit: function(){
                    $("#editForm").submit();


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

                $("#confirmEdit").click(function(){
                	application.Controller.handleConfirmedSubmit();
                });

                $("#editPosition").click(function(){
                	$("#myModalTrigger2").click();
                });

                $("#cancelApply").click(function(){
                	location.href = "user-center";
                });
                $('#searchPosition').click(function(){
                	application.Controller.loadPostionStatusList();
                });

                application.Controller.loadPostionStatusList();
                $('#adminApplicationTest').DataTable({
               	 ajax:  {
			        	"url" : "canditateInfo",
			        	"type" : "get",
			        	"data" : {"positionId" : 0}
			        },
			        columns: [
			            { data: "application.applicationId" },
			            { data: "studentId" },
			            { data:  "position.positionName"},
			            { data:  "employer.employerName"},
			            { data: null, render:
			                function ( data, type, row ) {
			            	var result;
			            	if (data.application == null)
			            		result = 'New';
			            	else if (data.application.applicationStatus == 1)
			                	result = 'unread';
			                else if (data.application.applicationStatus == 2)
			                	result = 'accept';
			                else if (data.application.applicationStatus == 3)
			                    result = 'reject';
			                return result;
		                	}
			            },
			            { data:null,render:function(data){
			            	function add0(m){return m<10?'0'+m:m };
			            	var time = new Date(data.application.updateTime);
			            	var y = time.getFullYear();
			            	var m = time.getMonth()+1;
			            	var d = time.getDate();
			            	var h = time.getHours();
			            	var mm = time.getMinutes();
			            	var s = time.getSeconds();
			            	return y+'-'+add0(m)+'-'+add0(d)+' '+add0(h)+':'+add0(mm)+':'+add0(s);
		            	}
		            },
		            { data:  "studentId"},
			        ],
			        "rowCallback": function(row, data) { //data是后端返回的数据
			              $('td:eq(1)', row).html( data.firstName +'&nbsp' +data.middleName +'&nbsp'+ data.lastName);
			              $('td:eq(6)', row).html('<a href=javascript:void(0) onclick=delApplicationRow()>delete</a>');
			        },
			        select: true
			    } );
                $('#adminApplicationTest tbody').on( 'click', 'tr', function () {
                    if ( $(this).hasClass('selected') ) {
                        $(this).removeClass('selected');
                    }
                    else {
                    	$('#adminApplicationTest').DataTable().$('tr.selected').removeClass('selected');
                        $(this).addClass('selected');
                    }
                } );
                //eventHandler.subscribe("application:confirmApply", application.Controller.positionApply);
			    $('#exportCSV').click(function(){
			    	                 	application.Controller.exportCSV();
			    	                 });
			    //table.buttons().container().appendTo($('.col-sm-6:eq(0)', table.table().container()));
			    $('#exportApplicationCSV').click(function(){
                 	application.Controller.exportApplicationCSV();
                 });
            }









            $(function() {
                registerEventListener();

            });

    imis.application = application;
    return application;

    });
});
