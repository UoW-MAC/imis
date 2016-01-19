/**
 * Created by apple on 11/24/14.
 */
/**
 * Created by Bright Huang on 11/6/14.
 */

require(['../main'], function () {
    require(['jquery', 'bootstrap', 'imis', 'login', 'formValidator', 'additionalMethods', 'custom'],
        function($, bootstrap, imis, login, formValidator, additionalMethods, custom) {

            "use strict";

            var projectLanding = {};

            imis.ProjectLanding = projectLanding;
            return projectLanding;
        });
});
