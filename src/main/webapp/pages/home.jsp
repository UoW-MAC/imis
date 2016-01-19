<%--
  Created by IntelliJ IDEA.
  User: apple
  Date: 11/22/14
  Time: 22:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <!--
  <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE8" />
  -->
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Internship Management Information System</title>

  <!--
<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  -->
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

<!-- CONTENT SECTION -->
<section class="contentSection fullBgImage">
  <div class="fullBgImageTop"></div>
  <div class="fullBgImageBottom">
    <div class="container">
      <div class="row">
            <span class="col-sm-12 textAlignCenter">
              <a href="survey" class="orange-bt">survey</a>
            </span>
      </div>
    </div>
  </div>
</section>
<!-- /CONTENT SECTION -->

<jsp:include page='footer.jsp'/>
<script data-main="js/app/pages/home" src="js/lib/require-2.1.15.min.js"></script>
<!--
<script src="js/app/modules/custom.js"></script>
-->
</body>
</html>
