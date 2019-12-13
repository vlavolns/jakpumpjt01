<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function login(){
		if(!fm.id.value){
			alert("아이디를 입력해주세요");
			fm.id.focus();
			return false;
		}
		if(!fm.pass.value){
			alert("비밀번호를를 입력해주세요");
			fm.pass.focus();
			return false;
		}
		return true;
	};
</script>
<style>
	*{margin:0; padding:0;}
	body,html{width:100%; height:100%;margin:0; padding:0;}
	table{text-align:center; margin:auto;}
	.header{text-align:center; font-weight:bold; font-size:30px;line-height:100px;height:10%;}
	.footer{background-color:#D5D5D5; color:#5D5D5D;  font-size:40px; text-align:center; height:10%; line-height:80px;}
	form{height:59.1%;}
	h1{color:black;}
	a{text-decoration:none;}
	.right{float:right;}
	.navigation{width:100%; background-color:black; color:white; height:5%;position:relative;}

li{text-align:center;display:inline-block; height:50px; font-size:15px; line-height:50px;margin:0px 30px; padding:0;}
li>a{text-decoration:none;color:white;}
</style>
</head>
<body>
<%String result = (String)request.getAttribute("result");
	if(request.getAttribute("result")!=null&&result.equals("false")){
		%>
		<script>
			alert("회원정보가 일치하지않습니다");
		</script>
	<%
}
	%>
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
		<nav>
	<iframe id='fmM' name='view' frameborder="0">
    </iframe>
    </nav>
<form action="loginProcess" onsubmit="return login()" name="fm" method="post">
	<table>
		<tr><td><label for="id">아이디</label></td>
	   	<td><input type="text" name="id" id="id"/></td>
	   	</tr>
	   	<tr><td><label for="pass">비밀번호</label></td>
	   	<td><input type="password" name="pass" id="pass"/></td></tr>
	   	<tr><td></td><td></td></tr>
	   	<tr><td colspan="2"><input type="submit" value="로그인"/>
		<a href="agree.jsp"><input type="button" value="회원가입"></a></td></tr>
	</table>
	</form>
	<div class="footer">도서 관리 위원회</div>
</body>
</html>