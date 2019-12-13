<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 입력 양식</title>
<style>

	table{margin:auto;}
	form{height:59.1%;}
	*{margin:0; padding:0;}
body,html{width:100%; height:100%;margin:0; padding:0;}
.header{text-align:center; font-weight:bold; font-size:30px;line-height:100px;height:10%;text-decoration:none;}
.navigation{width:100%; background-color:black; color:white; height:5%;position:relative;}
.section{
		 width:100%;
		 height:75%; 
		 display:flex;
		 flex:1;}
 .section nav{height:100%; width:85%;}
.section span{height:100%; width:15%; margin:0;padding:0;}
li{text-align:center;display:inline-block; height:50px; font-size:15px; width:100px;line-height:50px;
margin:0; padding:0;}

a:link{text-decoration:none;color:black;}
li:nth-child(5){float:right;}
li:nth-child(6){float:right;}

li>a{text-decoration:none;
color:white;}
.footer{background-color:#D5D5D5; color:#5D5D5D;  font-size:40px; text-align:center; height:10%; line-height:80px;}
#fm{
		width:100%;
		height:100%;
		frameborder:0;}
img{width:100%;height:29.5%;}
figcaption{text-align:center; color:black;}
.sub{display:none;position:absolute; color:black;background-color:#5D5D5D;width:100px; }
.as:hover .sub{display:block;}
.right{float:right;}
h1{color:black;} 
</style>

<script>
	function oncheck(){
		if(!fm.id.value){
			alert("id를 입력하세요");
			fm.id.focus();
			return false;
		}
		if(!fm.name.value){
			alert("이름을 입력하세요");
			fm.name.focus();
			return false;
		}
		if(!fm.name.value.match(/^\D*$/img)) {
			alert("이름은 한글,영문자만 가능합니다");
			fm.name.focus();
			return false;
		}
		if(!fm.pass.value){
			alert("암호를 입력하세요");
			fm.pass.focus();
			return false;
		}
		if(!fm.mid.value){
			alert("전화번호 중간자리를 입력하세요");
			fm.mid.focus();
			return false;
		}
		if(!fm.mid.value.match('^[0-9]+$')) {
			alert("전화번호는 숫자만 입력하세요.");
			fm.mid.focus();
			return false;
		}
		if(!fm.last.value){
			alert("전화번호 뒷자리를 입력하세요");
			fm.last.focus();
			return false;
		}
		if(!fm.last.value.match('^[0-9]+$')) {
			alert("전화번호는 숫자만 입력하세요.");
			fm.last.focus();
			return false;
		}
		if(!(fm.gender[0].checked||fm.gender[1].checked)){
			alert("성별을 선택하세요");
			return false;
		}
		if(!(fm.hobby[0].checked||fm.hobby[1].checked||fm.hobby[2].checked||fm.hobby[3].checked)){
			alert("취미를 한가지이상 선택하세요");
			return false;
		}
		if(!fm.intro.value){
			alert("자기소개글을 1자이상 입력하세요");
			fm.intro.focus();
			return false;
		}
		return true;
	}
	function id_search(){
		theURL = "id.jsp";
		window.open(theURL,"",'width=800,height=800');
	}
	
</script>
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
	<nav>
	<iframe id='fmM' name='view' frameborder="0">
    </iframe>
    </nav>
	<form action="joinProcess" name="fm" onsubmit="return oncheck()" method="post">
	<table border="1">
	<tr><td colspan="2"><h3 align="center" >회원정보 입력 양식</h3></td></tr>
		<tr>
			<td width="200">♣ id</td>
			<td width="500"><input type="text" name="id" id="id" readonly/>
			<input type="button" onclick="id_search()" value="중복확인"></td>
		</tr>
		<tr>
			<td width="200">♣ 이름</td>
			<td width="500"><input type="text" name="name" id="name"/></td>
		</tr>
		<tr>
			<td>▽ 암호</td>
			<td><input type="password" name="pass" id="pass"/></td>
		</tr>
		<tr>
			<td>☎ 핸드폰</td>
			<td>
				<select name="first">
				<option>010</option>
				<option>011</option>
				<option>018</option>
				<option>02</option>
				</select>-
				<input type="tel" maxlength="4" size="4" name="mid" id="mid"/>-
				<input type="tel" maxlength="4" size="4" name="last" id="last"/>
			</td>
		</tr>
		<tr>
			<td>㉠ 직업</td>
			<td>
				<select name="job">
					<option>학생</option>
					<option>회사원</option>
					<option>자영업</option>
					<option>기타</option>
				</select>
			</td>
		</tr>
		<tr>
			<td>ⓐ 성별</td>
			<td>
			<input name="gender" type="radio" value="남"/>남자
			<input name="gender" type="radio" value="여" />여자
			</td>
		</tr>
		<tr>
			<td>ⓑ 취미</td>
			<td>
			<input name="hobby" type="checkbox" value="공부" />공부
			<input name="hobby" type="checkbox" value="게임" />게임
			<input name="hobby" type="checkbox" value="낚시" />낚시
			<input name="hobby" type="checkbox" value="음악" />음악
			</td>
		</tr>
		<tr>
			<td>자기 소개하는 글</td>
			<td><textarea rows="10" cols="70" name="intro" placeholder="자기를 소개하는 글을 쓰세요" id="intro"></textarea></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="submit" value="등록하기"/>
				<input type="reset" value="취소하기"/>
				<input type="button" value="첫 화면으로 돌아가기" onclick="location.href='mainpage.jsp'">
			</td>
			
		</tr>
	</table>
	</form>
	<div class="footer">도서 관리 위원회</div>
</body>
</html>