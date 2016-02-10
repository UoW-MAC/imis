<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
   <!-- <link rel="icon" href="../../favicon.ico"> -->

    <title>Internship Management Information System</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <link href="css/ie10-viewport-bug-workaround.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/jumbotron.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="js/lib/ie-emulation-modes-warning.js"></script>
    
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="js/lib/html5shiv.min.js"></script>
      <script src="js/lib/respond.min.js"></script>
    <![endif]-->
  </head>

  <body>

    <nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">Internship Management Information System</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <form class="navbar-form navbar-right" id="loginForm" role="form" action="j_spring_security_check" method="POST">
            <div class="form-group">
              <input type="text" placeholder="User name" class="form-control" id="j_username" name='j_username'>
            </div>
            <div class="form-group">
              <input type="password" placeholder="Password" class="form-control" id="j_password" name='j_password'>
            </div>
            <button type="button" class="btn btn-success" id="loginFormSubmit">Sign in</button>
          </form>
          
        </div><!--/.navbar-collapse -->
      </div>
    </nav>

    <!-- Main jumbotron for a primary marketing message or call to action -->
    <div class="jumbotron">
      <div class="container">
        <div class="col-md-4">
            <h1>Project Description</h1>
	        <p>This is a template for a simple marketing or informational website. It includes a large callout called a jumbotron and three supporting pieces of content. Use it as a starting point to create something more unique.</p>
        </div>
        <div class="col-md-4">
            <h2>Sign Up</h2>
            <form class="registerForm" id="registerForm" role="form" action="makeRegister" method="post">
		        <div class="input-group">
				  <input type="text" class="form-control" placeholder="User name" aria-describedby="basic-addon1" id="userName" name="userName">
				</div>
				
				<div class="input-group">
				  <input type="text" class="form-control" placeholder="Email" aria-describedby="basic-addon2" id="email" name="email">
				</div>
				
				<div class="input-group">
				  <input type="text" class="form-control" placeholder="Re-enter email" aria-describedby="basic-addon2" id="reEmail" name="reEmail">
				</div>
				
				<div class="input-group">
				  <input type="password" class="form-control" placeholder="Password" aria-describedby="basic-addon2" id="password" name="password">
				</div>
				
				<div class="input-group">
				  <div class="radioRow">
                    <span class="radioCustom"><input type="radio" name="authority" value="ROLE_STUDENT" checked="checked"><label>Student</label></span>
                	<span class="radioCustom"><input type="radio" name="authority" value="ROLE_ORGANIZATION"><label>Organization</label></span>
                	<span class="radioCustom"><input type="radio" name="authority" value="ROLE_ADMIN"><label>Admin</label></span>
                  </div>
			    </div>
			    
			    <div class="input-group">
			      <p><a class="btn btn-primary btn-lg" role="button" id="registerFormSubmit">Sign up</a></p>
			    </div>
		    </form>
        </div>
      </div>
    </div>

    <div class="container">
     

      <hr>

      <footer>
        <p>&copy; 2016 University of Windsor</p>
      </footer>
    </div> <!-- /container -->


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script data-main="js/app/pages/home" src="js/lib/require-2.1.15.min.js"></script>
    
   <!-- <script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery.min.js"><\/script>')</script> -->
  </body>
</html>
