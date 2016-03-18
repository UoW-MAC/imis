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
		<title>Position Detail</title>
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
    	<div id="positionEditTable">
            <div class="row">
                <div id="positionId" value="${positionDetail.positionId}">Position Name: </div>
                </div>
                <div class="row">
                	${positionDetail.positionName}
                </div>

                 <div id="positionGroupId" value="${positionDetail.positionGroup.positionGroupId}">Position Group</div>
                <div class="row">
                    ${positionDetail.positionGroup.positionGroupName}
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
                 <sec:authorize access="hasRole('ROLE_STUDENT') and isAuthenticated()">
                <div class="row">
                	<input type="button" id="positionApply" value="Apply"/>
                	<input type="button" id="cancelApply" value="Cancel"/>
                </div>
                  </sec:authorize>
                   <sec:authorize access="hasAnyRole('ROLE_ORGANIZATION,ROLE_ADMIN') and isAuthenticated()">
                   		<div class="row">
                   		<a href="javascript:void(0)" onClick="editDisplay(${positionDetail.positionId},'${positionDetail.positionName}',${positionDetail.positionGroup.positionGroupId},'${positionDetail.responsibilities}','${positionDetail.requirements}',${positionDetail.salary},'${positionDetail.positionDescription}')" >edit</a>
                   		</div>
                   	</sec:authorize>
              </div>
               <sec:authorize access="hasAnyRole('ROLE_ORGANIZATION,ROLE_ADMIN') and isAuthenticated()">
                  <div id="updateForm" style="display:none">
							<form  id="editForm" role="form" action="updatePosition" method="post">
								<table id = "" width="100%">
								<tr>
								    <th>positionName</th>
								    <th>groupName</th>
								    <th>responsibilities</th>
 									<th>requirements</th>
 									<th>salary</th>
 									<th>positionDescription</th>
								</tr>
         					    <tr style="vertical-align: middle">
									<th><input type="text" id="inputPositionName" name="positionName" value=""/></th>
									<th><select id="inputpositionGroupSelect" name="positionGroup.positionGroupId"></select></th>
									<th><input type="text" id="inputResponsibilities" name="responsibilities" value=""/></th>
									<th><input type="text" id="inputRequirements" name="requirements" value=""/></th>
									<th><input type="text" id="inputSalary" name="salary" value=""/></th>
									<th><input type="text" id="inputPositionDescription" name="positionDescription" value=""/></th>
									</tr>
									</table>
									<div class="row">
									<input type ="hidden" id="inputPositionId" name = "positionId" value =""/>
									<input type="button" id="editPosition" value="Edit"/>
									<input type="button" class="white-bt" id="canclePosition" value="cancle" onclick="editDisplay()"/>
									</div>
									</form>
				</div>
                   </sec:authorize>
            </div>
    </section>
     <script type="text/javascript"  >
     					 function editDisplay(positionId,positionName,groupId,responsibilities,requirements,salary,positionDescription){
     					       var positionTable=document.getElementById("positionEditTable");
     					       var updateForm=document.getElementById("updateForm");
     					        if(positionEditTable.style.display=="none"){
     					        	updateForm.style.display="none";
     					        	positionEditTable.style.display="";
     					        }else{
     					        	positionEditTable.style.display="none";
     					        	updateForm.style.display="";
     					        	$.ajax({
     		        					type : "get",
     		        					dataType : "json",
     		        					url : 'getPositionGroup',
     		        					success : function(data) {
     		        						var positionGroupSelect = $('#inputpositionGroupSelect');
     		               				$('#inputpositionGroupSelect' + ' option').remove();

     		               				for (var i = 0; i < data.length; i++) {

     		               					var optionText = data[i].positionGroupName;
     		               					var optionValue = data[i].positionGroupId;

     		               					var option = "<option value=" + optionValue + ">"
     		               							+ optionText + "</option>";
     		               					positionGroupSelect.append(option);

     		               				}
     		               			document.getElementById("inputpositionGroupSelect").options[(groupId-1)].selected = true;
     		        					}
     		        				});
     					        	document.getElementById('inputPositionId').value = positionId;
     					        	document.getElementById('inputPositionName').value = positionName;
     					        	document.getElementById('inputpositionGroupSelect').value = groupId;
     					        	document.getElementById('inputResponsibilities').value = responsibilities;
     					        	document.getElementById('inputRequirements').value = requirements;
     					        	document.getElementById('inputSalary').value = salary;
     					        	document.getElementById('inputPositionDescription').value = positionDescription;

     					      }
     					   }
     	</script>

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
      <!-- Button trigger modal -->
      <button type="button" id="myModalTrigger2" class="btn btn-primary" data-toggle="modal" data-target="#myModal2" style="display:none">Submit</button>
      <div class="modal fade in" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel2" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                 <div class="modal-header">
                     <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                     <h4 class="modal-title" id="myModalLabel2">Tip</h4>
                 </div>
                 <div class="modal-body">Are you sure to edit this position?</div>
                  <div class="buttonsRow">
                     <button id="return" type="button" class="white-bt" data-dismiss="modal">Cancel</button>
                     <button type="submit" id="confirmEdit" class="orange-bt meta-event-source" meta-event-handler="application:confirmEdit">Confirm</button>
                  </div>
            </div>
        </div>
      </div>
 </body>
 <script data-main="js/app/modules/application" src="js/lib/require-2.1.15.min.js"></script>
</html>
