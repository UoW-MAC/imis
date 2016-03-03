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
    <!-- CONTENT SECTION -->
    <section class="contentSection">
    	<div class="container">
    		 <div class="row">
		    	<div class="dropdown">
		  			<button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
		    			Employer Group
		    			<span class="caret"></span>
		  			</button>
		  			<ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
					    <li><a href="#">Startup Company</a></li>
					    <li><a href="#">Research Project</a></li>
					    <li><a href="#">MAC Project</a></li>
					    <li><a href="#">Company</a></li>
					    <li><a href="#">Other</a></li>
				    </ul>
		        </div>
		        
		        <div class="dropdown">
		  			<button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
		    			Position Status
		    			<span class="caret"></span>
		  			</button>
		  			<ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
					    <li><a href="#">ALL</a></li>
					    <li><a href="#">Requested</a></li>
					    <li><a href="#">Confirmed</a></li>
					    <li><a href="#">Rejected</a></li>
				    </ul>
		        </div>
		        
		        <button type="button" id="myButton" data-loading-text="Loading..." class="btn btn-primary" autocomplete="off">
  					Search
				</button>
		        
            </div>
        
            <div class="row">
                <span class="col-sm-9 rightBorder equalCol">
                    <div>
	                    <table class="table" id="positionStatusList"> 
				    		<thead> 
				                <tr> 
				                   <th>Position</th> 
				                   <th>Organazation</th> 
				                   <th>Status</th> 
				                </tr> 
				            </thead> 
				            <tbody>
			                     <script id="positionStatusTable" type="text/x-handlebars-template">
			                		<tr> 
			                   		<th><a href="positionDetail?positionId={{positionId}}">{{positionName}}</a></th> 
			                   		<td>{{employer.employerName}}</td>
				                    <td>{{positionStatus}}</td>
					                </tr> 
			                     </script>
                    </div>
                </span>
                
            </div>
        </div>
    </section>
    <input type="hidden" id="positionId"/> 
    
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
</html>