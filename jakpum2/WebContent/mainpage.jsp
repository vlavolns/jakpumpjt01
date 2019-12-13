<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "templet.joinDTO" %>
<%request.setCharacterEncoding("utf-8");
response.setContentType("text/html;charset=utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
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

a:link{text-decoration:none;color:white;}
li:nth-child(6){float:right;}
li:nth-child(7){float:right;}

li>a{text-decoration:none;
color:white;}
.footer{background-color:#D5D5D5; color:#5D5D5D; text-align:center; height:9.8%;}
img{width:100%;height:29.5%;}
figcaption{text-align:center; color:black;}
.sub{display:none;position:absolute; color:black;background-color:#5D5D5D;width:100px; }
.as:hover .sub{display:block;}
.right{float:right;}
h1{color:black;} 
iframe{width:100%;height:100%;}
.hwan{width:200px;}
</style>
</head>
<%
		String deleteresult = (String)request.getAttribute("deleteresult");
		if(deleteresult!=null){
			if(deleteresult.equals("true")){
	%>
		<script>
			alert("삭제되었습니다");
		</script>
	<%
			}
			else if(deleteresult.equals("false")){
	%>
				<script>
					alert("삭제에 실패하였습니다");
				</script>
	<%
			}
		RequestDispatcher dis = request.getRequestDispatcher("logout.jsp");
		dis.forward(request, response);
		}
	%>
<body>
	<div class="header"><a href=mainpage.jsp><h1>도서관리 시스템</h1></a></div>
	<div class="navigation">
		<ul>
		<li><a href='SlideM.html'>Home</a></li>
		<li><a href='board_list' target="view">게시판</a></li>
		<li><a href='bookinsert.jsp' target="view">도서정보등록</a></li>
		<li><a href='booksearch.jsp' target="view">도서관리</a></li>
		<li class="as"><a href='#'>대여/구입</a>
			<ul class="sub">
				<li><a href='book_rent.jsp' target='view'>대여</a></li>
				<li><a href='book_return.jsp' target='view'>반납</a></li>
				<li><a href='buy.jsp' target="view">구입</a></li>
			</ul>
		</li>
		<span class="right">
		<ul>
		<%
		
		/*String login = (String)session.getAttribute("login");
		String logout = (String)session.getAttribute("logout");*/
		if(session.getAttribute("user") != null){
			joinDTO user = (joinDTO)session.getAttribute("user"); 
		%>
		<li class="hwan"><a target="_top"><%=user.getName() %>님환영합니다</a></li>
		<li><a href="logout.jsp" target="_top">로그아웃</a></li>
		<li><a href="mypage?name=${user.getId()}" target="view">마이페이지</a></li>
		<%
		
		} else {
		%>
		<li><a href='agree.jsp' target="_top">회원가입</a></li>
		<li><a href='login.jsp' target="_top" >로그인</a></li>
		<%} %>
		
		</ul>
		</ul>
		</span>
		</div>
	<div class="section">
	<nav>
	<iframe id='fm' name='view' frameborder="0">
	</iframe>
    </nav>
	<span>
	<a href="9번의일.html" target="view"><figcaption>9번의일</figcaption><img src="http://placehold.it/210*214"><!-- "9번의일.JPG" --></a>
	<a href="잔혹한어머니의날.html" target="view"><figcaption>잔혹한어머니의날</figcaption><img src="http://placehold.it/210*214"><!-- "잔혹한어머니의날.JPG" --></a>
	<a href="숨그네.html" target="view"><figcaption>숨그네</figcaption><img src="http://placehold.it/210*214"><!-- "숨그네.JPG" --></a>
	</span>
	</div>
	<div class="footer">
		<p>도서 관리 위원회</p>
		<p>대표자:장석우, 전화번호:010-555-5555</p>
		<p>회사주소:대한민국 대구 광역시 달서구 ㅇㅇ동ㅇㅇㅇㅇ번지</p>
	</div>
</body>
</html>