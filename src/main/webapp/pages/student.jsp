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
                <span class="col-sm-9 rightBorder equalCol">
                    <form class="studentForm" id="studentForm" role="form" action="addOrUpdStudent" method="post">
                      <div id="studentInfoForm">
                        <script id="studentProfileTable" type="text/x-handlebars-template">
                            <div>
                                <div>Semester Registered: </div>
                            	<div class="radioRow">
                            		<span class="radioCustom"><input id="fall" type="radio" name="semesterRegistered" value="fall"><label>FALL</label></span>
                            		<span class="radioCustom"><input id="winter" type="radio" name="semesterRegistered" value="winter"><label>WINTER</label></span>
                                </div>
                            	<div>YEAR: <input type="text" class="width-200" id="registeredYear" name="registeredYear" value="{{registeredYear}}"></div>
                        	</div>
                            <div class="row">
                            	<aside class="userFormCol-1">Student ID</aside>
                            	<aside class="userFormCol-right"><input type="text" class="width-330" id="student_no" name="studentNo" value="{{studentNo}}"></aside>
                        	</div>
                        	<div class="row">
                            	<aside class="userFormCol-1">First Name</aside>
                            	<aside class="userFormCol-right"><input type="text" class="width-330" id="first_name" name="firstName" value="{{firstName}}"></aside>
                        	</div>
                            <div class="row">
                            	<aside class="userFormCol-1">Middle Name</aside>
                            	<aside class="userFormCol-right"><input type="text" class="width-200" id="middle_name" name="middleName" value="{{middleName}}"></aside>
                        	</div>
                         	<div class="row">
                            	<aside class="userFormCol-1">Last Name</aside>
                            	<aside class="userFormCol-right"><input type="text" class="width-330" id="last_name" name="lastName" value="{{lastName}}"></aside>
                        	</div>
                         	<div class="row">
                            	<aside class="userFormCol-1">Email</aside>
                            	<aside class="userFormCol-right"><input type="text" class="width-330" id="email" name="email" value="{{email}}"></aside>
                        	</div>
	                        <div class="row">
	                            <aside class="userFormCol-1">Telephone</aside>
	                            <aside class="userFormCol-right"><input type="text" class="width-330" id="telephone" name="telephone" value="{{telephone}}"></aside>
	                        </div>
                            <div>
                            	<div>Status</div>
                            	<div class="radioRow">
                            		<span class="radioCustom"><input id="is" type="radio" name="status" value="0"><label>International Student</label></span>
                            		<span class="radioCustom"><input id="pr" type="radio" name="status" value="1"><label>Permanent Resident/Citizen</label></span>
                            	</div>
                        	</div>
                        	<div>
                            	<div>Gender</div>
                            	<div class="radioRow">
                            		<span class="radioCustom"><input id="male" type="radio" name="gender" value="Male"><label>Male</label></span>
                            		<span class="radioCustom"><input id="female" type="radio" name="gender" value="Female"><label>Female</label></span>
                                </div>
                        
          					<div class="table">
				                 <table width="750px" border="1" cellspacing="0" cellpadding="0">
				                     <tr>
				                     <td></td>
				                     <td><diiv class="col-md-1">Major</div></td>
				                     <td><diiv class="col-md-1">GPA</div></td>
				                     <td><diiv class="col-md-1">University/Organization</div></td>
				                     <td><diiv class="col-md-1">Country</div></td>
				                     <td><diiv class="col-md-1">MM/YY</div></td>
				                     </tr>
				                     
				                     <tr>
				                     <td>Undergraduate degree (s)</td>
				                     <td><aside class="userFormCol-1"><input type="text" class="width-330" id="educationList[0].major" name="educationList[0].major" value="{{educationList.0.major}}"></aside></td>
				                     <td><aside class="userFormCol-1"><input type="text" class="width-330" id="educationList[0].gpa" name="educationList[0].gpa" value="{{educationList.0.gpa}}"></aside></td>
				                     <td><aside class="userFormCol-2"><input type="text" class="width-330" id="educationList[0].institution" name="educationList[0].institution" value="{{educationList.0.institution}}"></aside></td>
				                     <td><aside class="userFormCol-1"><input type="text" class="width-330" id="educationList[0].country" name="educationList[0].country" value="{{educationList.0.country}}"></aside></td>
				                     <td><aside class="userFormCol-1"><input type="text" class="width-330" id="educationList[0].graduationDate" name="educationList[0].graduationDate" value="{{educationList.0.graduationDate}}"></aside></td>
				                     </tr>
				                     
				                     <tr>
				                     <td>Graduate degree(s)</td>
				                     <td><aside class="userFormCol-1"><input type="text" class="width-330" id="educationList[1].major" name="educationList[1].major" value="{{educationList.1.major}}"></aside></td>
				                     <td><aside class="userFormCol-1"><input type="text" class="width-330" id="educationList[1].gpa" name="educationList[1].gpa" value="{{educationList.1.gpa}}"></aside></td>
				                     <td><aside class="userFormCol-2"><input type="text" class="width-330" id="educationList[1].institution" name="educationList[1].institution" value="{{educationList.1.institution}}"></aside></td>
				                     <td><aside class="userFormCol-1"><input type="text" class="width-330" id="educationList[1].country" name="educationList[1].country" value="{{educationList.1.country}}"></aside></td>
				                     <td><aside class="userFormCol-1"><input type="text" class="width-330" id="educationList[1].graduationDate" name="educationList[1].graduationDate" value="{{educationList.1.graduationDate}}"></aside></td>
				                     </tr>
				                     
				                     <tr>
				                     <td><div class="userFormCol-6">Other – List any other degrees or certifications you have</div></td>
				                     </tr>
				                     
				                     <tr>
				                     <td></td>
				                     <td><aside class="userFormCol-1"><input type="text" class="width-330"  id="educationList[2].major" name="educationList[2].major" value="{{educationList.2.major}}"></aside></td>
				                     <td><aside class="userFormCol-1"><input type="text" class="width-330" id="educationList[2].gpa" name="educationList[2].gpa" value="{{educationList.2.gpa}}"></aside></td>
				                     <td><aside class="userFormCol-2"><input type="text" class="width-330" id="educationList[2].institution" name="educationList[2].institution" value="{{educationList.2.institution}}"></aside></td>
				                     <td><aside class="userFormCol-1"><input type="text" class="width-330" id="educationList[2].country" name="educationList[2].country" value="{{educationList.2.country}}"></aside></td>
				                     <td><aside class="userFormCol-1"><input type="text" class="width-330" id="educationList[2].graduationDate" name="educationList[2].graduationDate" value="{{educationList.2.graduationDate}}"></aside></td>
				                     </tr>
				                     
				                     <tr>
				                     <td id="educationList[3].degree" name="educationList[3].degree" value="other"></td>
				                     <td><aside class="userFormCol-1"><input type="text" class="width-330" id="educationList[3].major" name="educationList[3].major" value="{{educationList.3.major}}"></aside></td>
				                     <td><aside class="userFormCol-1"><input type="text" class="width-330" id="educationList[3].gpa" name="educationList[3].gpa" value="{{educationList.3.gpa}}"></aside></td>
				                     <td><aside class="userFormCol-2"><input type="text" class="width-330" id="educationList[3].institution" name="educationList[3].institution" value="{{educationList.3.institution}}"></aside></td>
				                     <td><aside class="userFormCol-1"><input type="text" class="width-330" id="educationList[3].country" name="educationList[3].country" value="{{educationList.3.country}}"></aside></td>
				                     <td><aside class="userFormCol-1"><input type="text" class="width-330" id="educationList[3].graduationDate" name="educationList[3].graduationDate" value="{{educationList.3.graduationDate}}"></aside></td>
				                     </tr>
				                     <input name="educationList[0].degree" type="hidden" value="undergraduate"/>
				                     <input name="educationList[1].degree" type="hidden" value="graduate"/>
				                     <input name="educationList[2].degree" type="hidden" value="other"/>
				                     <input name="educationList[3].degree" type="hidden" value="other"/>
				                </table>
                            </div>
			                <div class="table">
				                 <table width="750px" border="1" cellspacing="0" cellpadding="0">
				                     <tr>
				                     <td><diiv class="col-md-1">Company</div></td>
				                     <td><diiv class="col-md-4">Dates(MM/YY-MM/YY)</div></td>
				                     <td><diiv class="col-md-1">Title</div></td>
				                     <td><diiv class="col-md-1">Duties</div></td>
				                     </tr>
				                     
				                     <tr>                    
				                     <td><aside class="userFormCol-1"><input type="text" class="width-330" id="workList[0].organization" name="workList[0].company" value="{{workList.0.company}}"></aside></td>
				                     <td><aside class="userFormCol-4"><input type="text" class="width-330" id="workList[0].dates" name="workList[0].dates" value="{{workList.0.dates}}"></aside></td>
				                     <td><aside class="userFormCol-1"><input type="text" class="width-330" id="workList[0].title" name="workList[0].title" value="{{workList.0.title}}"></aside></td>
				                     <td><aside class="userFormCol-1"><input type="text" class="width-330" id="workList[0].duties" name="workList[0].duties" value="{{workList.0.duties}}"></aside></td>
				                     </tr>
				                     
				                     <tr>           
				                     <td><aside class="userFormCol-1"><input type="text" class="width-330" id="workList[1].organization" name="workList[1].company" value="{{workList.1.company}}"></aside></td>
				                     <td><aside class="userFormCol-4"><input type="text" class="width-330" id="workList[1].dates" name="workList[1].dates" value="{{workList.1.dates}}"></aside></td>
				                     <td><aside class="userFormCol-1"><input type="text" class="width-330" id="workList[1].title" name="workList[1].title" value="{{workList.1.title}}"></aside></td>
				                     <td><aside class="userFormCol-1"><input type="text" class="width-330" id="workList[1].duties" name="workList[1].duties" value="{{workList.1.duties}}"></aside></td>                                     
				                     </tr>
				                     
				                     <tr>
				                     <td><aside class="userFormCol-1"><input type="text" class="width-330"  id="workList[2].organization" name="workList[2].company" value="{{workList.2.company}}"></aside></td>
				                     <td><aside class="userFormCol-4"><input type="text" class="width-330" id="workList[2].dates" name="workList[2].dates" value="{{workList.2.dates}}"></aside></td>
				                     <td><aside class="userFormCol-1"><input type="text" class="width-330" id="workList[2].title" name="workList[2].title" value="{{workList.2.title}}"></aside></td>
				                     <td><aside class="userFormCol-1"><input type="text" class="width-330" id="workList[2].duties" name="workList[2].duties" value="{{workList.2.duties}}"></aside></td>                    
				                     </tr>
				                     
				                     <tr>
				                     <td><aside class="userFormCol-1"><input type="text" class="width-330" id="workList[3].organization" name="workList[3].company" value="{{workList.3.company}}"></aside></td>
				                     <td><aside class="userFormCol-4"><input type="text" class="width-330" id="workList[3].dates" name="workList[3].dates" value="{{workList.3.dates}}"></aside></td>                   
				                     <td><aside class="userFormCol-1"><input type="text" class="width-330" id="workList[3].title" name="workList[3].title" value="{{workList.3.title}}"></aside}</td>
				                     <td><aside class="userFormCol-1"><input type="text" class="width-330" id="workList[3].duties" name="workList[3].duties" value="{{workList.3.duties}}"></aside</td>
				                     </tr>
				                 </table>
			                </div>
			                <input type="hidden" id="studentId" name="studentId" value="{{studentId}}" /> 
			                </script>
			                <div class="row">
	                            <input type="button" id="studentProfile_submit" value="submit"/>
	                        </div>
			                </div>
                    </form>
                </span>
                
                <!-- Button trigger modal -->
                <button type="button" id="studentModelTrigger" data-toggle="modal" data-target="#studentModel" style="display:none"></button>

                <!-- Project Application Page-Confirm Modal -->
                <div class="modal fade" id="studentModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
 </body>
</html>