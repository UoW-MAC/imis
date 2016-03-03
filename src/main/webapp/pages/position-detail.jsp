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
        <!--[if IE 8]>
        <link href="css/ie8.css" rel="stylesheet" type="text/css">
        <![endif]-->


	</head>

	<body>
	<jsp:include page='header.jsp'/>
	
    <!-- CONTENT SECTION -->
    <section class="contentSection">
    	<div class="container">
            <div class="row">
                <div id="positionId" value="${positionDetail.positionId}">Position Name: </div>
                <div class="row">
                	${positionDetail.positionName}
                </div>
                <div>Position Description</div>
                <div class="row">
                    ${positionDetail.positionDescription}
                </div>
                <div>Position Responsibilities</div>
                <div class="row">
                    ${positionDetail.responsibilities}
                </div>
                <div>Position Requirements</div>
                <div class="row">
                    ${positionDetail.requirements}
                </div>
                <div>Salary</div>
                <div class="row">
                    ${positionDetail.salary}
                </div>
                <div class="row">
                	<input type="button" id="positionApply" value="Apply"/>
                	<input type="button" id="cancelApply" value="Cancel"/>
                </div>
            </div>
        </div>
    </section>
    
    <sec:authorize access="hasRole('ROLE_STUDENT') and isAuthenticated()">
        <div id="positionDetailPage" role="tabpane" class="tab-pane active">
            <jsp:include page='footer.jsp'/>
        </div>
    </sec:authorize>
    
    <!-- Button trigger modal -->
      <button type="button" id="myModalTrigger" class="btn btn-primary" data-toggle="modal" data-target="#myModal" style="display:none">Submit</button>
      <div class="modal fade in" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                 <div class="modal-header">
                     <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                     <h4 class="modal-title" id="myModalLabel">Tip</h4>
                 </div>
                 <div class="modal-body">Are you sure applying this position?</div>
                  <div class="buttonsRow">
                     <button id="return" type="button" class="white-bt" data-dismiss="modal">Cancel</button>
                     <button type="submit" id="confirmApply" class="orange-bt meta-event-source" meta-event-handler="application:confirmApply">Confirm</button>
                  </div>
            </div>
        </div>
      </div>
 </body>
 <script data-main="js/app/modules/application" src="js/lib/require-2.1.15.min.js"></script>
</html>