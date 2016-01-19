define('imis', ['jquery'], function($) {

    "use strict";

    var imis = {};
    imis.Model = {};

    function showWelcome(){
        $.ajax({
            type: "POST",
            url: "login/userName",
            dataType: "json",
            data: {},
            success: function (response) {
                if (response.statusCode < 2000) {
                    $("#welcome").text("欢迎 " + response.models.userName);
                } else {
                }
            },
            fail: function (response) {
            }
        });
    }

    $(function() {
        showWelcome();
    });

    window.imis = imis;
    return imis;

});