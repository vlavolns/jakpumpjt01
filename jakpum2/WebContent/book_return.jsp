<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
	<% 
		if(request.getAttribute("id")!=null){
	%>
			alert("${id} 님이 빌려가신 ${title}이 정상적으로 반납되었습니다");
			
		<%
	}else{
		if(request.getAttribute("result")!=null){
		%>
			alert("요청하신 id와 책제목에 해당하는 대여정보가 없습니다");
		<%
	}}
	%>
</script>

<style>

    form{text-align: -webkit-center;}

</style>
</head>
<body>
	<form action="book_return">
		<h1>도서반납</h1>
		<table>
		<tr>
			<td>
				id:
			</td>
			<td>
				<input type="text" name="id">
			</td>
		</tr>
		<tr>
			<td>
				title:
			</td>
			<td>
				<input type="text" name="title">
			</td>
		</tr>
		<tr>
			<td>
				<input type="submit" value="반납">
			</td>
			<td>
				<input type="button" value="취소" onclick="top.location.href='mainpage.jsp'">
				<input type="button" value="반납목록조회하기" onclick="location.href='returnlist'">
			</td>
		</tr>
		</table>
	</form>
</body>
</html>