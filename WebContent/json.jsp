<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML>
<html>
	<head>
		<base href="<%=basePath%>">
		<title>My JSP 'jqueryajax.jsp' starting page</title>
		<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
		<script type="text/javascript">
	function  kk(){
		//得到ajax获取到的数据,返回一个object
		 var htmlobj=$.ajax({url:"servlet/JsonServlet",async:false});
		 //将 ajax object 转换为json object,第二种转换
		// htmlobj = jQuery.parseJSON(htmlobj.responseText);
		  htmlobj = eval(htmlobj.responseText);
		  //清空class 为 sj 的标签内容
			 $(".sj").empty();  
		     var html = '<table border="1"><tr><td>ID</td><td>用户名</td><td>密码</td></tr>';
		     //循环获取数据并且拼接成html
		     $.each(htmlobj,function(entryIndex,entry){  
		    	 html += '<tr><td>'+entry['id']+'</td><td>'
		    	 +entry['username']+'</td><td>'
		    	 +entry['password']+'</td></tr>';
		     });
		     
		     html += '</table>';
		     //附加内容到class 为 sj的标签                   
		     $(".sj").append(html);  
	}
</script>
	</head>

	<body>
		<div>
			Jquery 动态获取数据 ，演示..
		</div>

		<div class="sj">

		</div>
		<input type="button" onclick="kk()" value="点击" />
	</body>
</html>
