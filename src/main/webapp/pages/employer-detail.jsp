<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
            <link rel="icon" href="images/favicon.png">
		<title>Employer Detail</title>
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
    <section class="contentSection position-detail">
    	<div class="container">
    	<div id="employerEditTable">
            <div class="row">
                <div id="employerId" value="${employerDetail.employerId}">Employer Name: </div>
                </div>
                <div class="row">
                	${employerDetail.employerName}
                </div>

                 <div id="positionGroupId" value="${employerDetail.employerGroup.employerGroupId}">Employer Group</div>
                <div class="row">
                    ${employerDetail.employerGroup.employerGroupType}
                </div>

                <div>Employer Address</div>
                <div class="row">
                    ${employerDetail.employerAddress}
                </div>
                <div>Employer City</div>
                <div class="row">
                    ${employerDetail.employerCity}
                </div>
                <div>Employer Country</div>
                <div class="row">
                    ${employerDetail.employerCountry}
                </div>
                  <div>Employer PostCode</div>
                <div class="row">
                    ${employerDetail.employerPostCode}
                </div>
                  <div>Manager Name</div>
                <div class="row">
                    ${employerDetail.contactorFirstName}  ${employerDetail.contactorLastName}
                </div>
                  <div>Manager Position</div>
                <div class="row">
                    ${employerDetail.contactorPosition}
                </div>
                  <div>Employer Telephone</div>
                <div class="row">
                    ${employerDetail.employerTelephone}
                </div>
                  <div>Employer Email</div>
                <div class="row">
                    ${employerDetail.employerEmail}
                </div>
                  <div>Employer Website</div>
                <div class="row">
                    ${employerDetail.employerWebsite}
                </div>
                  <div>Employer Notes</div>
                <div class="row">
                    ${employerDetail.employerNotes}
                </div>
                   <sec:authorize access="hasRole('ROLE_ADMIN') and isAuthenticated()">
                   		<div class="row">
                   		<a href="javascript:void(0)" onClick="editDisplay(${employerDetail.employerId},'${employerDetail.employerName}',${employerDetail.employerGroup.employerGroupId},'${employerDetail.employerAddress}','${employerDetail.employerCity}','${employerDetail.employerCountry}','${employerDetail.employerPostCode}','${employerDetail.contactorFirstName}','${employerDetail.contactorLastName}','${employerDetail.contactorPosition}','${employerDetail.employerTelephone}','${employerDetail.employerEmail}','${employerDetail.employerWebsite}','${employerDetail.employerNotes}')" >edit</a>
                   		</div>
                   	</sec:authorize>
              </div>
               <sec:authorize access="hasRole('ROLE_ADMIN') and isAuthenticated()">
                  <div id="updateEmployerForm" style="display:none">
							<form  id="editEmployerForm" role="form" action="makeEmployer" method="post">
								 <div class="row">
                            <aside class="userFormCol-1">CompanyName</aside>
                            <aside class="userFormCol-right"><input type="text" class="width-330" id="inputemployer_name" name="employerName" value=""></aside>
                        </div>
                         <div class="row">
                            <aside class="userFormCol-1">Address</aside>
                            <aside class="userFormCol-right"><input type="text" class="width-200" id="employeraddress" name="employerAddress" value=""></aside>
                        </div>
                         <div class="row">
                            <aside class="userFormCol-1">City</aside>
                            <aside class="userFormCol-right"><input type="text" class="width-330" id="employercity" name="employerCity" value=""></aside>
                        </div>
                          <div class="row">
                            <aside class="userFormCol-1">Post Code</aside>
                            <aside class="userFormCol-right"><input type="text" class="width-330" id="employerpost_code" name="employerPostCode" value=""></aside>
                        </div>
                          <div class="row">
                            <aside class="userFormCol-1">COUNTRY</aside>
                            <aside class="userFormCol-right"><input type="text" class="width-330" id="employercountry" name="employerCountry" value=""></aside>
                        </div>
                         <div class="row">
                            <aside class="userFormCol-1">CONTACTOR_FIRST_NAME</aside>
                            <aside class="userFormCol-right"><input type="text" class="width-330" id="employercontactor_first_name" name="contactorFirstName" value=""></aside>
                        </div>
                        <div class="row">
                            <aside class="userFormCol-1">CONTACTOR_LAST_TIME</aside>
                            <aside class="userFormCol-right"><input type="text" class="width-330" id="employercontactor_last_name" name="contactorLastName" value=""></aside>
                        </div>
                        <div class="row">
                            <aside class="userFormCol-1">CONTACTOR_POSITION</aside>
                            <aside class="userFormCol-right"><input type="text" class="width-330" id="employercontactor_position" name="contactorPosition" value=""></aside>
                        </div>
                         <div class="row">
                            <aside class="userFormCol-1">Telephone</aside>
                            <aside class="userFormCol-right"><input type="text" class="width-330" id="employertelephone" name="employerTelephone" value=""></aside>
                        </div>
                          <div class="row">
                            <aside class="userFormCol-1">Email</aside>
                            <aside class="userFormCol-right"><input type="text" class="width-330" id="employeremail" name="employerEmail" value=""></aside>
                        </div>
                         <div class="row">
                            <aside class="userFormCol-1">Website</aside>
                            <aside class="userFormCol-right"><input type="text" class="width-330" id="employerwebsite" name="employerWebsite" value=""></aside>
                        </div>
                        <div class="row">
                            <aside class="userFormCol-1">notes</aside>
                            <aside class="userFormCol-right"><input type="text" class="width-330" id="employernotes" name="employerNotes" value=""></aside>
                        </div>
                        <div class="row">
							<aside class="userFormCol-1">EmployerGroup</aside>
							<aside class="userFormCol-right">				
              					<select id="inputemployerGroupSelect" name="employerGroup.employerGroupId">
             				 	</select>
							</aside>
						</div>	
									<div class="row">
									<input type ="hidden" id="employer_Id" name = "employerId" value =""/>
									<input type="button" id="editEmployer" value="Edit"/>
									<input type="button" class="white-bt" id="cancleEmployer" value="cancle" onclick="editDisplay()"/>
									</div>
									</form>
				</div>
                   </sec:authorize>
            </div>
    </section>
     <script type="text/javascript"  >
     					 function editDisplay(employerId,employerName,employergroupId,employerAddress,employerCity,employerCountry,employerPostCode,contactorFirstName,contactorLastName,contactorPosition,employerTelephone,employerEmail,employerWebsite,employerNotes){
     					       var employerEditTable=document.getElementById("employerEditTable");
     					       var updateEmployerForm=document.getElementById("updateEmployerForm");
     					        if(employerEditTable.style.display=="none"){
     					        	updateEmployerForm.style.display="none";
     					        	employerEditTable.style.display="";
     					        }else{
     					        	employerEditTable.style.display="none";
     					        	updateEmployerForm.style.display="";
     					        	$.ajax({
     		        					type : "get",
     		        					dataType : "json",
     		        					url : 'getEmployerGroup',
     		        					success : function(data) {
     		        						var employerGroupSelect = $('#inputemployerGroupSelect');
     		        	    				$('#inputemployerGroupSelect' + ' option').remove();
     		        	    				for (var i = 0; i < data.length; i++) {
     		        	    					var optionText = data[i].employerGroupType;
     		        	    					var optionValue = data[i].employerGroupId;
     		        	    					var option = "<option value=" + optionValue + ">"
     		        	    							+ optionText + "</option>";
     		        	    					$('#inputemployerGroupSelect').append(option);
     		        	    				}
     		               			document.getElementById("inputemployerGroupSelect").options[(employergroupId-1)].selected = true;
     		        					}
     		        				});
     					        	document.getElementById('employer_Id').value = employerId;
     					        	document.getElementById('inputemployer_name').value = employerName;
     					        	document.getElementById('inputemployerGroupSelect').value = employergroupId;
     					        	document.getElementById('employeraddress').value = employerAddress;
     					        	document.getElementById('employercity').value = employerCity;
     					        	document.getElementById('employercountry').value = employerCountry;
     					        	document.getElementById('employerpost_code').value = employerPostCode;
     					        	document.getElementById('employercontactor_first_name').value = contactorFirstName;
     					        	document.getElementById('employercontactor_last_name').value = contactorLastName;
     					        	document.getElementById('employercontactor_position').value = contactorPosition;
     					        	document.getElementById('employertelephone').value = employerTelephone;
     					        	document.getElementById('employeremail').value = employerEmail;
     					        	document.getElementById('employerwebsite').value = employerWebsite;
     					        	document.getElementById('employernotes').value = employerNotes;

     					      }
     					   }
     	</script>
      <!-- Button trigger modal -->
      <button type="button" id="myModalTrigger6" class="btn btn-primary" data-toggle="modal" data-target="#myModal6" style="display:none">Submit</button>
      <div class="modal fade in" id="myModal6" tabindex="-1" role="dialog" aria-labelledby="myModalLabel6" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                 <div class="modal-header">
                     <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                     <h4 class="modal-title" id="myModalLabel6">Tip</h4>
                 </div>
                 <div class="modal-body">Are you sure to edit this Employer?</div>
                  <div class="buttonsRow">
                     <button id="return" type="button" class="white-bt" data-dismiss="modal">Cancel</button>
                     <button type="submit" id="confirmEmployerEdit" class="orange-bt meta-event-source" meta-event-handler="application:confirmEdit">Confirm</button>
                  </div>
            </div>
        </div>
      </div>
 </body>
 <script data-main="js/app/pages/employer-detail" src="js/lib/require-2.1.15.min.js"></script>
</html>
