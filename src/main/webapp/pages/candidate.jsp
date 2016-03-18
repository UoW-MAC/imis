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
		<title>Student Center</title>

        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
        <script src="js/lib/html5shiv.min.js"></script>
        <script src="js/lib/respond.min.js"></script>
        <![endif]-->
    
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css">
        <link href="css/custom.css" rel="stylesheet" type="text/css">
        <link href="css/validation.css" rel="stylesheet">
        <link href="css/jquery.dataTables.min.css" rel="stylesheet">
        <!--[if IE 8]>
        <link href="css/ie8.css" rel="stylesheet" type="text/css">
        <![endif]-->


	</head>

	<body>
	<jsp:include page='header.jsp'/>
	
    <!-- CONTENT SECTION -->
    <section class="contentSection">
    	<div class="container">
    	 <input type="hidden" id = "positionId" value="${positionId}"/>
    	<table id="candidateTest" class="display" cellspacing="0" width="100%">
			        <thead>
			            <tr>
			                <th>Application Id</th>
			                <th>StudentName</th>
			                <th>PositionName</th>
			                <th>applicationStatus</th>
			                <th>updateTime</th>
			            </tr>
			        </thead>
			     </table>
    	<%--  <c:forEach var="candidateInfo" items="${candidateInfo}">
                 <tr>
                 <th>${candidateInfo.studentId} </th>
                 <th><a href="canditateDetail?applicationId=${candidateInfo.application.applicationId}&studentId=${candidateInfo.studentId}&positionId=${positionId}">${candidateInfo.firstName}${candidateInfo.middleName}${candidateInfo.lastName}</a> </th>
                <c:if test="${candidateInfo.status==0}"> <th>International Student</th></c:if>
                <c:if  test="${candidateInfo.status==1}"><th>Permanent Resident/Citizen</th></c:if>
                 <c:if test="${candidateInfo.application.applicationStatus==1}"> <th>unread</th></c:if>
                 <c:if test="${candidateInfo.application.applicationStatus==2}"> <th>accept</th></c:if>
                 <c:if test="${candidateInfo.application.applicationStatus==3}"> <th>reject</th></c:if>
                    <th>${candidateInfo.application.updateTime}</th>
                 </tr>
            </c:forEach> --%>
        </div>
    </section>
    
 </body>
 <script data-main="js/app/pages/candidate" src="js/lib/require-2.1.15.min.js"></script>
</html>