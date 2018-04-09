<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>商城主页</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style>
		.main_Div{
			height:100%;
			width:1300px;
			float:left;
			margin-left:30px;
		}
		.head_Div{
			width:1300px;
			height:100px;
		}
		.left_Div{
			text-align: center;
    		height: 40px;
   			width: 215px;
		}
		.center_Div{
			border-left: 1px solid red;
			width:1015px;
			height:800px;
			margin-left:260px;
    		margin-top: -60px;
		}
		.buttom_Div{
			margin-left:100px;
			margin-top:5px;
			width:700px;
			height:150px;
			text-align:center;
			overflow: hidden;
			word-wrap:break-word;
		}
		ul li{
			text-align: center; 
    		height: 40px;
    		width: 215px;
    		background: #ddd;
    		list-style: none;
    		border: 1px solid white;
		}
		ul li:hover{
			background:#f40;
			border:2px solid #f40;
		}
	</style>
	
	
	<script type="text/javascript">
		
		function OnLoad(){
			var varValue =document.getElementById("showKind");
			//alert("查询商品种类"+varValue);
			if(varValue==null||varValue==""){
				window.location.href="getInfoKindtoMark.do";
			}
		}
		function showKinds(akName){
			//alert("种类名称"+akName+"---");
			var gKindUl = document.getElementById("gKindUl");
			for(var i=0;i<gKindUl.childNodes.length;i++){
				var childId = gKindUl.childNodes[i].id;
				//alert(childId+"--种类ID--");
				if(childId!=null&&childId!="undefined"){
					if(childId==akName){
						document.getElementById(childId).style.border="2px solid #f40";
						gKindUl.childNodes[i].style.background="#f40";
					}else{
						document.getElementById(childId).style.border="1px solid white";
						gKindUl.childNodes[i].style.background="#ddd";
					}
				}
			}
			var gList=document.getElementById("GKindId").value;
			//alert(gList+"\n");
			/*[Goods [descibe=null, discount=0.8, gBusiness=null,
			 *  gId=1001, gImg=asdasd, gKind=饮品类, gName=康师傅矿泉水, 
			 *  gNumber=500, gPrice=2.00], 
			 *  Goods [descibe=null, discount=null, gBusiness=a厂家, gId=1002, gImg=null, gKind=生活用品, gName=心相印纸巾10包, gNumber=1500, gPrice=7.99], Goods [descibe=null, discount=null, gBusiness=a厂家, gId=1003, gImg=null, gKind=生活用品, gName=蓝月亮机洗洗衣液, gNumber=800, gPrice=58.10]*/
			var gListOne = gList.split("Goods [");
			var len=0;
			var gListShow = new Array();
			for(var i=0;i<1000;i++){
				gListShow[i] = new Array();
			}
			var center_Div = document.getElementById("centerId");
			for(var i=1;i<gListOne.length;i++){
				//alert(gListOne[i]+"i的值"+i);//descibe=null, discount=0.8, gBusiness=null, gId=1001, gImg=asdasd, gKind=饮品类, gName=康师傅矿泉水, gNumber=500, gPrice=2.00], 
				//alert(gListOne[i].split(akName).length+"判断"+gListOne[i]);
				if(gListOne[i].split(akName).length>1){
					gListOne[i]=gListOne[i].substring(0,gListOne[i].length-3);
										//  0                     1            2           3            4        5                  6                7            8
					//alert(gListOne[i]);//descibe=null, discount=null, gBusiness=a厂家, gId=1002, gImg=null, gKind=生活用品, gName=心相印纸巾10包, gNumber=1500, gPrice=7.99
					var gListOneInfo = gListOne[i].split(",");
					for(var j=0;j<gListOneInfo.length;j++){
						var gListOneMap = gListOneInfo[j].split("=");
						var gListOneKey = gListOneMap[0];
						var gListOneValue = gListOneMap[1];
						//alert(gListOneKey+"---"+gListOneValue+"---"+j);
						
						gListShow[len][j]=gListOneMap[1];
						
						//alert(gListShow[len][j]+"---"+len);
					}
					len++;
				}
				
			}
			//alert(len+"----------------------");
			center_Div.innerHTML="";
			//alert("清屏");
			for(var i=0;i<len;i++){
				var gId = gListShow[i][3];
				var good_div = document.createElement("div");
				good_div.style="border:1px solid #ddd;width:200px;height:300px;text-align:center;float:left;";
				good_div.onclick=function(){
					//alert(gId);
					toGoodCar(gId);
				};
				good_div.innerHTML="<div style='overflow: hidden;word-wrap:break-word;width:200px;height:180px;'><img src='images/"+gListShow[i][4]+"'/></div><br/><br/>" +
									"<span style='font-size:15px;margin-top:5px'>商品名字:"+gListShow[i][6]+"</span><br/>"+
									"<sapn style='font-size:10px;color:red;margin-top:5px;'>商品价格:￥"+gListShow[i][8]+"<br/>商品折扣:"+gListShow[i][1]+"---"+gListShow[i][5]+"</span>";

				center_Div.appendChild(good_div);
			}
		}
		
		function toGoodCar(goodOneId){
			alert("添加到购物车"+goodOneId);
			var username="";
			if(document.getElementById("user")!=null){
				username=document.getElementById("user").value;	
			}
			window.location.href="addGoodCars.do?goodOneId="+goodOneId+"&username="+username;
		}
	</script>
  </head>
  
  <body onload="OnLoad()">
   <div class="main_Div">
		<div class="head_Div">
			<div class="logo">
    			<h1 style="width:130px;float:left;"><img src="images/logo.jpg" /></h1>
    			<h2 style="width:130px;float:left;margin-top:30px;margin-left:30px;">商城主页</h2>
    		</div>
    		<div style="position:absolute;left:500px;top:50px;left:550px;">
    			<c:if test="${username != null }">
  					<span style="color:red;">亲爱的:<input type="text" id="user" style="border:0px;color:red;font-size:inherit;" readonly="true" value="${username}"/></span>
  				</c:if>
  				<c:if test="${username == null}">
  					<span>
  						<a  style="text-decoration:none;color:red;" href="index.jsp">请登录</a>
  					</span>
  					
  				</c:if>
    		</div>
    	</div>
    	<div class="body_Div">
    		<div class="left_Div">
    			<ul id="gKindUl">
    				<c:forEach items="${gKList}" var="gKList" varStatus="Status">
    					<li id="showKind" style="display:none"></li>
    					<li id="${gKList.kName}" onclick="showKinds('${gKList.kName}')">${gKList.kName}</li>
    				</c:forEach>
    			</ul>
    		</div>
    		
    		<input type="text" style="display:none" id="GKindId" value="${gList}"/>
    		<div class="center_Div" id="centerId">
    			<!--<c:forEach items="${gList}" var="gList" varStatus="Status"> 
    				<c:if test="${gList.gKind}"></c:if>
    				<div>${gList.gId}</div>
    			</c:forEach>-->
    		</div>
    	</div>
    	<div class="buttom_Div">
    		<img  src="images/${adv.path}">
    	</div>
    </div>
  </body>
</html>
