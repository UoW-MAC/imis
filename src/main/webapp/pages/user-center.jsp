<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Bright Huang
  Date: 11/27/14
  Time: 21:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!--
    <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE8" />
    -->
    <title>Benefitting Agriculture - Personal Center</title>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="js/lib/html5shiv.min.js"></script>
    <script src="js/lib/respond.min.js"></script>
    <![endif]-->


    <link href="css/bootstrap.css" rel="stylesheet" type="text/css">
    <link href="css/custom.css" rel="stylesheet" type="text/css">
    <link href="css/validation.css" rel="stylesheet" type="text/css">
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
<div class="containerDiv">
    <section class="contentSection">
        <div class="container">
            <div class="row">
                <span class="col-sm-2 sidebar equalCol">
                    <h3>Menu</h3>
                    <ul class="nav nav-tabs-justified" role="tablist">
                        <sec:authorize access="hasRole('ROLE_ADMIN') and isAuthenticated()">
                            <li class="active"><a id="userManagementTab" href="#userManagementTabPane"  role="tab" data-toggle="tab">User Regulation<span></span></a></li>
                        </sec:authorize>
                        <sec:authorize access="(hasRole('ROLE_ORGANIZATION') or hasRole('ROLE_STUDENT')) and isAuthenticated()">
                            <li class="active"><a id="userProfileTab" href="#userProfileTabPane" role="tab" data-toggle="tab">Peronal Information<span></span></a></li>
                        </sec:authorize>
                        <sec:authorize access="hasRole('ROLE_STUDENT') and isAuthenticated()">
                            <li><a id="positonApplication" href="javascript:void(0);" role="tab" data-toggle="tab">Position Application<span></span></a></li>
                        </sec:authorize>
                    </ul>
                </span>

                <span class="col-sm-10 leftBorder equalCol umList">
                    <div class="tab-content">
                        <sec:authorize access="hasRole('ROLE_ADMIN') and isAuthenticated()">
                            <div id="adminTabPane" role="tabpane" class="tab-pane active">
                                <jsp:include page='admin.jsp'/>
                            </div>
                        </sec:authorize>
                        <sec:authorize access="hasRole('ROLE_STUDENT') and isAuthenticated()">
                            <div id="studentTabPane" role="tabpane" class="tab-pane active">
                                <jsp:include page='student.jsp'/>
                            </div>
                        </sec:authorize>
                        <sec:authorize access="hasRole('ROLE_ORGANIZATION') and isAuthenticated()">
                            <div id="organizationTabPane" role="tabpane" class="tab-pane active">
                                <jsp:include page='organization.jsp'/>
                            </div>
                        </sec:authorize>
                        
                    </div>
                </span>
            </div>
        </div>
    </section>
</div>
<!-- /CONTENT SECTION -->

<jsp:include page='footer.jsp'/>

<script data-main="js/app/pages/user-center" src="js/lib/require-2.1.15.min.js"></script>
<!--
<script src="js/app/modules/custom.js"></script>
-->
</body>
</html>