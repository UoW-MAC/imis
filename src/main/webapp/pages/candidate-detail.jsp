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
                <input type="hidden" id = "applicationId" value="${applicationId}">
                <input type="hidden" id = "positionId" value="${positionId}">
                        	<aside class="userFormCol-1">Status:</aside>
                        		 <c:if test="${candidateDetail.status==0}"><aside class="userFormCol-right"> International Student</aside></c:if>
                        		 <c:if  test="${candidateDetail.status==1}"><aside class="userFormCol-right">Permanent Resident/Citizen</aside></c:if>
                 </div>
                    	<div class="row">
                        	<aside class="userFormCol-1">Gender:</aside>
                        	<aside class="userFormCol-right">${candidateDetail.gender}</aside>
                        </div>
                        <div class="row">
	                        <aside class="userFormCol-1">Semester Registered:</aside>
	                        <aside class="userFormCol-right">${candidateDetail.semesterRegistered}</aside>
	                    </div>
	                     <div class="row">
	                            	<aside class="userFormCol-1">YEAR:</aside>
	                            	<aside class="userFormCol-right"> ${candidateDetail.registeredYear}</aside>
	                            </div>
	                            <div class="row">
	                            	<aside class="userFormCol-1">Student ID</aside>
	                            	<aside class="userFormCol-right"> ${candidateDetail.studentNo}</aside>
	                        	</div>
	                        	<div class="row">
	                            	<aside class="userFormCol-1">Full Name</aside>
	                            	<aside class="userFormCol-right"> ${candidateDetail.firstName} ${candidateDetail.middleName} ${candidateDetail.lastName}</aside>
	                        	</div>
	                         	<div class="row">
	                            	<aside class="userFormCol-1">Email</aside>
	                            	<aside class="userFormCol-right"> ${candidateDetail.email}</aside>
	                        	</div>
		                        <div class="row">
		                            <aside class="userFormCol-1">Telephone</aside>
		                            <aside class="userFormCol-right"> ${candidateDetail.telephone}</aside>
		                        </div>
	          					<div class="table">
					                 <table width="750px" border="1" cellspacing="0" cellpadding="0">
					                     <tr>
					                     <td></td>
					                     <td><div class="col-md-1">Major</div></td>
					                     <td><div class="col-md-1">GPA</div></td>
					                     <td><div class="col-md-1">University/Organization</div></td>
					                     <td><div class="col-md-1">Country</div></td>
					                     <td><div class="col-md-1">MM/YY</div></td>
					                     </tr>
					                     <tr>
					                     <td>Undergraduate degree (s)</td>
					                     <td><aside class="userFormCol-1"> ${candidateDetail.educationList[0].major}</aside></td>
					                     <td><aside class="userFormCol-1">${candidateDetail.educationList[0].gpa}</aside></td>
					                     <td><aside class="userFormCol-2">${candidateDetail.educationList[0].institution}</aside></td>
					                     <td><aside class="userFormCol-1">${candidateDetail.educationList[0].country} </aside></td>
					                     <td><aside class="userFormCol-1">${candidateDetail.educationList[0].graduationDate}</aside></td>
					                     </tr>
					                     
					                     <tr>
					                     <td>Graduate degree(s)</td>
					                     <td><aside class="userFormCol-1">${candidateDetail.educationList[1].major}</aside></td>
					                     <td><aside class="userFormCol-1">${candidateDetail.educationList[1].gpa}</aside></td>
					                     <td><aside class="userFormCol-2">${candidateDetail.educationList[1].institution}</aside></td>
					                     <td><aside class="userFormCol-1">${candidateDetail.educationList[1].country}</aside></td>
					                     <td><aside class="userFormCol-1">${candidateDetail.educationList[1].graduationDate}</aside></td>
					                     </tr>
					                     <tr>
					                     <td><aside class="userFormCol-5">Other – List any other degrees or certifications you have</aside></td>
					                     <td><aside class="userFormCol-1">${candidateDetail.educationList[2].major}</aside></td>
					                     <td><aside class="userFormCol-1">${candidateDetail.educationList[2].gpa}</aside></td>
					                     <td><aside class="userFormCol-2">${candidateDetail.educationList[2].institution}</aside></td>
					                     <td><aside class="userFormCol-1">${candidateDetail.educationList[2].country}</aside></td>
					                     <td><aside class="userFormCol-1">${candidateDetail.educationList[2].graduationDate}</aside></td>
					                     </tr>
					                     <tr>
					                     <td>Other</td>
					                     <td><aside class="userFormCol-1">${candidateDetail.educationList[3].major}</aside></td>
					                     <td><aside class="userFormCol-1">${candidateDetail.educationList[3].gpa}</aside></td>
					                     <td><aside class="userFormCol-2">${candidateDetail.educationList[3].institution}</aside></td>
					                     <td><aside class="userFormCol-1">${candidateDetail.educationList[3].country}</aside></td>
					                     <td><aside class="userFormCol-1">${candidateDetail.educationList[3].graduationDate}</aside></td>
					                     </tr>
					                </table>
	                            </div>
				                <div class="table">
					                 <table width="750px" border="1" cellspacing="0" cellpadding="0">
					                     <tr>
					                     <td><div class="col-md-1">Company</div></td>
					                     <td><div class="col-md-4">Dates(MM/YY-MM/YY)</div></td>
					                     <td><div class="col-md-1">Title</div></td>
					                     <td><div class="col-md-1">Duties</div></td>
					                     </tr>
					                     <tr>                    
					                     <td><aside class="userFormCol-1">${candidateDetail.workList[0].company}</aside></td>
					                     <td><aside class="userFormCol-4">${candidateDetail.workList[0].dates}</aside></td>
					                     <td><aside class="userFormCol-1">${candidateDetail.workList[0].title}</aside></td>
					                     <td><aside class="userFormCol-1">${candidateDetail.workList[0].duties}</aside></td>
					                     </tr>
					                     
					                     <tr>           
					                     <td><aside class="userFormCol-1">${candidateDetail.workList[1].company}</aside></td>
					                     <td><aside class="userFormCol-4">${candidateDetail.workList[1].dates}</aside></td>
					                     <td><aside class="userFormCol-1">${candidateDetail.workList[1].title}</aside></td>
					                     <td><aside class="userFormCol-1">${candidateDetail.workList[1].duties}</aside></td>                                     
					                     </tr>
					                     
					                     <tr>
					                     <td><aside class="userFormCol-1">${candidateDetail.workList[2].company}</aside></td>
					                     <td><aside class="userFormCol-4">${candidateDetail.workList[2].dates}</aside></td>
					                     <td><aside class="userFormCol-1">${candidateDetail.workList[2].title}</aside></td>
					                     <td><aside class="userFormCol-1">${candidateDetail.workList[2].duties}</aside></td>                    
					                     </tr>
					                     <tr>
					                     <td><aside class="userFormCol-1">${candidateDetail.workList[3].company}</aside></td>
					                     <td><aside class="userFormCol-4">${candidateDetail.workList[3].dates}</aside></td>                   
					                     <td><aside class="userFormCol-1">${candidateDetail.workList[3].title}</aside></td>
					                     <td><aside class="userFormCol-1">${candidateDetail.workList[3].duties}</aside></td>
					                     </tr>
					                 </table>
				                </div>
          				      <div class="row">
                	<input type="button" id="candidateAccept" value="Accept"/>
                	<input type="button" id="candidateReject" value="Reject"/>
                	<a href="canditateInfo?positionId=${positionId}">Cancel</a>
                </div>
           </div>
    </section>

    
    <!-- Button trigger modal -->
      <button type="button" id="myAcceptTrigger" class="btn btn-primary" data-toggle="modal" data-target="#myModal" style="display:none">Submit</button>
      <div class="modal fade in" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                 <div class="modal-header">
                     <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                     <h4 class="modal-title" id="myModalLabel">Tip</h4>
                 </div>
                 <div class="modal-body">Are you sure to accept this candidate?</div>
                  <div class="buttonsRow">
                     <button id="return" type="button" class="white-bt" data-dismiss="modal">Cancel</button>
                     <button type="submit" id="confirmAccept" class="orange-bt meta-event-source" meta-event-handler="candidate:confirmApply">Confirm</button>
                  </div>
            </div>
        </div>
      </div>
        <button type="button" id="myRejectTrigger" class="btn btn-primary" data-toggle="modal" data-target="#myModal2" style="display:none">Submit</button>
      <div class="modal fade in" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                 <div class="modal-header">
                     <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                     <h4 class="modal-title" id="myModalLabel2">Tip</h4>
                 </div>
                 <div class="modal-body">Are you sure to reject this candidate?</div>
                  <div class="buttonsRow">
                     <button id="return" type="button" class="white-bt" data-dismiss="modal">Cancel</button>
                     <button type="submit" id="confirmReject" class="orange-bt meta-event-source" meta-event-handler="candidate:confirmReject">Confirm</button>
                  </div>
            </div>
        </div>
      </div>
 </body>
 <script data-main="js/app/pages/candidate" src="js/lib/require-2.1.15.min.js"></script>
</html>