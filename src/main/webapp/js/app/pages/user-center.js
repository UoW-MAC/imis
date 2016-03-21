/**
 * Created by William on 11/27/14.
 */
require(['../main'], function () {

    require(['jquery', 'bootstrap', 'handlebars', 'validate', 'ajaxHandler',
            'formValidator', 'additionalMethods', 'jqueryForm',
            'eventHandler', 'studentProfile', 'position', 'imis', 'employer','jDataTables'],
            
        function($, bootstrap, handlebars, validate, ajaxHandler,
                 formValidator, additionalMethods, jqueryForm,
                 eventHandler, studentProfile, position, imis, employer, jDataTables) {

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
