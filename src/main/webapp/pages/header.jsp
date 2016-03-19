<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: apple
  Date: 11/20/14
  Time: 12:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html>
<head>
    <!-- 模拟ie9及以下浏览器输入框内容提示-->
    <link href="css/ie.css" rel="stylesheet" type="text/css">
</head>
<body>
<!-- HEADER -->
<header>
 
  
</header>
<!-- /HEADER -->


 <nav class="navbar page-title withOutTitle navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="home" css="color:FFFFFF">Internship Management Information System</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <form class="navbar-form navbar-right" id="loginForm" role="form" action="j_spring_security_check" method="POST">
            <div class="form-group">
              <input type="text" placeholder="User name" class="form-control" id="j_username" name='j_username'>
            </div>
            <div class="form-group">
              <input type="password" placeholder="Password" class="form-control" id="j_password" name='j_password'>
            </div>
            <button type="button" class="btn btn-success" id="loginFormSubmit">log In</button>
          </form>
        </div>
      </div>
 </nav>



</body>
<!-- 模拟ie9及以下浏览器输入框内容提示-->
<script src="js/app/modules/ie.js"></script>
</html>