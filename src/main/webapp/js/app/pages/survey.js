/**
 * Created by William Zhang 18/01/16
 */

require(['../main'], function () {
    require(['jquery', 'bootstrap', 'handlebars', 'survey', 'login', 'validate', 'ajaxHandler',
            'jqueryForm', 'formValidator', 'selector', 'additionalMethods', 'custom'],
        function($, bootstrap, handlebars, survey, login, validate, ajaxHandler,
                 jqueryForm, formValidator, selector, additionalMethods, custom) {

            "use strict";

            var surveyForm = {};

            surveyForm.Model = {};

            surveyForm.View = {
                surveyFormSubmit: $("#surveyForm_submit"),
                enableSubmitButton: function() {
                    surveyForm.View.surveylicationFormSubmit.removeClass("disabled");
                },
                disableSubmitButton: function() {
                    surveyForm.View.surveyFormSubmit.addClass("disabled");
                }
            };

            surveyForm.Controller = {
                handleFormSubmit: function(){
                    if ($("#surveyForm_submit").hasClass("disabled") == true)
                    { 
                        return;
                    }
                    $("#surveyModelTrigger").click();
                },
                handleConfirmedSubmit: function(){
                    $("#surveyForm").submit();
                }
            };

            function registerEventListener() {
                $("#surveyForm_submit").click(function () {
                    surveyForm.Controller.handleFormSubmit();
                });

                $("#confirmedSubmit").click(function () {
                    surveyForm.Controller.handleConfirmedSubmit();
                });
            }

            $(function() {
                selector.initSelect('select');
                registerEventListener();
            });

    imis.surveyForm = surveyForm;
    return surveyForm;

    });
});
