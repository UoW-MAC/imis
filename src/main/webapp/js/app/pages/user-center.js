/**
 * Created by William on 11/27/14.
 */
require(['../main'], function () {
    require(['jquery', 'bootstrap', 'handlebars', 'validate', 'ajaxHandler', 'imis',
            'formValidator', 'additionalMethods', 'pagination', 'selector', 'jqueryForm',
            'eventHandler', 'studentProfile', 'application'],
        function($, bootstrap, handlebars, validate, ajaxHandler, imis,
                 formValidator, additionalMethods, pagination, selector, jqueryForm,
                 eventHandler, studentProfile, application) {

            "use strict";

            var userPersonalCenter = {};
            userPersonalCenter.Model = {};
            userPersonalCenter.View = {
            };

            userPersonalCenter.init = function(){

                
            }

            $(function() {
                eventHandler.registerEventListener();
                userPersonalCenter.init();
            })

            imis.UserPersonalCenter = userPersonalCenter;
            return userPersonalCenter;
        });
});
