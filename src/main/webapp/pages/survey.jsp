<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--doctype html-->
<html>
	<head>
		<meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <!--
        <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE8" />
        -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Student Pre-Internship Survey</title>

        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
        <script src="js/lib/html5shiv.min.js"></script>
        <script src="js/lib/respond.min.js"></script>
        <![endif]-->
    
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css">
        <link href="css/custom.css" rel="stylesheet" type="text/css">
        <link href="css/validation.css" rel="stylesheet">
        <!--[if IE 8]>
        <link href="css/ie8.css" rel="stylesheet" type="text/css">
        <![endif]-->


	</head>

	<body>
    <jsp:include page='header.jsp'/>
    
    <!-- PAGE TITLE -->
    <div class="page-title withOutTitle">    	
    </div>
    <!-- /PAGE TITLE -->
    
    <!-- CONTENT SECTION -->
    <section class="contentSection">
    	<div class="container">
            <div class="row">
                <span class="col-sm-9 rightBorder equalCol">
                    <h3 class="borderBottom">Student Pre-Internship Survey</h3>
                    <form class="surveyForm" id="surveyForm" role="form" action="makeSurvey" method="post">
                        <div class="row">
                            <aside class="userFormCol-1">Student ID</aside>
                            <aside class="userFormCol-right"><input type="text" class="width-330" id="student_no" name="studentNo"></aside>
                        </div>
                        <div class="row">
                            <aside class="userFormCol-1">First Name</aside>
                            <aside class="userFormCol-right"><input type="text" class="width-330" id="first_name" name="firstName" ></aside>
                        </div>
                         <div class="row">
                            <aside class="userFormCol-1">Middle Name</aside>
                            <aside class="userFormCol-right"><input type="text" class="width-200" id="middle_name" name="middleName" ></aside>
                        </div>
                         <div class="row">
                            <aside class="userFormCol-1">Last Name</aside>
                            <aside class="userFormCol-right"><input type="text" class="width-330" id="last_name" name="lastName" ></aside>
                        </div>
                         <div class="row">
                            <aside class="userFormCol-1">Email</aside>
                            <aside class="userFormCol-right"><input type="text" class="width-330" id="email" name="email" ></aside>
                        </div>
                         <div class="row">
                            <aside class="userFormCol-1">Telephone</aside>
                            <aside class="userFormCol-right"><input type="text" class="width-330" id="telephone" name="telephone" ></aside>
                        </div>
                        <div>
                            <div>Status</div>
                            <div class="radioRow">
                            	<span class="radioCustom"><input type="radio" name="status" value="0"><label>International Student</label></span>
                            	<span class="radioCustom"><input type="radio" name="status" value="1"><label>Permanent Resident/Citizen</label></span>
                            </div>
                        </div>
                        <div>
                            <div>Gender</div>
                            <div class="radioRow">
                            	<span class="radioCustom"><input type="radio" name="gender" value="Male"><label>Male</label></span>
                            	<span class="radioCustom"><input type="radio" name="gender" value="Female"><label>Female</label></span>
                            </div>
                        </div>
                        <div class="row">
                            <input type="button" id="surveyForm_submit" value="submit"/>
                        </div>
                    </form>
                </span>

                <!-- Button trigger modal -->
                <button type="button" id="surveyModelTrigger" data-toggle="modal" data-target="#surveyModel" style="display:none"></button>

                <!-- Project Application Page-Confirm Modal -->
                <div class="modal fade" id="surveyModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" id="myModalLabel">please....</h4>
                            </div>
                            <div class="modal-body">
                                Do you want to submit?
                            </div>
                            <div class="buttonsRow">
                                <button type="submit" class="orange-bt" id="confirmedSubmit">submit</button>
                                <button type="button" class="white-bt" data-dismiss="modal">cancel</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- /CONTENT SECTION -->

    <jsp:include page='footer.jsp'/>
    <script data-main="js/app/pages/survey" src="js/lib/require-2.1.15.min.js"></script>
 </body>
</html>