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
    
    <title>购物车</title>
    
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
		.body_Div{
			width:1000px;
			height:1000px;
			border-top:1px solid #ddd;
			margin-left:100px;
		}
		table tr td{
			border-bottom: 1px solid red;
			text-align:center;
		}
		.fDivClass{
    		position: absolute;
    		left: 1100px;
    		top: 170px;
    		border: 1px solid red;
    		width: 200px;
    		height: 330px;
		}
	</style>
	<script type="text/javascript">
		var gcListShow = new Array();
		function getInfo(){
			var user=document.getElementById("user").value;
			//alert("获取信息"+user);
			var gcList = document.getElementById("gcListId").value;
			//alert(gcList);
			/*
			 * 	[GoodsCar [goodId=1009, id=1, mark=0, money=160, number=20, userName=admin], 
			 * 	GoodsCar [goodId=1011, id=2, mark=0, money=0, number=1, userName=admin], 
			 *  GoodsCar [goodId=1011, id=20, mark=0, money=0, number=1, userName=admin], 
			 *  GoodsCar [goodId=1011, id=21, mark=0, money=0, number=1, userName=admin], 
			 *  GoodsCar [goodId=1011, id=22, mark=0, money=0, number=1, userName=admin], 
			 *  			0			1		2		3		4			5
			 *  GoodsCar [goodId=1011, id=23, mark=0, money=0, number=1, userName=admin]]
			*/
			gcList+=",";
			var gcListOne = gcList.split("GoodsCar [");
			var len = gcListOne.length-1;
			for(var i=0;i<len+5;i++){
				gcListShow[i]=new Array();
			}
 			var gcIdTr = document.getElementById("gcId");
 			for(var i=1;i<len+1;i++){
 				gcListOne[i]=gcListOne[i].substring(0,gcListOne[i].length-3);
 				//alert("--"+gcListOne[i]+"--");
 			 	var gcListOneOne = gcListOne[i].split(",");
 			 	for(var j=0;j<gcListOneOne.length;j++){
 			 		//alert("####"+gcListOneOne[j]);
 			 		var gcListMap=gcListOneOne[j].split("=");
 			 		
 			 		gcListShow[i-1][j]=	gcListMap[1];
 			 	}
 			}
 			
 			for(var i=0;i<len;i++){
 				//alert(gcListShow[i][0]+"---"+i);
 				document.getElementById("number"+i).value=gcListShow[i][4];
 			}
		}
		
		function checkAll(){
			var checkId = document.getElementById("checkId").checked;
			//alert(checkId);
			var CheckBox=document.getElementsByName("gcId");
			if(checkId){
				for(i=0;i<CheckBox.length;i++){
					CheckBox[i].checked=true;
				}
			}else{
				for(i=0;i<CheckBox.length;i++){
					CheckBox[i].checked=false;
				}
			}
			jisuan();
		} 
		function jisuan(){
			///for(var i=0;i<9;i++){
				//alert(gcListShow[0][i]+"----");
			//}
			var CheckBox=document.getElementsByName("gcId");
			var money=0;
			for(i=0;i<CheckBox.length;i++){
				if(CheckBox[i].checked){
					var gPrice=document.getElementById("gPrice"+i).innerHTML;
					var discount=document.getElementById("discount"+i).innerHTML;
					var number = document.getElementById("number"+i).value;
					//alert(gPrice+"$$$"+discount);
					//alert(gcListShow[i][2]+"--"+gcListShow[i][4]);
					var moneyOne = gPrice*discount*number;
					money+=moneyOne;
					//alert(gPrice+"*"+discount+"="+moneyOne+"&&");
				}
			}
			//alert(money);
			document.getElementById("totalmoney").value=money;
			
		}
		
		function jieSuan(){
			var CheckBox=document.getElementsByName("gcId");
			var gIdArray ="";
			var numberArrary = "";
 			var moneyArray="";
			for(i=0;i<CheckBox.length;i++){
				if(CheckBox[i].checked){
					var gId=document.getElementById("gId"+i).innerHTML;	
					gIdArray+=gId+",";
					
					var number = document.getElementById("number"+i).value;
					numberArrary+=number+",";
					
					var gPrice=document.getElementById("gPrice"+i).innerHTML;
					var discount=document.getElementById("discount"+i).innerHTML;
					//alert(gPrice+"$$$"+discount);
					//alert(gcListShow[i][2]+"--"+gcListShow[i][4]);
					var moneyOne = gPrice*discount*number;
					moneyArray+=moneyOne+",";
					
				}
			}
			//alert(money);
			//var money=document.getElementById("totalmoney").value;
			var username = document.getElementById("user").value;
			window.location.href="accounts.do?gIdArray="+gIdArray+"&numberArrary="+numberArrary+"&moneyArray="+moneyArray+"&username="+username;
		}
		
		function jia(id){
			//alert(id);
			var number = document.getElementById(id).value;
			number++;
			document.getElementById(id).value=number;
		}
		function jian(id){
			var number = document.getElementById(id).value;
			if(number>0){
				number--;
			}else{
				number=0;
			}
			document.getElementById(id).value=number;
		}
		function deleteGCById(goodId){
			//alert(goodId+"**");
			window.location.href="deleteGCById.do?goodId="+goodId;
		}
	</script>
  </head>
  
  <body onload="getInfo()">
  	<div class="main_Div">
		<div class="head_Div">
			<div class="logo">
    			<h1 style="width:130px;float:left;"><img src="images/logo.jpg" /></h1>
    			<h2 style="width:130px;float:left;margin-top:30px;margin-left:30px;">购物车界面</h2>
    			<div style="margin-top:20px;margin-left:300px;width:150px;float:left">
    				<span style="float:left;color:red;width:40px;font-size:15px">用户:</span><input id="user" type="text" value="${username}" style="border:0px;float:left;color:red;width:100px;font-size:15px" readonly="true"/>
    			</div>
    		</div>
    	</div>
    	<div class="body_Div">
    		<table>
    			<tr>
    				<td style="width:70px;">
    					<input type="checkbox" name="gcName" id="checkId" onclick="checkAll()">全选
    				</td>
    				<td style="width:70px;">商品ID</td>
    				<td style="width:170px;">商品名字</td>
    				<td style="width:70px;">商品图片</td>
    				<td	style="width:64px;">商品数量</td>
    				<td	style="width:64px;">商品单价</td>
    				<td style="width:75px;">商品折扣</td>
    				<td style="width: 65px;">操作</td>
	    			<td><input type="text" style="display:none;" value="${gcList}" id="gcListId"/></td>
    			</tr>
    			<c:forEach items="${gList}" var="gList" varStatus="Status">
    				
    				<tr id="gcId" style="border-bottom:2px solid red; ">
    					<td style="height:100px;"><input type="checkbox" id="gcIdOne${Status.index}" onchange="jisuan()" name="gcId" value="${gList.gId}"/></td>
    					<td style="height:100px;"><div id="gId${Status.index}">${gList.gId}</div></td>
    					<td style="height:100px;"><div>${gList.gName}</div></td>
    					<td style="height:100px;"><div Style="75px;height:75px;"><img style="width:100%;height:100%;" src="images/${gList.gImg}"></div></td>
    					<td style="height:100px;"><img src="images/jian.png" onclick="jian('number${Status.index}')"><input type="text" style="width:30px;" id="number${Status.index}" value="1"><img src="images/jia.png" onclick="jia('number${Status.index}')"></td>
    					<td style="height:100px;"><div id="gPrice${Status.index}">${gList.gPrice}</div></td>
    					<td style="height:100px;"><div id="discount${Status.index}">${gList.discount}</div></td>
    					<td><button onclick="deleteGCById(${gList.gId})">删除</button></td>
    				</tr>
    			</c:forEach>
    				
    		</table>
    	</div>
    	<div id="function_Div" class="fDivClass">
    		<div style="width:200px;margin-top:70px;">
    			<span style="float:left;width:90px;font-size:20px;">商品总价</span>
    			<input type="text" id="totalmoney" value="0" style="border:0px;float:left;width:75px;font-size:20px;"/>
    		</div>
    		<div style="width:200px;">
    			<input type="button" onclick="jieSuan()" value="结算" style="width:150px;height:45px;background:#ff6f06;margin-left:20px;margin-top:20px;"/>
    		</div>
    		
    	</div>
    </div>
  </body>
</html>
