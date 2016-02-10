/**
 * Created by william zhang
 */

require(['../main'], function () {
    require(['jquery', 'bootstrap', 'imis', 'login', 'formValidator', 'additionalMethods', 'custom', 'jqueryForm', 'ajaxHandler'],
        function($, bootstrap, imis, login, formValidator, additionalMethods, custom, jqueryForm, ajaxHandler) {

            "use strict";

            var home = {};
            
            home.Model = {};

			home.View = {
				showValidationCodeError: function(message) {
	                    var errorLabel = '<label id="projectAppForm_validationCode-error" class="error" for="projectAppForm_validationCode">' + message + '</label>';
	                    home.View.validationCode.removeClass("error");
	                    home.View.validationCode.removeAttr("aria-invalid");
	
	                    if ( $("#projectAppForm_validationCode-error") !== undefined){
	                        $("#projectAppForm_validationCode-error").text(message);
	                    }else{
	                        home.View.validationCode.after(errorLabel);
	                    }
	                    home.View.validationCode.addClass("error");
	                    home.View.validationCode.attr("aria-invalid", "true");
	                    home.View.validationCode.attr("style", "display: inline-block");
	
	            },
	            showLoginError: function(message) {
		            $('#loginForm .errorMsg span').remove();
		            $('#loginErrorContainer').append('<span><em id="loginError" class="error" style="display: inline;">' + message + '</em></span>');
		            $('#loginForm .errorMsg').show();
                }
	            
			}

            home.Controller = {
		        handleRegisterFormSubmit: function(){
                    if (formValidator.getRegisterValidator("#registerForm").form() == true){
                        $("#registerForm").ajaxSubmit(function(response) {
	                        if (response.statusCode == 1000){
	                            window.location.href = response.models.redirect; 
	                        }else{
	                            $("#registerFormSubmit").after('<label id="update-error" class="update">Register failed</label>');
	                        }
                        });
                    }
                },
                
                handleLoginFormSubmit: function () {
	                if (formValidator.getLoginValidator("#loginForm").form() == true){
	                    ajaxHandler.sendRequest({
	                        type: "POST",
	                        url: "j_spring_security_check",
	                        dataType: "json",
	                        data: {
	                            j_password: $("#j_password").val(),
	                            j_username: $("#j_username").val()
	                            //_spring_security_remember_me: $("#_spring_security_remember_me").prop("checked")
	
	                        },
	                        success: function (response) {
	                            if (response.statusCode < 2000) {
	                                window.location.href = response.models.redirect;
	                            } else {
	                                showLoginError(response.statusDescription);
	                            }
	                        },
	                        fail: function (response) {
	                            showLoginError("Login failed");
	                        }
	                    });
	                }
           	    }
            }

            function registerEventListener() {
            	$("#registerFormSubmit").click(function () {
                    home.Controller.handleRegisterFormSubmit();
                });
                
                $("#loginFormSubmit").click(function () {
                	home.Controller.handleLoginFormSubmit();
                });
            }

            $(function() {
                //selector.initSelect('select');
                registerEventListener();
            });

            imis.home = home;
            return home;
        });
});
