
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <meta name="description" content="">
    <meta name="author" content="">
    <meta http-equiv="content-language" content="en-US" />
    <link rel="icon" href="../../favicon.ico">

    <title>Signin Template for Bootstrap</title>

    <!-- Bootstrap core CSS -->
    <link type="text/css" href="css/bootstrap.min.css" rel="stylesheet">
    <link type="text/css" href="css/bootstrap-theme.min.css" rel="stylesheet">
    <link type="text/css" rel="stylesheet" href="css/bootstrap-social.css">
    <link type="text/css" rel="stylesheet" href="css/font-awesome.min.css">
    <!-- Custom styles for this template -->
    <link href="homepage.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="../../assets/js/ie-emulation-modes-warning.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>

  <body>

    <div class="container">
      <div class="row">
        <div class="col-xs-12">
          <h1>Look up your flights here</h1>
        </div>
        <div class="col-sm-8">
          <form class="form-horizontal" role="form" action="Demosearch.jsp" method="post">
            <div class="form-group">
              <div class="col-sm-3">
                <input class="form-control" type="text" name="customer_from" placeholder="From City or Airport" required autofocus>
              </div>
              <div class="col-sm-3">
                <input class="form-control" type="text" name="customer_to" placeholder="To City or Airport" required>
              </div>
              <div class="col-sm-3">
                <input class="form-control" type="date" name="customer_date" placeholder="Depart">
              </div>
              <div class="col-sm-3">
                <button type="submit" class="btn btn-md btn-primary btn-block" name="customer_search">Search</button>
              </div>
            </div>

          </form>

        </div>
      </div>












    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
    <script language="javascript">
    function getCurrentDate() {
         var date = new Date();
         var monthArray=new Array
         ("January","February","March","April","May","June","July","August",
         "September","October","November","December");
         var weekArray = new Array("Sunday","Monday","Tuesday",
              "Wednesday","Thursday","Friday","Saturday");
         month=date.getMonth();
         day=date.getDate();
         if(day.toString().length == 1){
             day="0"+day.toString();
         }
         document.write(monthArray[month]+" "+day+", "+
             date.getFullYear() + "  " + weekArray[date.getDay()]);
    }
</script>
  </body>
</html>
