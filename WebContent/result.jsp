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
    <link rel="stylesheet" href="css/result.css">
    <!-- Custom styles for this template -->

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
        <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
    <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>

  </head>
    <style type="text/css">

    </style>

  <body>
    <nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
            <label class="navbar-brand color-white" onclick="window.location='index.jsp'">Back</label>
        </div>
        <div class="navbar-header">
            <label class="navbar-brand color-white" href="../">Sorting</label>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
                <li class="dropdown">
              <a herf="#" class="dropdown-toggle" data-toggle="dropdown">
                <b class="caret"></b>
              </a >
                <ul class="dropdown-menu">
                <li><a href=" " onClick="sortbyprice1()" id="sortbyprice" name="sortbyprice">By Price(low to high)</a ></li>
                <li><a href="#" onClick="sortbyprice2()" id="sortbyprice" name="sortbyprice">By Price(high to low)</a ></li>
                <li><a href="#" onClick="sortbyflighttime1()" id="sortbyflighttime" name="sortbyflighttime">By Duration(short to long)</a ></li>
                <li><a href="#" onClick="sortbyflighttime2()" id="sortbyflighttime" name="sortbyflighttime">By Duration(long to short)</a ></li>
                <li><a href="#" onClick="sortbydeparturetime1()" id="sortbydeparturetime" name="sortbydeparturetime">By Departure Time(early to late)</a ></li>
                <li><a href="#" onClick="sortbydeparturetime2()" id="sortbydeparturetime" name="sortbydeparturetime">By Departure Time(late to early)</a ></li>
                <li><a href="#" onClick="sortbyarrivaltime1()" id="sortbyarrivaltime" name="sortbyarrivaltime">By Arrival Time(early to late)</a ></li>
                <li><a href="#" onClick="sortbyarrivaltime2()" id="sortbyarrivaltime" name="sortbyarrivaltime">By Arrival Time(late to early)</a ></li>
                <li></li>
          </ul>
          </li>
          </ul>
        </div>
      </div>
    </nav>


    <div class="top" id="topmenu" style="height:0px" >
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
      <div class="root-content border" id="root" style="height:600px;width:1143 px;overflow:auto;overflow-x:hidden;margin-top:0px;">
        <div class="col-sm-8 padding-div" >
           
        </div>
      </div>  

        <!--add here -->
    <!--    <button type="button" value="golist" onClick="window.location='index.jsp';">abcdefg</button>  -->
      <div class="row ">
        <div class="col-sm-8" style="border-bottom:2px ridge #999900;">
          <p style="padding:8px;"></p>
        </div>
      </div>


      
      <!-- bought tickets -->
      <div id="topcontrol" style="position: fixed; top: 80px; right: 30px; opacity: 1; z-index:3;width:400px; " title="Outbound Tickets">
        <div id="bought">
            
        </div>
      </div>




    <script language="javascript">
    <%DriverManager driverManager=new DriverManager();%>

    // check buy Tickets
    var check=<%=driverManager.buyTicket(request.getParameter("seatTypes"),request.getParameter("flightNums"))
    %>
    if(check==0){
        alert("The filght you Select has been sold out")
    }
    else if(check==1){
        alert("Reservation success")
    }
    // data from back end
    var jsonStr=    	<%
     out.println(driverManager.search(request.getParameter("customer_triptype"), request.getParameter("customer_cabin"),request.getParameter("customer_returncabin"), request.getParameter("customer_from"),  request.getParameter("customer_date").replace('-', '_'), request.getParameter("customer_to"), request.getParameter("customer_timetype"),request.getParameter("customer_returndate").replace('-', '_'),request.getParameter("customer_returntimetype")));
    %>

    var result=checkResult();
     //good
      if(result==0){

      }

      //no outbound
      else if(result==1){
          alert("There are no seats of " +<%=request.getParameter("customer_cabin")%> + " in the outbound trip" );
      }
      //no return
      else if(result==2){
          alert("There are no seats of " +<%=request.getParameter("customer_cabin")%> + " in the return trip" );
      }
      //no outbound and return
      else if(result==3){
          alert("There are no seats of " +<%=request.getParameter("customer_cabin")%> + " in both the outbound trip and return trip" );
      }
    

    // data to back end;
    var seatTypeList="";
    var flightNumberList="";
    //tmp flights
    var ticketsList=[]
    var now=0;

    $(document).ready(function(){

        createDiv();
      
    });

    // check whether the result is empty, if the seatType is  , it means the result should contain all possible seat types
    function checkResult(){
      var i=0;
      var result=0;
      for(i=0;i<jsonStr.length;i++){
        if(jsonStr[i].length==0){
            result+=1+i;
        }
      }
      return result;
     }

    function toggleDetails(obj) {
      //get id number
      var value = obj.id.replace(/[^0-9]/ig,"");
      var tg = document.getElementById("detail" + value + "_content");
      if (tg.style.display == 'none') {
        tg.style.display = 'inline';
      } else {
        tg.style.display = 'none';
      }

    }


    function buyTickets(i){
      var url = createBuyURL();
      window.location=url;
      
    }

    function createAlternativeURL(seattype1,seattype2){
        var Request = new Object();
        Request = GetRequest(); 
        var result = 'result.jsp?customer_from='+Request["customer_from"]+
                  '&customer_to='+Request["customer_to"]+
                  '&customer_date='+Request["customer_date"]+
                  '&customer_returndate='+Request["customer_returndate"]+
                  // '&customer_search='+document.getElementsByName("customer_search")[0].value+
                  '&customer_triptype='+Request["customer_triptype"]+
                  '&customer_cabin='+seattype1+
                  '&customer_returncabin='+seattype2+
                  '&customer_timetype='+Request["customer_timetype"]+
                  '&customer_returntimetype='+Request["customer_returntimetype"]+
                  '&seatTypes='+seatTypeList+
                  '&flightNums='+flightNumberList+'#';

        return result;
    }

    function createBuyURL(){
        var Request = new Object();
        Request = GetRequest(); 
        var result = 'result.jsp?customer_from='+Request["customer_from"]+
                  '&customer_to='+Request["customer_to"]+
                  '&customer_date='+Request["customer_date"]+
                  '&customer_returndate='+Request["customer_returndate"]+
                  // '&customer_search='+document.getElementsByName("customer_search")[0].value+
                  '&customer_triptype='+Request["customer_triptype"]+
                  '&customer_cabin='+Request["customer_cabin"]+
                  '&customer_returncabin='+Request["customer_returncabin"]+
                  '&customer_timetype='+Request["customer_timetype"]+
                  '&customer_returntimetype='+Request["customer_returntimetype"]+
                  '&seatTypes='+seatTypeList+
                  '&flightNums='+flightNumberList+'#';

        return result;
    }

    function GetRequest() {
          var url = location.search; //获取url中"?"符后的字串
          var theRequest = new Object();
          if (url.indexOf("?") != -1) {
          var str = url.substr(1);
          strs = str.split("&");
          for(var i = 0; i < strs.length; i ++) {
          theRequest[strs[i].split("=")[0]]=unescape(strs[i].split("=")[1]);
          }
          }
          return theRequest;
      }    

    //for one way confirmation
    function confirmation1(i){
        console.log(i)
        flightNumberList=jsonStr[now][i].flightNumbers;
        seatTypeList=jsonStr[now][i].seatTypes;
        console.log(flightNumberList)
        console.log(seatTypeList)
        
        if(<%out.print(request.getParameter("customer_triptype").equals("Roundtrip"));%>)
        {   
            $('#successmodal' + i ).modal('hide')
            $(".modal-backdrop").remove();
            now=1;
            if(!createDiv2(i)){
              alert("There is no tickets to return if you buy this one")
            };  

        }
        else{
          now=0;
          if(buyTickets());
        }
    }

    //for round way confirmation
    function confirmation2(i){
        if(true){
     
          flightNumberList+= ticketsList[i].flightNumbers;
          seatTypeList+=ticketsList[i].seatTypes;
         
          buyTickets();       
        }
    }

    function showBoughtTickets(num){
        var bought_details="";
        for (var j = 0; j < jsonStr[0][num].ticketList.length; j++) {
        bought_details+='<div class="col-sm-12"><div class="col-sm-3"><p>Flight Number ' + jsonStr[0][num].ticketList[j].number + '</p>' + '</div><div class="col-sm-3"><p>departs ' + jsonStr[0][num].ticketList[j].departure + ' ' + jsonStr[0][num].ticketList[j].deTimeString + '</p></div><div class="col-sm-3"><p>arrives ' + jsonStr[0][num].ticketList[j].arrival + ' ' + jsonStr[0][num].ticketList[j].arTimeString + '</p></div><div class="col-sm-3"><p>' + jsonStr[0][num].ticketList[j].flightTime + 'minutes' + '</p></div></div>';
         }
        document.getElementById('bought').innerHTML= bought_details;      
    }

    // remove the former search result
    function removeDiv(){
      $('.flight-div1').remove();
      $('.col-sm-8').remove();
      console.log("d");
    }

    // for the outbound or one way flight
    function createDiv() {
        
        removeDiv();
        var root = document.getElementById('root');
        // document.getElementBy

        ticketsList=jsonStr[0];

        for (var i = 0; i < ticketsList.length; i++) {
          var txt_id = "detail" + i + "_tag";
          var txt_content = "detail" + i + "_content";
          var forward_List = "success.jsp?";

          var detail_txt = "";
          var select_txt = "";

          var currentTicket=[];
          currentTickets=ticketsList[i];

          for (var j = 0; j < currentTickets.ticketList.length; j++) {
            


            detail_txt += '<div class="col-sm-12"><div class="col-sm-3"><p>Flight Number ' + currentTickets.ticketList[j].number + "  "+ currentTickets.ticketList[j].seatType + '</p>' + '</div><div class="col-sm-3"><p>departs ' + currentTickets.ticketList[j].departure + ' ' + currentTickets.ticketList[j].deTimeString + '</p></div><div class="col-sm-3"><p>arrives ' + currentTickets.ticketList[j].arrival + ' ' +
            currentTickets.ticketList[j].arTimeString + '</p></div><div class="col-sm-3"><p>' + currentTickets.ticketList[j].flightTime + 'minutes' + '</p></div></div>';

            forward_List += "flight" + j + '=' + currentTickets.ticketList[j].number + '&' + 'seatType' + j + '=' + currentTickets.ticketList[j].seatType;
            if (j != currentTickets.ticketList.length - 1) {
              forward_List += '&';
            }
          }
          forward_List += '#';
          //alert(forward_List);


          select_txt += '<button class="btn btn-success" type="button" data-toggle="modal" data-target="#successmodal' + i + '">Select</button>          <div class="modal fade" id="successmodal' + i + '" tabindex="-1" role="dialog"><div class="modal-dialog"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button><h4 class="modal-title">Ticket Concirmation</h4></div><div class="modal-body">Are you sure to buy this ticket?</div><div class="modal-footer"><button type="button" class="btn btn-default" data-dismiss="modal">No</button><button type="button" class="btn btn-primary" onClick="confirmation1('+ i +')"data-dismiss="modal">Yes</button></div></div></div></div>';



          root.innerHTML = root.innerHTML + '<div class="row flight-div1" ><div class="col-sm-8 row-content flight-div2"><div class="col-sm-9 padding-p"><div class="col-sm-12"><div class="col-sm-4">' +
          '<p>' + currentTickets.ticketList[0].departure + ' ' + currentTickets.deTimeString.split(" ")[1] +  ' - <br>' + currentTickets.ticketList[currentTickets.ticketList.length-1].arrival + ' ' + currentTickets.arTimeString.split(" ")[1] + '</p>'
          + '</div><div class="col-sm-4"><p>' + currentTickets.totalFlightTime + '</div><div class="col-sm-4">  <p>'  + (currentTickets.ticketList.length-1) +  '</p></div></div></div>' + '<div class="col-sm-3"><p style="font-size:30px"><span class="glyphicon glyphicon-usd" style="font-size: 25px"></span>' + currentTickets.totalPrice.toFixed(1) + '</p><p>' + select_txt + '</p><ul class="list-unstyled">  <li><a id="' + txt_id + '" href="#" onClick="toggleDetails(this)">Flight Details <span class="caret"></span></a></li>  </ul></div>' + '<div id="' + "detail" + i + "_content" + '" style="display:none" class="col-sm-12 flight-div3">' + detail_txt + '</div>'
          + '</div></div>' + '<div class="row "><div class="col-sm-8" style="border-bottom:2px ridge #999900"><p style="padding:8px"></p></div></div>'
        }
    }


    //for return flights
   function createDiv2(num) {
        
        now=1;
        var root = document.getElementById('root');




        //return tickets
        var returnticketsList=jsonStr[1];
        ticketsList=[];
        var outTime=new Date(jsonStr[0][num].arTimeString).getTime();

       
        for (var i = 0; i < returnticketsList.length; i++) {
            if(new Date(returnticketsList[i].deTimeString).getTime()>outTime)
              {ticketsList.push(returnticketsList[i])}
            else continue;
            }
        if(ticketsList.length==0){return false;}
        console.log(returnticketsList.length+" rl1 " + ticketsList.length+ " ticketList")

        console.log("have tickets")
        showBoughtTickets(num);
        removeDiv();

        for (var i = 0; i < ticketsList.length; i++) {
          var txt_id = "detail" + i + "_tag";
          var txt_content = "detail" + i + "_content";
          var forward_List = "success.jsp?";

          var detail_txt = "";
          var select_txt = "";

          var currentTickets=ticketsList[i];

          for (var j = 0; j < currentTickets.ticketList.length; j++) {
            


            detail_txt += '<div class="col-sm-12"><div class="col-sm-3"><p>Flight Number ' + currentTickets.ticketList[j].number + "  "+ currentTickets.ticketList[j].seatType + '</p>' + '</div><div class="col-sm-3"><p>departs ' + currentTickets.ticketList[j].departure + ' ' + currentTickets.ticketList[j].deTimeString + '</p></div><div class="col-sm-3"><p>arrives ' + currentTickets.ticketList[j].arrival + ' ' + currentTickets.ticketList[j].arTimeString + '</p></div><div class="col-sm-3"><p>' + currentTickets.ticketList[j].flightTime + 'minutes' + '</p></div></div>';

            forward_List += "flight" + j + '=' + currentTickets.ticketList[j].number + '&' + 'seatType' + j + '=' + currentTickets.ticketList[j].seatType;
            if (j != currentTickets.ticketList.length - 1) {
              forward_List += '&';
            }
          }
          forward_List += '#';
          //alert(forward_List);


          select_txt += '<button class="btn btn-success" type="button" data-toggle="modal" data-target="#successmodal' + i + '">Select</button><div class="modal fade" id="successmodal' + i + '" tabindex="-1" role="dialog"><div class="modal-dialog"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button><h4 class="modal-title">Ticket Concirmation</h4></div><div class="modal-body">Are you sure to buy this ticket?</div><div class="modal-footer"><button type="button" class="btn btn-default" data-dismiss="modal">No</button><button type="button" class="btn btn-primary"onClick="confirmation2('+ i +')"data-dismiss="modal">Yes</button></div></div></div></div>';




          root.innerHTML = root.innerHTML + '<div class="row flight-div1" ><div class="col-sm-8 row-content flight-div2"><div class="col-sm-9 padding-p"><div class="col-sm-12"><div class="col-sm-4">' +
          '<p>' + currentTickets.ticketList[0].departure + ' ' + currentTickets.deTimeString.split(" ")[1] +  ' - <br>' + currentTickets.ticketList[currentTickets.ticketList.length-1].arrival + ' ' + currentTickets.arTimeString.split(" ")[1] + '</p>'
          + '</div><div class="col-sm-4"><p>' + currentTickets.totalFlightTime + '</div><div class="col-sm-4">  <p>'  + (currentTickets.ticketList.length-1) +  '</p></div></div></div>' + '<div class="col-sm-3"><p style="font-size:30px"><span class="glyphicon glyphicon-usd" style="font-size: 25px"></span>' + currentTickets.totalPrice.toFixed(1) + '</p><p>' + select_txt + '</p><ul class="list-unstyled">  <li><a id="' + txt_id + '" href="#" onClick="toggleDetails(this)">Flight Details <span class="caret"></span></a></li>  </ul></div>' + '<div id="' + "detail" + i + "_content" + '" style="display:none" class="col-sm-12 flight-div3">' + detail_txt + '</div>'
          + '</div></div>' + '<div class="row "><div class="col-sm-8" style="border-bottom:2px ridge #999900"><p style="padding:8px"></p></div></div>'
        }

        return true;
    }








      function sortbyprice(){    
       function sortprice (a,b){
        return a.totalPrice - b.totalPrice; 
      }  
     jsonStr[0].sort(sortprice);
     createDiv();
     }
        
     function sortbyflighttime(){
       function sortflighttime(a,b){
         return a.totalFlightMinute - b.totalFlightMinute;
       }
     jsonStr[0].sort(sortflighttime);
     createDiv();
     }
     
     function sortbydeparturetime(){
       function sortdeparturetime(a,b){
         if(a.deTimeString > b.deTimeString){
           return 1;
         }
         else if(a.deTimeString < b.deTimeString){
           return -1;
         }
         else{
           return a.totalPrice - b.totalPrice;
         }
       }
    jsonStr[0].sort(sortdeparturetime);
    createDiv();
     }
              
           function sortbyarrivaltime(){
             function sortarrivaltime(a,b){
               if(a.arTimeString > b.arTimeString){
                 return 1;
               }
               else if(a.arTimeString < b.arTimeString){
                 return -1;
               }
               else{
                 return a.totalPrice - b.totalPrice;
               }
             }
          jsonStr[0].sort(sortarrivaltime);
          createDiv();
           }
           function sortbyprice2(){     
         function sortprice (a,b){
          return b.totalPrice - a.totalPrice; 
        }  
       jsonStr[0].sort(sortprice);
       createDiv();
       }
          
       function sortbyflighttime2(){
         function sortflighttime(a,b){
           return b.totalFlightMinute - a.totalFlightMinute;
         }
       jsonStr[0].sort(sortflighttime);
       createDiv();
       }
       
       function sortbydeparturetime2(){
         function sortdeparturetime(a,b){
           if(a.deTimeString > b.deTimeString){
             return -1;
           }
           else if(a.deTimeString < b.deTimeString){
             return 1;
           }
           else{
             return a.totalPrice - b.totalPrice;
           }
         }
      jsonStr[0].sort(sortdeparturetime);
      createDiv();
       }
          
       function sortbyarrivaltime2(){
         function sortarrivaltime(a,b){
           if(a.arTimeString > b.arTimeString){
             return -1;
           }
           else if(a.arTimeString < b.arTimeString){
             return 1;
           }
           else{
             return a.totalPrice - b.totalPrice;
           }
         }
      jsonStr[0].sort(sortarrivaltime);
      createDiv();
       }
</script>
  </body>
</html>
