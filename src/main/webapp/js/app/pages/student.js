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
                }
            };

            function registerEventListener() {
                $("#studentForm_submit").click(function () {
                    studentForm.Controller.handleFormSubmit();
                });

                $("#confirmedSubmit").click(function () {
                    studentForm.Controller.handleConfirmedSubmit();
                });
            }

            $(function() {
                selector.initSelect('select');
                registerEventListener();
            });

    imis.studentForm = studentForm;
    return studentForm;

    });
});
