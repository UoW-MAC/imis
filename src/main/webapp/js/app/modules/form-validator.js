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
                userName: {
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
    formValidator.getEmployerValidator = function(formName){
        var validator = $(formName).validate({
            errorElement:"em",
            rules: {
                employerName: {
                    required: true,
                    maxlength: 100,
                    remote:{                                          
                        type:"POST",
              			url:"employerNameValidation",
               			data:{
                 			employerName:function(){return $("#employer_name").val();},
                 			address:function(){return $("#address").val();}
               			}
              		} 
                },
                employerAddress: {
                    required: true,
                },
                employerCity: {
                    required: true,
                }, 
                employerPostCode: {
                    required: true,
                }, 
                employerCountry: {
                    required: true,
                }, 
                contactorFirstName: {
                    required: true,
                }, 
                contactorLastName: {
                    required: true,
                }, 
                contactorPosition: {
                    required: true,
                }, 
                employerTelephone: {
                    required: true,
                }, 
                employerWebsite: {
                    required: true,
                },
                employerGroup: {
                    required: true,
                }
            },
            messages: {
            	employerName: {
                    required: "Please enter your company name.",
                    remote: "The user name has existed, please enter a new one."
                },
                employerAddress: {
                	required: "Please enter your Company Address.",
                },
                employerCity: {
                	required: "Please enter your Company City.",
                },
                employerPostCode: {
                	required: "Please enter your Company PostCode.",
                },
                employerCountry: {
                	required: "Please enter your Company Country.",
                },
                contactorFirstName: {
                	required: "Please enter your Contactor FirstName.",
                },
                contactorLastName: {
                	required: "Please enter your Contactor LastName.",
                },
                contactorPosition: {
                	required: "Please enter your Contactor Position.",
                },
                employerTelephone: {
                	required: "Please enter your Company Telephone.",
                },
                employerWebsite: {
                	required: "Please enter your Company Website.",
                },
                employerGroup: {
                    required: "Please choose your Employer Group."
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
    formValidator.getPositionValidator = function(formName){
        var validator = $(formName).validate({
            errorElement:"em",
            rules: {
                positionName: {
                    required: true,
                    maxlength: 100,
                },
                positionDescription: {
                    required: true,
                },
                responsibilities: {
                    required: true,
                }, 
                requirements: {
                    required: true,
                }, 
                salary: {
                    required: true,
                }, 
                positionGroup: {
                    required: true,
                }
            },
            messages: {
            	positionName: {
                    required: "Please enter your company name.",
                },
                positionDescription: {
                	required: "Please enter your Position Description.",
                },
                responsibilities: {
                	required: "Please enter your Position responsibilities.",
                },
                requirements: {
                	required: "Please enter your Position requirements.",
                },
                salary: {
                	required: "Please enter your Position salary.",
                },
                positionGroup: {
                    required: "Please choose your Position Group."
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
    formValidator.getStudentValidator = function(formName){
        var validator = $(formName).validate({
            errorElement:"em",
            rules: {
            	studentNo: {
                    required: true,
                    maxlength: 100,
                    remote:{                                          
                        type:"POST",
              			url:"employerNameValidation",
               			data:{
                 			userName:function(){return $("#userName").val();}
               			}
              		} 
                },
                firstName: {
                    required: true,
                },
                middleName: {
                    required: true,
                }, 
                lastName: {
                    required: true,
                }, 
                gender: {
                    required: true,
                },
                semesterRegistered: {
                    required: true,
                },
                registeredYear: {
                    required: true,
                },
                gender: {
                    required: true,
                },
                status: {
                    required: true,
                },
                gender: {
                    required: true,
                }
            },
            messages: {
            	positionName: {
                    required: "Please enter your company name.",
                    remote: "The user name has existed, please enter a new one."
                },
                positionDescription: {
                	required: "Please enter your Position Description.",
                },
                responsibilities: {
                	required: "Please enter your Position responsibilities.",
                },
                requirements: {
                	required: "Please enter your Position requirements.",
                },
                positionGroup: {
                    required: "Please choose your Position Group."
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
