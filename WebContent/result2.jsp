<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="driver.*" %>

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

    <title>Flight Reservation Web Application</title>
    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/bootstrap-theme.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/bootstrap-social.css">
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <!-- Custom styles for this template -->

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  <style type="text/css">
    body{
      background-image:url(flight1.jpg);
      background-repeat:no-repeat;
      background-size:cover;
      background-attachment: fixed;
    }

    li{
      text-align: center;
    }
    p{
      text-align: center;
      line-height: 100%;
      margin: 20px;
      margin-top:0px;
    }
    td,th{
      padding: 0.6em 2em;
      width: 180px;
      overflow: hidden;
    }
    h2{
      text-align: center;
    }
    h3{
      text-align: center;
    }
    .color-white{
      color:#FFF;
    }
    .color-1{
      color:#444444;
    }
    .root-content{
      border-top: 0px ridge #000;
    }
    .row-content {
        margin:0px auto;
        padding: 50px 0px 50px 0px;
        border-top: 2px ridge #999900;
        min-height:120px;
    }
    .flight-div1 {
      padding-top: 20px;
      padding-bottom: 0px;
    }
    .flight-div2 {
      padding-top: 15px;
      padding-bottom: 15px;
    }
    .flight-div3 {
      border-top: 1px ridge #999900;
      padding-top: 30px;
      padding-bottom: 0px;
    }
    .border1 {
      border: 1px ridge blue
    }
    .div1{
      position:fixed;
      margin: 10px 0 0 20px;
    }
    .div2{
      position:fixed;
      margin: 86px 0px 0 98px;
    }
    .div3{
      position:fixed;
      margin: 96px 0px 0 89px;
    }
    .div4{
      position:fixed;
      margin: 96px 0 0 272px;
    }
    .div5{
      position:fixed;
      margin: 96px 0 0 440px;
    }
    .padding-div {
      position: fixed;
      margin: 0px 0 0 0px;
      border-top: 2px ridge #000;
    }
    .padding-p {
      margin-top:7px;
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
            <li><a href="#" id="sortbyprice" name="sortbyprice">By Price</a></li>
            <li><a href="#" id="sortbystops" name="sortbystops">By Stops</a></li>
            <li><a href="#" id="sortbycompanies" name="sortbycompanies">By Companies</a></li>
            <li></li>
          </ul>
        </div>
      </div>
    </nav>


    <div class="" style="height:0px" >
        <div class="div3 border">
          <p>Departure|Arrival</p>
        </div>
        <div class="div4 border">
          <p>Duration</p>
        </div>
        <div class="div5 border">
          <p>Stops</p>
        </div>

    </div>

    <div class="container border">
      <div class="border" style="min-height: 100px">
        <p style="padding:6px min-height: 0px"></p>
      </div>
      <div class="root-content border" id="root" style="height:400px;width:1218px;overflow:auto;overflow-x:hidden;margin-top:0px;">
        <div class="col-sm-7 padding-div" >

        </div>


        <!--add here -->

        <div class="row flight-div1" >
          <div class="col-sm-7 row-content flight-div2">

            <div class="col-sm-9 padding-p">
              <div class="col-sm-12">
                <div class="col-sm-4">
                  <p>BOS 5:10p-SZX 1:30a</p>
                </div>
                <div class="col-sm-4">
                  <p>20h 20m</p>
                </div>
                <div class="col-sm-4">
                  <p>1</p>
                </div>
              </div>


              <div class="col-sm-12">
                <div class="col-sm-4">
                  <p>SZX 9:35p-BOS 3:10p</p>
                </div>
                <div class="col-sm-4">
                  <p>29h 35m</p>
                </div>
                <div class="col-sm-4">
                  <p>1</p>
                </div>
              </div>
            </div>
            <div class="col-sm-3">
                <p style="font-size:30px"><span class="glyphicon glyphicon-usd" style="font-size: 25px"></span>1,663</p><!--jsonStr[i].totalPrice-->
                <p><a href="#" type="button" class="btn btn-success" id="select1">Select</a></p>
                <ul class="list-unstyled">
                  <li><a id="d" href="#">Flight Details <span class="caret"></span></a></li>
                </ul>
            </div>

            <div id="" style="" class="col-sm-12 flight-div3">
              <div class="col-sm-12">
                <div class="col-sm-3">
                  <p>Flight 7962</p>  <!--jsonStr[i].ticketList[j].number -->
                </div>
                <div class="col-sm-3">
                  <p>departs BOS 4:35p</p>  <!--jsonStr[i].ticketList[j].deTimeString.split(" ")[1] -->
                </div>
                <div class="col-sm-3">
                  <p>arrives PVG 7:15p</p>  <!-- jsonStr[i].ticketList[j].arTimeString.split(" ")[1]-->
                </div>
                <div class="col-sm-3">
                  <p>14h40m</p> <!-- jsonStr[i].ticketList[j].flightTime-->
                </div>
              </div>

              <div class="col-sm-12">
                <div class="col-sm-3">
                  <p>Flight 7962</p>  <!-- -->
                </div>
                <div class="col-sm-3">
                  <p>departs BOS 4:35p</p>  <!-- -->
                </div>
                <div class="col-sm-3">
                  <p>arrives PVG 7:15p</p>  <!-- -->
                </div>
                <div class="col-sm-3">
                  <p>14h40m</p> <!-- -->
                </div>
              </div>
            </div>
        </div>
      </div>

      <div class="row ">
        <div class="col-sm-7" style="border-bottom:2px ridge #999900">
          <p style="padding:8px"></p>
        </div>
      </div>

      <div class="row flight-div1 " >
        <div class="col-sm-7 row-content flight-div2 ">

          <div class="col-sm-9 padding-p">
            <div class="col-sm-12">
              <div class="col-sm-4">
                <p>BOS 5:10p-SZX 1:30a</p>
              </div>
              <div class="col-sm-4">
                <p>20h 20m</p>
              </div>
              <div class="col-sm-4">
                <p>1</p>
              </div>
            </div>


            <div class="col-sm-12">
              <div class="col-sm-4">
                <p>SZX 9:35p-BOS 3:10p</p>
              </div>
              <div class="col-sm-4">
                <p>29h 35m</p>
              </div>
              <div class="col-sm-4">
                <p>1</p>
              </div>
            </div>
          </div>
          <div class="col-sm-3">
              <p style="font-size:30px"><span class="glyphicon glyphicon-usd" style="font-size: 25px"></span>1,663</p>
              <p><a href="#" type="button" class="btn btn-success" id="select1">Select</a></p>
              <ul class="list-unstyled">
                <li><a id=""  href="#">Flight Details <span class="caret"></span></a></li>
              </ul>
          </div>

          <div id="" style="" class="col-sm-12 flight-div3">
            <div class="col-sm-3">
              <p>Flight 7962</p>
            </div>
            <div class="col-sm-3">
              <p>departs BOS 4:35p</p>
            </div>
            <div class="col-sm-3">
              <p>arrives PVG 7:15p</p>
            </div>
            <div class="col-sm-3">
              <p>14h40m</p>
            </div>
          </div>
      </div>
    </div>



      </div>
    </div>





























<!--jsonStr[i].departure + ' ' + jsonStr[i].deTimeString.split(" ")[1] +  ' - ' + jsonStr[i].arrival + ' ' + jsonStr[i].arTimeString.split(" ")[1] -->


    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
    <script language="javascript">
//    window.onload = createDiv();
    var i = 2;
    var test1 = "#detail" + i + "_tag";
    //var test2 = "#detail" + i + "_content";
    var jsonStr=      <%
      DriverManager driverManager=new DriverManager();
      String str  = request.getParameter("customer_date").replace('-', '_');
  out.println(driverManager.search(request.getParameter("customer_triptype"), request.getParameter("customer_cabin"), request.getParameter("customer_from"),  str, request.getParameter("customer_to"), request.getParameter("customer_timetype"),"",""));
    %>



    $(document).ready(function(){
      createDiv();
    });

    function myToggle(obj) {
      var value = obj.id.replace(/[^0-9]/ig,"");
      //alert(value);
      var contentID = "detail" + value + "_content";
      var tg = document.getElementById(contentID);
      if (tg.style.display == 'none') {
        tg.style.display = 'inline';
      } else {
        tg.style.display = 'none';
      }
    }

    function createDiv() {
        var num = jsonStr.length;
        var root = document.getElementById('root');

        for (var i = 0; i < jsonStr.length; i++) {
          var txt_id = "detail" + i + "_tag";
          var txt_content = "detail" + i + "_content";
          var detail_txt = "";

          for (var j = 0; j < jsonStr[i].ticketList.length; j++) {
            detail_txt += '<div class="col-sm-12"><div class="col-sm-3"><p>Flight Number ' + jsonStr[i].ticketList[j].number + '</p>' + '</div><div class="col-sm-3"><p>departs ' + jsonStr[i].ticketList[j].departure + ' ' + jsonStr[i].ticketList[j].deTimeString.split(" ")[1] + '</p></div><div class="col-sm-3"><p>arrives ' + jsonStr[i].ticketList[j].arrival + ' ' +
            jsonStr[i].ticketList[j].arTimeString.split(" ")[1] + '</p></div><div class="col-sm-3"><p>' + jsonStr[i].ticketList[j].flightTime + 'minutes' + '</p></div></div>';
          }



          root.innerHTML = root.innerHTML + '<div class="row flight-div1" ><div class="col-sm-7 row-content flight-div2"><div class="col-sm-9 padding-p"><div class="col-sm-12"><div class="col-sm-4">' +
          '<p>' + jsonStr[i].ticketList[0].departure + ' ' + jsonStr[i].deTimeString.split(" ")[1] +  ' - <br>' + jsonStr[i].ticketList[jsonStr[i].ticketList.length-1].arrival + ' ' + jsonStr[i].arTimeString.split(" ")[1] + '</p>'
          + '</div><div class="col-sm-4"><p>' + jsonStr[i].totalFlightTime + '</div><div class="col-sm-4">  <p>'  + (jsonStr[i].ticketList.length-1) +  '</p></div></div></div>' + '<div class="col-sm-3"><p style="font-size:30px"><span class="glyphicon glyphicon-usd" style="font-size: 25px"></span>' + jsonStr[i].totalPrice.toFixed(1) + '</p><p><a href="#" type="button" class="btn btn-success" id="select1">Select</a></p><ul class="list-unstyled">  <li><a id="' + txt_id + '" href="#" onclick="myToggle(this)">Flight Details <span class="caret"></span></a></li>  </ul></div>' + '<div id="' + txt_content + '" style="display:none" class="col-sm-12 flight-div3">' + detail_txt + '</div>'
          + '</div></div>' + '<div class="row "><div class="col-sm-7" style="border-bottom:2px ridge #999900"><p style="padding:8px"></p></div></div>'
        }




    }
</script>
  </body>
</html>
