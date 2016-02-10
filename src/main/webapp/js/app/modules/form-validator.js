/**
 * Created by William Zhang on 30/01/15.
 */

define(['jquery', 'imis'], function($, imis) {

    "use strict";

    var formValidator = {};

    formValidator.getRegisterValidator = function(formName){
        var validator = $(formName).validate({
            errorElement:"em",
            rules: {
                userName: {
                    required: true,
                    maxlength: 50,
                    remote:{                                          
                        type:"POST",
              			url:"userNameValidation",
               			data:{
                 			userName:function(){return $("#userName").val();}
               			} 
              		} 
                },
                password: {
                    required: true,
                    minlength: 6,
                    maxlength: 20
                },
                email: {
                    email:true,
                    remote:{                                          
                        type:"POST",
              			url:"emailValidation",
               			data:{
                 			userName:function(){return $("#email").val();}
               			} 
              		} 
                },
                reEmail: {
                    email:true,
                    equalTo:"#email"
                },
                authority: {
                    required: true,
                }
            },
            messages: {
                username: {
                    required: "Please enter your user name.",
                    remote: "The user name has existed, please enter a new one."
                },
                password: {
                    required: "Please enter your password",
                    minlength: $.validator.format("Your password must be at least {0} characters.")
                },
                email: {
                	email: "Please enter a valid email.",
                	remote: "The email has existed, please enter a new one."
                },
                reEmail: {
                	email: "Please enter a valid email.",
                	equalTo: "Your emails do not match. Please try again."
                },
                authority: {
                    required: "Please choose your role."
                }
            },
            success: function(label) {
            },
            errorPlacement:function(error,element) {
                error.insertAfter(element);
            },
            errorContainer: "span.errorMsg",
            errorLabelContainer: $("#loginForm span.errorMsg"),
            wrapper: "span",
            submitHandler:function(form){
                form.submit();
            }
        });
        return validator;
    }
    
    formValidator.getLoginValidator = function(formName){
    	var validator = $(formName).validate({
            errorElement:"em",
            rules: {
                j_username: {
                    required: true,
                    maxlength: 50
                },
                j_password: {
                    required: true,
                    minlength: 6,
                    maxlength: 20
                }
            },
            messages: {
                j_username: {
                    required: "Please enter your user name."
                },
                j_password: {
                    required: "Please enter your password",
                    minlength: $.validator.format("Your password must be at least {0} characters.")
                }
            },
            success: function(label) {
            },
            errorPlacement:function(error,element) {
                error.insertAfter(element);
            },
            errorContainer: "span.errorMsg",
            errorLabelContainer: $("#loginForm span.errorMsg"),
            wrapper: "span",
            submitHandler:function(form){
                form.submit();
            }
        });
        return validator;
    }


    imis.FormValidator = formValidator;
    return formValidator;

});
