<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<title>Admin Position</title>

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
 <link href="css/jquery.dataTables.min.css" rel="stylesheet">

</head>

<body>
	<!-- CONTENT SECTION -->
	<section class="contentSection" >
		<div class="container">
		<div id="adminPositionTable">
				   <button type="button" id="exportPositionCSV" data-loading-text="Loading..." class="btn btn-primary" autocomplete="off">
   					Export
 				 </button>
			   <div class="row">
	    	     <table id="adminPositionTest" class="display" cellspacing="0" width="100%">
			        <thead>
			            <tr>
			                <th>positionId</th>
			                <th>positionName</th>
			                <th>GroupName</th>
			                <th>EmployerName</th>
			                <th>updateTime</th>
			                <th></th>
			            </tr>
			        </thead>
			     </table>
    	     </div>
    	     </div>
				<!-- <div id="adminAddForm" style="display:none">
				<form class="adminPositionForm" id="adminPositionForm" role="form" action="makePosition" method="post">
						<div class="row">
							<aside class="userFormCol-1">Name</aside>
							<aside class="userFormCol-right">
								<input type="text" class="width-330" id="positionName" name="positionName">
							</aside>
						</div>
						<div class="row">
							<aside class="userFormCol-1">responsibilities</aside>
							<aside class="userFormCol-right">
								<input type="text" class="width-330" id="responsibilities"
									name="responsibilities">
							</aside>
						</div>
						<div class="row">
							<aside class="userFormCol-1">requirements</aside>
							<aside class="userFormCol-right">
								<input type="text" class="width-330" id="requirements"
									name="requirements">
							</aside>
						</div>
						<div class="row">
							<aside class="userFormCol-1">salary</aside>
							<aside class="userFormCol-right">
								<input type="text" class="width-330" id="salary"
									name="salary">
							</aside>
						</div>
						<div class="row">
							<aside class="userFormCol-1">PositionGroup</aside>
							<aside class="userFormCol-right">								
              					<select id="positionGroupSelect" name="positionGroup.positionGroupId">
             				 	</select>
							</aside>
						</div>
						<div class="row">
							<aside class="userFormCol-1">positionDescription</aside>
							<aside class="userFormCol-right">
								<input type="text" class="width-330" id="positionDescription"
									name="positionDescription">
							</aside>
						</div>
						<div class="row">
							<input type="button" id="adminSubmitPosition" value="Submit"/>
							<input type="button" value="cancle" class="btn2" id="adminAddDisplay2"/>
						</div>
					</form>
					</div> -->
			</div>
	</section>
	<!-- /CONTENT SECTION -->
 <!-- Button trigger modal -->
   <!--   <button type="button" id="myModalTrigger4" class="btn btn-primary" data-toggle="modal" data-target="#myModal4" style="display:none">Submit</button>
      <div class="modal fade in" id="myModal4" tabindex="-1" role="dialog" aria-labelledby="myModalLabel4" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                 <div class="modal-header">
                     <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                     <h4 class="modal-title" id="myModalLabel2">Tip</h4>
                 </div>
                 <div class="modal-body">Are you sure to submit this position?</div>
                  <div class="buttonsRow">
                     <button id="return" type="button" class="white-bt" data-dismiss="modal">Cancel</button>
                     <button type="submit" id="adminConfirmSubmit" class="orange-bt meta-event-source" meta-event-handler="position:adminConfirmSubmit">Confirm</button>
                  </div>
            </div>
        </div>
      </div> -->
</body>
<script type="text/javascript"  >
	function delAdminPositionRow () {
		 var b= $('#adminPositionTest').DataTable().row('.selected').data();
		 if(b!=null){
			 $('#adminPositionTest').DataTable().row('.selected').remove().draw( false );
			 $.ajax({
 				type: "get",       
 				dataType: "json",            
 				url: 'deletePosition',   
 				data:  b,
 				success: function() {     
 			    }      
 	        });       
		 }
      }
 </script>
</html>