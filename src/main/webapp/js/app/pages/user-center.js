/**
 * Created by William on 11/27/14.
 */
require(['../main'], function () {
    require(['jquery', 'bootstrap', 'handlebars',  'validate', 'ajaxHandler',
            'formValidator', 'additionalMethods', 'pagination', 'selector', 'jqueryForm',
             'eventHandler','studentProfile','position','employer', 'application'],
        function($, bootstrap, handlebars, validate, ajaxHandler,
                 formValidator, additionalMethods, pagination, selector, jqueryForm,
                  eventHandler, studentProfile,position,employer,application ) {

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
