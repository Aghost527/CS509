<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Demopackage.Democlass" %>0
<%@ page import="driver.*" %>

<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- ä¸è¿°3ä¸ªmetaæ ç­¾*å¿é¡»*æ¾å¨æåé¢ï¼ä»»ä½å¶ä»åå®¹é½*å¿é¡»*è·éå¶åï¼ -->
    <meta name="description" content="">
    <meta name="author" content="">
    <meta http-equiv="content-language" content="en-US" />
    <link rel="icon" href="../../favicon.ico">

    <title>Flight Reservation Web Application</title>
    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/bootstrap-theme.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/bootstrap-social.css">
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <!-- Custom styles for this template -->
    <link href="signin.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="../../assets/js/ie-emulation-modes-warning.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    
    <script type="text/javascript">



    </script>
  </head>
  <style type="text/css">
    body{
      background-image:url(flight1.jpg);
      background-repeat:no-repeat;
      background-size:cover;
      background-attachment: fixed;
    }

    .color-white{
      color:#FFF;
    }
    .color-1{
      color:#444444;
    }
    .row-content {
        margin:0px auto;
        padding: 50px 0px 50px 0px;
        border-bottom: 1px ridge #999900;
        min-height:180px;
    }
  </style>

  <body>
    <nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
            <label class="navbar-brand color-white" href="index.html">Sorting</label>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
            <li><a href="#" onclick="fun1()" id="sortbyprice" name="sortbyprice">By Price</a></li>
            <li><a href="#" id="sortbystops" name="sortbystops">By Stops</a></li>
            <li><a href="#" id="sortbycompanies" name="sortbycompanies">By Companies</a></li>
            <li></li>
          </ul>
        </div>
      </div>
    </nav>

    <div class="container" id="root">
      <div class="row">
        <div class="col-sm-7 row-content">
    	  <%
        out.println("test");
      DriverManager driverManager=new DriverManager();out.println(driverManager.search("", "", request.getParameter("customer_from"),  request.getParameter("customer_date"), request.getParameter("customer_to")));
      // out.println(driverManager.search("", "", "","",""));
  	%>
        </div>

      </div>

      <div class="row">
        <div class="col-sm-7 row-content">

        </div>

      </div>
    </div>

    <!--

      <form class="form-signin">
        <h2 class="form-signin-heading">Flight Reservation</h2>
        <label for="inputEmail" class="sr-only">Email address</label>
        <input type="email" id="inputEmail" class="form-control" placeholder="From City or Airport" required autofocus>
        <label for="inputPassword" class="sr-only">Password</label>
        <input type="password" id="inputPassword" class="form-control" placeholder="To City or Airport" required>
        <div class="checkbox">
          <label>
            <input type="checkbox" value="remember-me"> Remember me
          </label>
        </div>
        <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
      </form>

    </div>  --><!-- /container -->


    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
    <script language="javascript">
    window.onload = createDiv();


    function createDiv() {
      var num = 2;<!--è¿ä¸ªæ°å­éè¿è¿åflightæ°ç»çé¿åº¦å³å®-->
      var root = document.getElementById('root');
      for(var i = 1; i <= num; i++) {

        root.innerHTML = root.innerHTML + '<div class="row"><div class="col-sm-7 row-content"</div></div>'
      }
    }
</script>
  </body>
</html>
