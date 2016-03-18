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
<title>Position Survey</title>

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
	<section class="contentSection">
		<div class="container">
		<div id="adminEmployerTable">
		<button type="button" id="exportEmployerCSV" data-loading-text="Loading..." class="btn btn-primary" autocomplete="off">
   					Export
 				 </button>
			   <div class="row">
	    	     <table id="adminEmployerTest" class="display" cellspacing="0" width="100%">
			        <thead>
			            <tr>
			                <th>EmployerId</th>
			                <th>EmployerName</th>
			                <th>EmployerGroupName</th>		
			                <th>Position Number</th>		             
			                <th>createTime</th>
			                <th></th>
			            </tr>
			        </thead>
			     </table>
    	     </div>
    	     </div>
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
	function delEmployerRow () {
		 var b= $('#adminEmployerTest').DataTable().row('.selected').data();
		 if(b!=null){
	 		$('#adminStudentTest').DataTable().row('.selected').remove().draw( false );
         $.ajax({
    				type: "get",       
    				dataType: "json",            
    				url: 'deleteStudent',   
    				data:  b,
    				success: function() {     
    			    }      
    	        });       
		 }
      }
 </script>
</html>