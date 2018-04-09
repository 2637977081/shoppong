<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>登录界面 </title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	<style type="text/css">
		.mainDiv{
			margin:0 0;
			width:1350px;
			height:100%;
		}
		
		.topDiv{
			margin-top:0px;
			height:85px;
			width:100%;
		}		
		
		.buttomDiv{
			margin-top:0px;
			height:550px;
			width:100%;
		}
		
		.logDiv{
			margin-left:30px;
			width:128px;
			height:60px;
		}
		
		.bgDiv{
			z-index:10;
			position:absolute;
		}
		.imgLogo{
			margin-top:20px;
			
		}
		
		.registerDiv{
			width:350px;
			height:350px;
			background:rgba(255,255,255,.9);
			top:250px;
			right:150px;
			z-index:12;
			position:absolute;
			border-top:3px solid red;
		}
		
		.registerDiv h1{
			text-align: center;
		}
		.registerForm{
			margin-top:20px;
			margin-left:30px;
			width:235px;
			height:100px;
		}
		
		
		.usDiv{
			width:280px;
			height:40px;	
			border-bottom:2px solid blue;
		}
		
		.pdDiv{
			width:280px;
			height:40px;
			border-bottom:2px solid blue;
		}
		
		input{
			font-size:14px;
			width:240px;
			height:40px;
			border:0px;
			background:rgba(255,255,255,.9);
			float:left;
		}
		
		span{
			float:left;
			margin-top:0px;
		}
		.usDiv:hover{
			border-bottom:2px solid yellow;
		}
		.pdDiv:hover{
			border-bottom:2px solid yellow;
		}
		.subDiv input{
			margin-top:30px;
			width:280px;
			background-color: #f40;
		    border-radius: 3px;
			font-size: 14px;
		}
		.subDiv input:hover{
			background-color:#f52b00; 
		}
		
		.newUs{
			position:absolute;
			top:280px;
			left:190px;
		}
		
		a{
			text-decoration: none;
			color:#6c6c6c;
		}
		a:hover{
			color:#f40;
		}
	</style>
	<script type="text/javascript">
		function logIn(){
			var username=document.getElementById("unId").value;
			var password=document.getElementById("pwId").value;
			
			//alert("登录"+username+"--"+password);
			window.location.href="login.do?username="+username+"&password="+password;
		} 
	</script>
  </head>
  
  <body>
    	<div class="mainDiv">
    		<div class="topDiv">
    			<div class="logDiv">
    				<img alt="" src="images/logo.jpg" class="imgLogo"/>
    			</div>
    		</div>
    		<div class="buttomDiv">
    			
    			<div class="bgDiv">
    				<img src="images/indexBgImg.jpg"/>
    			</div>
    			<div class="registerDiv">
    				
    				<h1>登录</h1>
    				
    				<form class="registerForm">
    					<div class="usDiv">
    						<span><img src="images/us.png"/></span>
    						<input type="text" placeholder="username" id="unId"/>
    					</div>
    					<br/>
            			<div class="pdDiv">
            				<span><img src="images/pw.png"/></span>
            				<input type="password" placeholder="password" id="pwId"/>
            			</div>
						<div class="subDiv">
        					<input type="button" onclick="logIn()" value="登        录"/>
        				</div>

    				</form>
    				
    				<div class="newUs">
    					<span><a href="newUs.jsp">注册新账号</a></span>
    				</div>
    			</div>
    		</div>
    	</div>
  </body>
</html>
