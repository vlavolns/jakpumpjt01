<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src = "http://code.jquery.com/jquery-1.10.2.js"></script>
<script>
function oncheck(){
	if(!fmL.yak.checked){
		alert("약관에 동의하세요");
		fmL.yak.focus();
		return false;
	};
	if(!fmL.geain.checked){
		alert("개인정보에 동의하세요!");
		fmL.geain.focus();
		return false;
	};
	return true;
};
function allCheck(){
	if(fmL.all.checked){
		fmL.yak.checked=true;
		fmL.geain.checked=true;
	}
	else{
		fmL.yak.checked=false;
		fmL.geain.checked=false;
	}
	if(yak.checked&&geain.checked){
		$("#all").prop("checked",true);
	}
	else{
		$("#all").prop("checked",false);
	}
}
$(document).ready(function(){
	
	$("input").on("change",function(){
		if(yak.checked&&geain.checked){
			$("#all").prop("checked",true);
		}
		else
			$("#all").prop("checked",false);
		});
});
</script>
<style type="text/css">
table{margin:auto;}
	*{margin:0; padding:0;}
	form{height:59.1%;padding-left:40%;}
body,html{width:100%; height:100%;margin:0; padding:0;}
.header{text-align:center; font-weight:bold; font-size:30px;line-height:100px;height:10%;text-decoration:none;}
.navigation{width:100%; 
			background:-webkit-gradient(linear, 90% 50%, 0% 100%, from(#2EA310), to(#0CC9C9)); 
			color:white; height:6%;position:relative; margin:30px 0px;}
.section{
		 width:100%; 
		 height:69%; 
		 display:flex;
		 flex:1;
		 }
 .section nav{height:100%; width:85%;}
.section span{height:100%; width:15%; margin:0;padding:0;}
li{text-align:center;display:inline-block; height:50px; font-size:15px; width:120px;line-height:60px;
margin:0; padding:0;}

a:link{text-decoration:none;color:black;}
li:nth-child(5){float:right;}
li:nth-child(6){float:right;}

li>a{text-decoration:none;
color:white;font-size:17px;}
.footer{background-color:#86E57F; color:#5D5D5D; text-align:center; height:8.8%;font-size:18px;}

.sub{display:none;position:absolute; color:black;background-color:#5D5D5D;width:100px; }
.as:hover .sub{display:block;}
.right{float:right;}
h1{color:rgba(60,125,110,1);} 
</style>
</head>
<body>
<div class="header"><a href=mainpage.jsp><h1>도서관리 시스템</h1></a></div>
<div class="navigation">
		<ul>
		<li><a href='SlideM.html'>Home</a></li>
		<span class="right">
		<ul>
		<%
		String login = (String)request.getAttribute("login");
		
		if(login!=null){
		%>
		<li><a target="_top">${user.getName()}님환영합니다</a></li>
		<li><a target="_top">로그아웃</a></li>
		<%}else{ %>
		<li><a href='agree.jsp' target="_top" >회원가입</a></li>
		<li><a href='login.jsp' target="_top" >로그인</a></li>
		<%} %>
		</ul>
		</span>
		</ul>
</div>
<div class="section">
<form action="meminput.jsp" name="fmL" onsubmit="return oncheck()" method="post">
	   		
	   		<input type="checkbox" value="전체동의" id="all" name="all" onclick="allCheck()"/>
	   		<label for="all">전체동의</label><br/>
	   		<textarea rows="10" cols="50" readonly>약관동의 dd
1.본회사의...입니다</textarea><br/>
	   		<input type="checkbox" value="약관동의" id="yak"name="yak"/>
	   		<label for="yak">약관동의</label><br/>
	  		<textarea rows="10" cols="50" readonly>개인정보 
1.개인정보는 1년간 보관되며 상업적인 용도로 이용이...합니다</textarea><br/>
	   		<input type="checkbox" value="개인정보동의" id="geain" name="geain"/>
	   		<label for="geain">개인정보동의</label><br/>
	   		<input type="submit" value="가입">
	   		<input type="reset" value="취소">
	   		<input type="button" value="첫 화면으로 돌아가기" onclick="location.href='mainpage.jsp'">
	   </form>
	   </div>
	<div class="footer">
	  	<p>도서 관리 위원회 </p>
		<p> 대표자:장석우, 전화번호:010-555-5555</p>
		<p>회사주소:대한민국 대구 광역시 달서구 ㅇㅇ동ㅇㅇㅇㅇ번지</p>
	</div>
</body>
</html>