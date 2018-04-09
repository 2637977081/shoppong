<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.hzyc.shopping.po.Goods"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>商城后台</title>
    
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
			height:1000px;
			width:1300px;
			float:left;
			margin-left:30px;
		}
		.head_Div{
			width:1300px;
			height:100px;
		}
		.body_Div{
			width:100%;
			height:700px;
		}
		.left_Div{	
			height:100%;
			width:20%;
			float:left;
		}
		.right_Div{	
			
			height:700px;
			width:1000px;
			float:left;
			border:2px solid red;
		}
		.logo{
			float:left;
			width:300px;
			height:100px;
			position: absolute;
		}
		
		.logo h1{
			position: absolute;
			top:0px;
		}
		.logo h2{
			position: absolute;
			top:10px;
			left:150px;
		}
		ul li{
			text-align:center;
			height:40px;
			width:215px;
			background:#ddd;
			list-style: none;
			border:1px solid white;
			
		}
		ul li:hover{
			background:#f40;
			border:2px solid #f40;
		}
		.oneLiClass{
			background:#f40;
			border:2px solid #f40;
		}
		input{
			width:220px;
			height:40px;
			margin-left:20px;
		}
		select{
			width:220px;
			height:40px;
			margin-left:25px;
		}
		.gAdd{
			margin-left:240px;
    		margin-top:15px;
		}
		.gAdd div{
			margin-top:25px;
		}
		.gImgInput{
			border:1px solid #ddd; 
			padding: 4px 10px;  
			position: absolute; 
		}
		.gNumberAndgPriceClass input{
			width:100px;
		}
		.ImgClass{
			width: 146px;
    		height: 174px;
    		border: 1px solid red;
    		position: absolute;
    		top: 210px;
    		left: 975px;
    		overflow:hidden;
		}
		.gImgClass{
			width: 150px;
    		position: absolute;
    		top: 150px;
    		left: 883px;
		}
		.img{
			max-width:146px;
			max-height:174px;
		}
		.updateKind{
			margin-top:80px;
			width:320px;
			height:120px;
			margin-left:300px;
		}
		.updateKind input{
			margin-top:25px;
		
		}
		.addKindClass{	
			background-color: #f40;
   			border-radius: 15px;
    		margin-left: 30px;
    		font-size: 14px;
    		width: 220px;
    		height: 40px;
		}
		.deleteKind{
			margin-top:45px;
			width:320px;
			height:120px;
			margin-left:300px;
		}
		.deleteKind input{
			margin-top:25px;
		}
		.dKindClass{
			background-color: #f40;
   			border-radius: 15px;
    		margin-left: 30px;
    		font-size: 14px;
    		width: 220px;
    		height: 40px;
		}
		table tr{
			height:30px;
			width:900px;
			border-bottom:1px solid red;
		}
		table tr td{
			text-align: center;
			overflow:hidden; 
			word-wrap:break-word;
			border-bottom:1px solid red;
		}
		table tr td div{
			overflow-x:hidden;overflow-y:hidden;
			height:73px;
		}
		table a{
			text-decoration:none;
			color:#f40;
		}
		.gtInfoClass{
			display:block;
		}
		.buyGoodClass table tr td{
			width:100px;
			text-align:center;
		}
	</style>
	
	<script type="text/javascript">
		function OnLoad(){
			var point=1;
			var xmlhttp = new XMLHttpRequest();
			xmlhttp.onreadystatechange = function(){
				
				if(xmlhttp.readyState==4){
					point = xmlhttp.responseText;
					//alert(point+"-----");
				}
			};
			xmlhttp.open("post","AddGoodsFunction.do",false);
			xmlhttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
			xmlhttp.send(null);
			//getGoodInfo();
			if(window.name==""){
				window.name="0";
				getGoodInfo();
			}else{
				window.name = eval(window.name)+1;
				//alert("页面刷新次数"+window.name);
			}
			
			getInfo();
			showGoods(point);
		}
	
		function getInfo(){
			
			var xmlhttp = new XMLHttpRequest();
			
			xmlhttp.onreadystatechange = function(){
				//alert(xmlhttp.readyState);
				if(xmlhttp.readyState==4){
					var data = xmlhttp.responseText;
					//alert(data+"-----");//[{"kName":"服装类"},{"kName":"食品类"},{"kName":"电器类"},{"kName":"玩具类"}]
					//获取下拉框元素
					var selectGKind = document.getElementById("gKindId");
					var selectdKind = document.getElementById("dKindId");
					//格式化数据
					var dataArray = eval("("+data+")");
					
					for(var i=0;i<dataArray.length;i++){
						//创建option
						//alert(dataArray[i].kName+"#####");
						var newOption = document.createElement("option");
						newOption.innerText = dataArray[i].kName;
						newOption.value = dataArray[i].kName;
						selectGKind.appendChild(newOption);
						
						var TwoOption = document.createElement("option");
						TwoOption.innerText = dataArray[i].kName;
						//alert(TwoOption.innerText);
						TwoOption.value = dataArray[i].kName; 
						selectdKind.appendChild(TwoOption);
					}
					
				}
			};
			xmlhttp.open("post","queryGKindAll.do",false);
			xmlhttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
			xmlhttp.send(null);
		}
		function getGoodInfo(){
			window.location.href="queryGoodsAll.do";
		}
		
		function pageUp(){
			//alert("上一页");
			var nowPage = document.getElementById("nowPage").value;
			//alert("当前页数"+nowPage);
			window.location.href="pageUp.do?nowPage="+nowPage;
		}
		function pageDown(){
			//alert("下一页");
			var nowPage = document.getElementById("nowPage").value;
			//alert("当前页数"+nowPage);
			window.location.href="pageDown.do?nowPage="+nowPage;
		}
		
		
		function setTotal(){
			var xmlhttp = new  XMLHttpRequest();
			
			xmlhttp.onreadystatechange = function(){
				if(xmlhttp.readyState==4){
					var data = xmlhttp.responseText;
				}
			};
			xmlhttp.open("post","total.do",false);
			xmlhttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
			xmlhttp.send(null);
		}
		function showGoods(point){
			//alert("11111111111111");
			
			var Div_Id = document.getElementById("rDivId");
			
			//alert(formId.childNodes.length);//15、
			var ulId = document.getElementById("ulId");
			
			//alert(ulId.childNodes.length+"****"+ulId.childNodes[3].id);
			if(point==1){
				for(var i=0;i<Div_Id.childNodes.length;i++){
					//alert(Div_Id.childNodes[i].id);
					if(Div_Id.childNodes[i].id=="gAddId"){
						//alert("1111");
						Div_Id.childNodes[i].style="display:block";
					}else{
						Div_Id.childNodes[i].style="display:none";
					}	
				}
				
				var goodsOne = document.getElementById("goodone").value;
				//alert(typeof(goodsOne)+"-------");
				//               0            1               2            3          4          5                  6                    7           8
				/*[Goods [descibe=null, discount=null, gBusiness=a厂家, gId=1002, gImg=null, gKind=生活用品, gName=心相印纸巾10包, gNumber=1500, gPrice=7.99]]
				 * */
				var info = goodsOne.substring(8,goodsOne.length-2);
				//alert(goodsOne+"\n"+info);
				var Map=new Array();
				var j=0;
				var infoArray= info.split(",");
				for(var i=0;i<infoArray.length;i++){
					//alert(infoArray[i]+"----");
					var MapArray = infoArray[i].split("=");
					Map[j++]=MapArray[1];
				}
				/*for(var i=0;i<j;i++){
					alert(Map[i]+"***"+i);
				}*/
				var bbb = document.getElementById("gNameID").value;
				//alert(Map[3]+"--**--"+bbb);
				if(typeof(Map[3])=="undefined"&&bbb==""){
					//alert("111111");
				}else{
					document.getElementById("gnIdID").value=""+Map[3];
					var optionObj = document.getElementById("gKindId");
					for(var i=0;i<optionObj.length;i++){
						//alert(optionObj[i].value+"---"+Map[5]);
						if(optionObj[i].value==Map[5]){
							optionObj[i].selected = true;
							break;
						}	
					}
					document.getElementById("gNameID").value=""+Map[6];
					document.getElementById("gNumberId").value=""+Map[7];
					document.getElementById("gPriceId").value=""+Map[8];
					document.getElementById("gDiscount").value=""+Map[1];
					document.getElementById("gBusinessIId").value=""+Map[2];
					document.getElementById("subGood").style.display="none";
					document.getElementById("btnGood").style.display="block";
					document.getElementById("txtGood").style.display="none";
					//document.getElementById("MapTxt").value=Map;
					//alert(document.getElementById("MapTxt").style.value);
					//               0            1               2            3          4          5                  6                    7           8
					/*[Goods [descibe=null, discount=null, gBusiness=a厂家, gId=1002, gImg=null, gKind=生活用品, gName=心相印纸巾10包, gNumber=1500, gPrice=7.99]]
					 * */
					/*Goods g = new Goods();
					g.gId = Map[3];
					g.gName = Map[6];
					g.discount = Map[1];
					g.gBusiness = Map[2];
					g.gImg = Map[4];
					g.gKind = Map[5];
					g.gNumber = Map[7];
					g.gPrice = Map[8];*/
					//alert(Map.length+"$$$");
					//inputObj.onclick=upadateOne(Map);
					
					if(Map[4]!="null"||Map[4]==""){
						//alert(Map[4]+"***");
						document.getElementById("imgId").src="images/"+Map[4];
					}
				}
				document.getElementById("oneLi").style.border='2px solid #f40';
				document.getElementById("oneLi").style.background='#f40';
				document.getElementById("twoLi").style.border='1px solid white';
				document.getElementById("twoLi").style.background='#ddd';
				document.getElementById("threeLi").style.border='1px solid white';
				document.getElementById("threeLi").style.background='#ddd';
				document.getElementById("fourLi").style.border='1px solid white';
				document.getElementById("fourLi").style.background='#ddd';
				document.getElementById("fiveLi").style.border='1px solid white';
				document.getElementById("fiveLi").style.background='#ddd';
				/*for(var j=0;j<ulId.childNodes.length;j++){
					alert("j"+j+"-point-"+point+"-(point-1)*2-"+(point*2-1)+"-point*2-1-"+(point*2-1));
					if((point-1)*2==j||(point*2-1)==j){
						alert("*-j-*"+j+"$$$"+ulId.childNodes[j].id);
						//ulId.childNodes[j].style.border='2px solid #f40';
						//ulId.childNodes[j].style.background='#f40';
					}else{
						//ulId.childNodes[j].style="background:#FF6537;";
					}
				}*/
			}else if(point==2){
				for(var i=0;i<Div_Id.childNodes.length;i++){
					if(Div_Id.childNodes[i].id=="updateKindId"||Div_Id.childNodes[i].id=="deleteKindId"){
						Div_Id.childNodes[i].style="display:block";
					}else{
						Div_Id.childNodes[i].style="display:none";
					}	
				}
				document.getElementById("twoLi").style.border='2px solid #f40';
				document.getElementById("twoLi").style.background='#f40';
				document.getElementById("oneLi").style.border='1px solid white';
				document.getElementById("oneLi").style.background='#ddd';
				document.getElementById("threeLi").style.border='1px solid white';
				document.getElementById("threeLi").style.background='#ddd';
				document.getElementById("fourLi").style.border='1px solid white';
				document.getElementById("fourLi").style.background='#ddd';
				document.getElementById("fiveLi").style.border='1px solid white';
				document.getElementById("fiveLi").style.background='#ddd';
			}else if(point==3){
				//alert(point);
				//getGoodInfo();
				//alert("功能3");
				//
				var variable1=document.getElementById("GoodsId");
				//alert(variable1+"商品信息表");
				if(variable1 == null || variable1 == ''){
					getGoodInfo();
				}
				for(var i=0;i<Div_Id.childNodes.length;i++){
					if(Div_Id.childNodes[i].id=="upGoodId"){
						Div_Id.childNodes[i].style="display:block";
					}else{
						Div_Id.childNodes[i].style="display:none";
					}	
				}
				//alert(window.name+"判断按钮");
				
				document.getElementById("threeLi").style.border='2px solid #f40';
				document.getElementById("threeLi").style.background='#f40';
				document.getElementById("twoLi").style.border='1px solid white';
				document.getElementById("twoLi").style.background='#ddd';
				document.getElementById("oneLi").style.border='1px solid white';
				document.getElementById("oneLi").style.background='#ddd';
				document.getElementById("fourLi").style.border='1px solid white';
				document.getElementById("fourLi").style.background='#ddd';
				document.getElementById("fiveLi").style.border='1px solid white';
				document.getElementById("fiveLi").style.background='#ddd';
			}else if(point==4){
				for(var i=0;i<Div_Id.childNodes.length;i++){
					if(Div_Id.childNodes[i].id=="mAdv"){
						Div_Id.childNodes[i].style="display:block";
					}else{
						Div_Id.childNodes[i].style="display:none";
					}	
				}
				var variable1=document.getElementById("advImgDiv");
				//alert(variable1+"广告");
				if(variable1 == null || variable1 == ''){
					getInfoAdv();
				}
				
				document.getElementById("fourLi").style.border='2px solid #f40';
				document.getElementById("fourLi").style.background='#f40';
				document.getElementById("twoLi").style.border='1px solid white';
				document.getElementById("twoLi").style.background='#ddd';
				document.getElementById("threeLi").style.border='1px solid white';
				document.getElementById("threeLi").style.background='#ddd';
				document.getElementById("oneLi").style.border='1px solid white';
				document.getElementById("oneLi").style.background='#ddd';
				document.getElementById("fiveLi").style.border='1px solid white';
				document.getElementById("fiveLi").style.background='#ddd';
				
			}else if(point=5){
				for(var i=0;i<Div_Id.childNodes.length;i++){
					if(Div_Id.childNodes[i].id=="buyGood"){
						Div_Id.childNodes[i].style="display:block";
					}else{
						Div_Id.childNodes[i].style="display:none";
					}	
				}
				var variable1=document.getElementById("gcListId");
				//alert(variable1+"广告");
				if(variable1 == null || variable1 == ''){
					window.location.href="showBuyGoods.do";
				}
				document.getElementById("fiveLi").style.border='2px solid #f40';
				document.getElementById("fiveLi").style.background='#f40';
				document.getElementById("twoLi").style.border='1px solid white';
				document.getElementById("twoLi").style.background='#ddd';
				document.getElementById("threeLi").style.border='1px solid white';
				document.getElementById("threeLi").style.background='#ddd';
				document.getElementById("fourLi").style.border='1px solid white';
				document.getElementById("fourLi").style.background='#ddd';
				document.getElementById("oneLi").style.border='1px solid white';
				document.getElementById("oneLi").style.background='#ddd';
			}
		}
		
		function upImg(){
			var gImgId = document.getElementById("gImgId").value;
			//alert(this.value);
			//alert(gImgId+"----"+gImgId.length);//C:\fakepath\indexBgImg.jpg
			var mark=0;
			for(var i=gImgId.length-1;i>0;i--){
				//alert(i+"----------"+gImgId.charAt(i));
				if(gImgId.charAt(i)==("\\")){ 
					mark=i;
					break;
				}
			}
			gImgId=gImgId.substring(mark,gImgId.length);
			gImgId="images\\"+gImgId;
			//alert(gImgId+"****");
			document.getElementById("imgId").src=gImgId;
		}
		function queryOne(gId){
			window.location.href="QuerryOne.do?gId="+gId;
		}
		function upadateOne(){
			var Map = new Array();
			Map[0]=document.getElementById("gnIdID").value;
			Map[1]=document.getElementById("gNameID").value;
			Map[2]=document.getElementById("gKindId").value;
			Map[3]=document.getElementById("gNumberId").value;
			Map[4]=document.getElementById("gPriceId").value;
			Map[5]=document.getElementById("gDiscount").value;
			Map[6]=document.getElementById("gBusinessIId").value;
			Map[7]=document.getElementById("imgId").src;
			Map[7]=Map[7].split("http://localhost:8080/shopping/images/")[1];
			//alert(Map[7]+"-更新--");
			window.location.href="upadateOne.do?Map="+Map;
		}
		
		function deleteOne(gId){
			//alert("删除"+gId);
			window.location.href="deleteOne.do?gId="+gId;
		}
		function setInfoAdv(){
			var path = document.getElementById("setImgPath").value;
			//C:\fakepath\ad3.jpg
			var ImgPath = path.substring(12,path.length);
			document.getElementById("addAdvId").src="images/"+ImgPath;
			//alert("添加图片"+ImgPath);
			window.location.href="addAdv.do?path="+ImgPath;
		}
		function getInfoAdv(){
			//alert("获取广告信息");
			window.location.href="queryAllAdv.do";
		}
		function advPageUp(){
			//alert("上一页");
			var nowPage = document.getElementById("nowAdvPage").value;
			//alert("当前页数"+nowPage);
			window.location.href="advPageUp.do?nowPage="+nowPage;
		}
		function advPageDown(){
			//alert("上一页");
			var nowPage = document.getElementById("nowAdvPage").value;
			//alert("当前页数"+nowPage);
			window.location.href="advPageDown.do?nowPage="+nowPage;
		}
		function deleteAdvOne(advId){
			//alert("删除一行广告"+advId);
			window.location.href="deleteAdvOne.do?id="+advId;
		}
		function markAdv(advId){
			//alert("选中这一行广告"+advId);
			window.location.href="markAdv.do?id="+advId;
		}
	</script>
  </head>
  
  <body onload="OnLoad()">
   	<div class="main_Div">
		<div class="head_Div">
			<div class="logo">
    			<h1><img src="images/logo.jpg"/></h1>
    			<h2>商城后台</h2>
    		</div>
    	</div>
    	<div class="body_Div">
    	
    		<div class="left_Div">
				<ul id="ulId">
					<li onclick="showGoods(1)" id="oneLi" class="oneLiClass"><span style="color:white;font-size:20px;">商品信息维护</span></li>	
					<li onclick="showGoods(2)" id="twoLi"><span style="color:white;font-size:20px;">商品类别维护</span></li>
					<li onclick="showGoods(3)" id="threeLi"><span style="color:white;font-size:20px;">商品信息修改</span></li>
					<li onclick="showGoods(4)" id="fourLi"><span style="color:white;font-size:20px;">广告位维护</span></li>
					<li onclick="showGoods(5)" id="fiveLi"><span style="color:white;font-size:20px;">商城订单查询</span></li>
				</ul>
			</div>
			<div class="right_Div" id="rDivId">
				<span style="font-size:40px;font-family:cursive;margin-left:300px;">商品添加</span>
				<form action="addGoods.do" class="gAdd" id="gAddId" method="post" enctype="multipart/form-data">
					<div class="gIdClass">
						<span>商品编号</span>
						<input type="text" name="gId" id="gnIdID"/>
					</div>
					<div class="gNameClass">
						<span>商品名字</span>
						<input type="text" name="gName" id="gNameID"/>	
					</div>
					<div class="gKindClass">
						商品种类<select name="gKind" id="gKindId">
						</select>
					</div>
					<div class="gNumberAndgPriceClass">
						<span>商品数量</span>
						<input type="text" name="gNumber" id="gNumberId"/>
						<span>商品单价</span>
						<input type="text" name="gPrice" id="gPriceId"/>
					</div>
					<div class = "gDiscountClass">
						<span>商品折扣</span>
						<input type="text" name="discount" id="gDiscount"/>
					</div>
					<div class="gBusinessClass">
						<span>商品厂家</span>
						<input type="text" name="gBusiness" id="gBusinessIId"/>
					</div>
					<div class="gImgClass">
						<span>上传图片</span>
						<input type="file" name="gImgFile" id="gImgId" class="gImgInput" onchange="upImg()"/>
					</div>
					<div class="ImgClass"><img src="" id="imgId"/></div>
					<div class="addGoods" id="addGoodsId">
    					<input id="subGood" type="submit" value="提交" style="background-color: #f40; border-radius:15px; margin-left:30px; font-size:14px;width:220px;height:40px;"/>
    					<input id="btnGood" type="button" value="更新" style="background-color: #f40; border-radius:15px; margin-left:30px; font-size:14px;width:220px;height:40px;display:none;" onclick="upadateOne()"/>
    				</div>
				</form>
    			
    			<form action="addGKind.do" class="updateKind" id="updateKindId">
    				<div class="addKindsClass">
    					<span>添加种类</span>
    					<input type="text" name="kName" id="addKindId" />
    					<input type="submit" value="添加" class="addKindClass"/>
    				</div>
    			</form>
    			
    			<form action="deleteGKind.do" class="deleteKind" id="deleteKindId">
    				<span>删除种类</span>
    				<select name="dKind" id="dKindId">
					</select>
					<input class="dKindClass" type="submit" value="删除"/>
    			</form>
    			
    			
    			<div id="upGoodId" class="upGoodClass">
    				
    				<table id="gTable">
    					<tr>
    						<td style="width:70px;">商品ID</td><td style="width:170px;">商品名字</td><td	style="width:90px;">商品种类</td><td	style="width:64px;">商品数量</td><td	style="width:64px;">商品单价</td><td style="width:130px;">商品厂家</td><td style="width:70px;">商品图片</td><td style="width:75px;">商品折扣</td><td style="width:115px;">商品评价</td><td style="width:80px;">商品操作</td>
    					</tr>
   
    					<c:forEach items="${gList}" var="good">
    						<tr>
    							<td><div  id="GoodsId">${good.gId}</div></td>
    							<td><div>${good.gName}</div></td>
    							<td><div>${good.gKind}</div></td>
    							<td><div>${good.gNumber}</div></td>
    							<td><div>${good.gPrice}</div></td>
    							<td><div>${good.gBusiness}</div></td>
    							<td><div style="width:75px;75px;"><img style="wditd:100%;height:100%;" src="images/${good.gImg}"/></div></td>
    							<td><div>${good.discount}</div></td>
    							<td><div>${good.descibe}</div></td>
 								<td><div><input type="button" style="width:40;height:30px;float:left" value="修改" onclick="queryOne(${good.gId})"> <input type="button" style="width:40;height:30px;float:left" value="删除" onclick="deleteOne(${good.gId})"> </div></td>
    						</tr>
    					</c:forEach>
    					<tr>
    						<td><input type="button" style="width:50px;height:30px;position:absolute;left:900px;" value="上一页" onclick="pageUp()"></td>
    						<td><input type="text" id="nowPage" style="width:50px;height:30px;position:absolute;left:970px;" value="${Page.currentPage}"></td>
							<td><input type="button" id="txtGood" style="width:50px;height:30px;position:absolute;left:1040px;" value="下一页" onclick="pageDown()"></td>    					
							<td><input type="text" id="goodone" style="display:none" value="${gListOne}"/></td>    					
    						
    					</tr>
    				</table>
    			</div>
    			<div id="mAdv" class="mAdvClass">
    				
    				<table id="tableMAdv" class="tableMAdvClass">
    					<tr>
    						<td style="height:50px;">主页广告</td>
    						<td style="">广告照片</td>
    						<td style="">广告操作</td>
    					</tr>
    					<c:forEach items="${aAList}" var="adv">
    						<tr>
    							<td><div id="markAdvDiv" style="width:50px;height:50px"><input id="markId" type="radio" name="Adv" style="width:18px;" onclick="markAdv(${adv.id})"/></div></td>
    							<td><div id="advImgDiv" style=" width: 780px;height: 120px;"><img src="images/${adv.path}"/></div></td>
    							<td><div id="deleteAdvDiv"><button onclick="deleteAdvOne(${adv.id})">删除</button></div></td>
    							<td><input type="text" style="display:none" id="avdInfo" value="${adv.mark}"/></td>
    						</tr>
    					</c:forEach>
    				</table>
    				<div style=";width:700px;height:120px;">
    					<input type="file" onchange="setInfoAdv()" id="setImgPath" style="background:wheat;position:absolute;z-index:10;"/>
    					<img style="width:690px;height:140px;position:absolute;z-index:8;" id="addAdvId">
    				</div>
    				<div style="position:absolute;left:115px;top:725px;">
    					<input type="button" style="width:50px;height:30px;position:absolute;left:900px;" value="上一页" onclick="advPageUp()">
    					<input type="text" id="nowAdvPage" style="width:50px;height:30px;position:absolute;left:970px;" value="${ap.currentPage}">
						<input type="button" id="" style="width:50px;height:30px;position:absolute;left:1040px;" value="下一页" onclick="advPageDown()"> 					
							
    				</div>
    			</div>
    			<div id="buyGood" class="buyGoodClass">
    				<table style="margin-left: 100px;margin-top:20px;">
    					<tr>
    						<td>订单Id</td><td>商品编号</td><td>购买数量</td><td>商品金额</td><td>购买者</td><td>商品状态</td>
    					</tr>
    					<c:forEach items="${gcList}" var="gcList">
    						<tr style="height:50px">
    							<td id="gcListId">${gcList.id}</td>
    							<td>${gcList.goodId}</td>
    							<td>${gcList.number}</td>
    							<td>${gcList.money}</td>
    							<td>${gcList.userName}</td>
    							<td id="markid">
    								<c:if test="${gcList.mark>0}">
    									已付款
    								</c:if>
    								<c:if test="${gcList.mark<1}">
    									未付款
    								</c:if>
    							</td>
    						</tr>
    					</c:forEach>
    				</table>
    			</div>
			</div>
    	</div>
    </div>
  </body>
</html>
