<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String mark = "" + request.getParameter("mark"); 
%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>用户注册页面</title>
    
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
			width:100%;
			height:700px;
		}
	
		.headDIv {
    		position: relative;
    		height: 43px;
    		padding: 20px 0;
    		width:800xp;
		}
		.logo{
			position: absolute;
			top:10px;
			left:80px;
			width:700px;
			height:60px;
		}
		.logo h1{
			position: absolute;
			top:-21px;
		}
		.logo h2{
			position: absolute;
			top:-8px;
			left:136px;
		}
		
		.step{
			margin-left:80px;
			width:1000px;
			height:50px;
			border-bottom: 2px solid #e6e6e6;
		}
		
		ul li{
			width:150px;
			height:45px;
			float:left;
			margin-left:100px;
			margin-top:5px;
			font-size: 16px;
			color: #999;
			list-style:none;
			text-align:center;
			border-bottom: 2px solid #999;
		}
		.oneLi{
			border-bottom: 2px solid #ff4700;
		}
		ul li:hover{
			border-bottom: 2px solid #ff4700;
		}
		ul li img{
			position:absolute;
			width: 24px;
    		height: 24px;
		}
		.oneLi img{
			left:225px;
		}
		.twoLi img{
			left:475px;
		}
		.threeLi img{
			left:720px;
		}
		form{
			width:790px;
			height:450px;
			margin-top:20px;
			margin-left:100px;
		}
		
		input{
			margin-left:20px;
			width:220px;
			height:40px;
		}
		.context div{
			position:absolute;
			left:400px;
		
		}
		.usDiv{
			top:200px;
		}
		.pwDiv{
			top:270px;
		}
		.pwTwoDiv{
			top:340px;
		}
		.emailDiv{
			top:410px;
		}
		.emailDiv input{
			width:250px;
		}
		.nextOne{
			top:520px;
			width:250px;
		}
		.indentityDiv{
			top:480px;
		}
		.indentityDiv input{
			margin-left:65px;
			width:20px;
			height:20px;
		}
		
		.bankCardDiv{
			top:200px;
		}
		.nameDiv{
			top:340px;
		}
		.idCardDiv{
			top:270px;
		}
		.nextTwo{
			top:410px;
		}
		.musDivId{
			top:200px;
		}
		.mpwDiv{
			top:255px;
		}
		.nextThree{
			top:410px;
		}
		.rgSucess{
			width:400px;
			height:400px;
		}
		.rgSucess span{
			margin-top:20px;
			width:300px;
		}
		.checkUsClass{
			display:none;
			border: 0px;
			position: absolute;
			left:700px;
			height: 200px;
			width:100px;
			height:40px;    
			left: 310px;
  			top: 0;
  			color:red;
		}
	</style>
	
	<script>
		
		function Step(point){
			//alert(point);
			var formId = document.getElementById("contextForm");
			//fomId.action="#";
			//alert(step.childNodes.length+"@@@");--3
			if(point==1){
				for(var i=0;i<formId.childNodes.length;i++){
					if(i>=17){
						formId.childNodes[i].style="display:none";
					}else{
						formId.childNodes[i].style="display:block";
					}	
				}
				document.getElementById("oneLiId").style="border-bottom: 2px solid #ff4700;";
				document.getElementById("twoLiId").style="border-bottom: 2px solid #999;";
				document.getElementById("threeLiId").style="border-bottom: 2px solid #999;";
				
			}else if(point==2){
				//alert(formId.childNodes.length+"--------");--29--35
				//alert(document.getElementById("indentityUs").checked);
				
				
				if(document.getElementById("indentityUs").checked){
					for(var i=0;i<formId.childNodes.length;i++){
						if(i>=17&&i<29){
							formId.childNodes[i].style="display:block";
						}else{
							formId.childNodes[i].style="display:none";
						}	
					}
				}else{
					for(var i=0;i<formId.childNodes.length;i++){
						if(i>=29&&i<37){
							formId.childNodes[i].style="display:block";
						}else{
							formId.childNodes[i].style="display:none";
						}
						document.getElementById("nameDivId").style="display:block";
					}
				}
				document.getElementById("oneLiId").style="border-bottom: 2px solid #999";
				document.getElementById("twoLiId").style="border-bottom: 2px solid #ff4700";
				document.getElementById("threeLiId").style="border-bottom: 2px solid #999";
			}else if(point==3){
				for(var i=0;i<formId.childNodes.length;i++){
					if(i<37){
						formId.childNodes[i].style="display:none";
					}else{
						formId.childNodes[i].style="display:block";
					}	
				}
				
				var un = document.getElementById("usernameId").value;
				var em = document.getElementById("emailId").value;
				var ind = document.getElementById("indentityUs").checked;
				
				var st = "<span style='font-size:20px;'>恭喜注册成功</span>"+"<br/>"+"<br/>"+"<span>登录名："+un+"</span>"+"<br/>"+"<br/>"+"<span>邮箱："+em+"</span>"; 
				if(ind){
					var name = document.getElementById("unameId").value;
					var bc = document.getElementById("bankCardId").value;
					st+="<br/>"+"<br/>"+"<sapn>用户名："+name+"</span>";
					st+="<br/>"+"<br/>"+"<span>银行卡号："+bc+"</span>";
					
				}else{
					
				//alert("11111111");
					var name = document.getElementById("unameId").value;
					st+="<br/>"+"<br/>"+"<sapn>管理人员名："+name+"</span>"+"<br/>"+"<br/>";
				}
				st+="<br/>"+"<br/>"+"<input type='submit' style='background-color: #f40;border-radius: 15px;'/>"
				document.getElementById("rgSucessId").innerHTML=st;
				
				document.getElementById("oneLiId").style="border-bottom: 2px solid #999";
				document.getElementById("twoLiId").style="border-bottom: 2px solid #999";
				document.getElementById("threeLiId").style="border-bottom: 2px solid #ff4700";
			}
		}
		
		function pwTwo(){
			var pwone = document.getElementById("Onepw").value;
			var pwtwo = document.getElementById("Twopw").value;
			//alert(pwone+"###"+pwtwo);
			if(pwone!=pwtwo){
				document.getElementById("warmtxt").innerHTML="密码不匹配";
			}else{
				document.getElementById("warmtxt").innerHTML="密码匹配";
			}
		}
		function usNew(){
			var username = document.getElementById("usernameId").value; 
			//alert("111");
			var xmlhttp = new XMLHttpRequest();
			
			xmlhttp.onreadystatechange = function(){
				//alert(xmlhttp.readyState);
				if(xmlhttp.readyState==4){
					var data = xmlhttp.responseText;
					//alert(data);
					var usArm=document.getElementById("checkUsId").style;
					//alert(usArm.value);
					if(data=="0"){
						document.getElementById("checkUsId").style.display="none";
					}else{
						//alert("111");
						document.getElementById("checkUsId").style.display="block";
					}
				}
			};
			xmlhttp.open("post","usNew.do",false);
			xmlhttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
			xmlhttp.send("username="+username);
		}
	</script>
	
  </head>
  
  <body onload="Step(1)">
    	<div class="mainDiv">
    		<div class="headDIv">
    			<div class="logo">
    				<h1><img src="images/logo.jpg"/></h1>
    				<h2>用户注册</h2>
    			</div>
    		</div>
    		
    		<div class="step" id="stepId">
    			<ul id="stepId">
    				<li class="oneLi" onclick="Step(1)" id="oneLiId">
    					<img alt="" src="images/one.png">
    					<span>填写账号信息</span>
    				</li>
    				<li class="twoLi" onclick="Step(2)" id="twoLiId">
    					<img alt="" src="images/two.png">
    					<span>设置安全信息</span>
    				</li>
    				<li class="threeLi" onclick="Step(3)" id="threeLiId">
    					<img alt="" src="images/three.png">
    					<span>注册信息成功</span>
    				</li>
    			</ul>
    		</div>
    		<div class="context">
    			<form action="newUs.do" id="contextForm">
    			
    			
    				<!-- 账号信息 -->
					<div class="usDiv" id="usDivId">
						<span>用户账号</span>
						<input type="text" name="username" id="usernameId" onchange="usNew()"/>
						<input type="text" value="该用户已存在"  id="checkUsId" class="checkUsClass"/>
						
					</div>
					<div class="pwDiv" id="pwDivId">
    					<span>登录密码</span>
    					<input type="password" name="password" id="Onepw"/>
    				</div>
    				<div class="pwTwoDiv" id="pwTwoDivId">
    					<span>确认密码</span>
    					<input type="password" name="passwordTwo" id="Twopw" onchange="pwTwo()"/>
    					<span id="warmtxt" style="color:red;position:absolute;left:310px;width:100px;top:7px;"></span>
    				</div>
    				<div class="emailDiv" id="emailDivId">
    					<span>邮箱</span>
    					<input type="text" name="email" id="emailId"/>
    				</div>
    				<div class="indentityDiv" id="indentityId">
    					<input type="radio" name="indentity" checked="checked" id="indentityUs" value="用户"/>用户
    					<p></p>
    					<input type="radio" name="indentity" value="管理人员"/>管理人员
    				</div>
    				<div class="nextOne" id="nextOneId">
    					<input type="button" onclick="Step(2)" value="提交" style="background-color: #f40; border-radius:15px; margin-left:30px; font-size:14px;width:220px;height:40px;"/>
    				</div>
    				<!-- 17个节点 -->
    				
    				<!--用户   银行卡号 -->
    				<div class="bankCardDiv" id="bankCardDivId">
    					<span>银行卡号</span>
    					<input type="text" name="bankCard" id="bankCardId"/>
    				</div>
    				<div class="idCardDiv" id="idCardId">
    					<span>身份证号</span>
    					<input type="text" name="idCard"/>
    				</div>
    				<div class="nameDiv" id="nameDivId">
    					<span>用户姓名</span>
    					<input type="text" name="name" id="unameId"/>
    				</div>
    				<div class="nextTwo" id="nextTwoId">
    					<input type="button" onclick="Step(3)" value="提交" style="background-color: #f40; border-radius:15px; margin-left:30px; font-size:14px;width:220px;height:40px;"/>
    				</div>
    				
    				<!--管理人员  账号 注册-->
    				<div class="musDiv" id="musDivId">
						<span>用户账号</span>
						<input type="text" name="musername" />
					</div>
					<div class="mpwDiv" id="mpwDivId">
    					<span>登录密码</span>
    					<input type="password" name="mpassword"/>
    				</div>
    				<div class="nextThree" id="nextThreeId">
    					<input type="button" onclick="Step(3)" value="提交" style="background-color: #f40; border-radius:15px; margin-left:30px; font-size:14px;width:220px;height:40px;"/>
    				</div>
    				
    				<!-- 注册成功 -->
    				<div class="rgSucess" id="rgSucessId">
    					
    				</div>
    				
    			</form>
    		</div>
    	</div>
  </body>
</html>
