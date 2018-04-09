<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>购买成功</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
		.main_Div{
			width:1300px;
			height:1100px;
		}
		.head_Div{
			width:100%;
			height:150px;
		}
	</style>
	
  </head>
  
  <body>
    <div class="main_Div">
		<div class="head_Div">
			<div class="logo">
    			<h1 style="width:130px;float:left;"><img src="images/logo.jpg" /></h1>
    			<h2 style="width:130px;float:left;margin-top:30px;margin-left:30px;">购物成功</h2>
    			
    		</div>
    	</div>
    	<div class="center_Div">
    		<div style="margin-top:-60px; margin-left:70px;width:250px;float:left">
    			<span style="float:left;color:red;width:100px;font-size:25px">用户:</span><input id="user" type="text" value="${username}" style="border:0px;float:left;color:red;width:100px;font-size:25px" readonly="true"/>
    		</div>
    		<span style="font-size:20px;color:#ff4;margin-left:180px;">一共花费：${totalMoney}</span>
    	</div>
    </div>
  </body>
</html>
