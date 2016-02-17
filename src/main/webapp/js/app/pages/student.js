/**
 * Created by Freya He 29/01/16
 */

require(['../main'], function () {
    require(['jquery', 'bootstrap', 'handlebars', 'student', 'login', 'validate', 'ajaxHandler',
            'jqueryForm', 'formValidator', 'selector', 'additionalMethods', 'custom'],
        function($, bootstrap, handlebars, student, login, validate, ajaxHandler,
                 jqueryForm, formValidator, selector, additionalMethods, custom) {

            "use strict";

            var studentForm = {};

            studentForm.Model = {};

            studentForm.View = {
                studentFormSubmit: $("#studentForm_submit"),
                enableSubmitButton: function() {
                    studentForm.View.studentlicationFormSubmit.removeClass("disabled");
                },
                disableSubmitButton: function() {
                    studentForm.View.studentFormSubmit.addClass("disabled");
                },
                renderPositionStatusList : function(data) {
                	
                	
	            var handleCheckbox = handlebars.compile($("#question-template-checkbox").html()),
	                handleRadio = handlebars.compile($("#question-template-radio").html()),
	                questionObject = null,
	                html = null;
	
	            $("#questionnaire").empty();
	
	            for (var i = 0; i < data.questions.length; i++){
	                handlebars.registerHelper("fromOne",function(){
	                    return i+1;
	                });
	                handlebars.registerHelper("fromZero",function(){
	                    return i;
	                });
	
	                questionObject = data.questions[i];
	                if (questionObject.isSingle == 1){
	                    html = handleRadio(questionObject);
	                }else{
	                    html = handleCheckbox(questionObject);
	                }
	                $("#questionnaire").append(html);
	            }
	
	            $("#questionnaire").find(".checkboxCustom").each(function(){
	                var checkbox = $(this).text();
	                if (checkbox.trim() == ""){
	                    $(this).remove();
	                }
	            });
	
	            $("#questionnaire").find(".radioCustom").each(function(){
	                var radio = $(this).text();
	                if (radio.trim() == ""){
	                    $(this).remove();
	                }
	            });
	
	            $('#questionnaire .radioCustom input').click(function () {
	                $(this).parents(".radioRow").find(".radioCustom").removeClass("radioCustom-checked");
	                $(this).parent(".radioCustom").addClass("radioCustom-checked");
	            });
	
	            $('#questionnaire .checkboxCustom').click(function () {
	                $(this).toggleClass('checkboxCustom-checked');
	                var $checkbox = $(this).find(':checkbox');
	                $checkbox.attr('checked', !$checkbox.attr('checked'));
	            });
                	
                	
                	
                	
                	
                	
                	
                	
                	
                	
                	
                	
                	
                	
                	
                }
            };

            studentForm.Controller = {
                handleFormSubmit: function(){
                    if ($("#studentForm_submit").hasClass("disabled") == true)
                    { 
                        return;
                    }
                    $("#studentModelTrigger").click();
                },
                handleConfirmedSubmit: function(){
                    $("#studentForm").submit();
                },
                loadPostionStatusList : function(){
                	$.ajax({
                      type: "post",
                	  dataType: "json",
                      url: 'getPostionStatusList',
                      success: function(data) {
                        studentForm.View.renderPositionStatusList(data);
                      }
                    });
                }
            };

            function registerEventListener() {
                $("#studentForm_submit").click(function () {
                    studentForm.Controller.handleFormSubmit();
                });

                $("#confirmedSubmit").click(function () {
                    studentForm.Controller.handleConfirmedSubmit();
                });
                
                $("#positonApplication").click(function () {
                    studentForm.Controller.loadPostionStatusList();
                });
            }

            $(function() {
                //selector.initSelect('select');
                registerEventListener();
            });

    imis.studentForm = studentForm;
    return studentForm;

    });
});
