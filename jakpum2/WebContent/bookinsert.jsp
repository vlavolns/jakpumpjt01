<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	h1{text-align:center;}
	form{text-align: -webkit-center;}
</style>
</head>
<body>
<%if(request.getAttribute("in_rs")!=null){
			%>
				<script>
					alert("책 정보 등록에 성공하였습니다");
					top.location.href="mainpage.jsp";
				</script>
			<%
		}else{
			if(request.getAttribute("in_fal")!=null){
			%>
				<script>
					alert("책 정보 등록에 실패 하였습니다 도서코드를 확인해 주세요");
					top.location.href="mainpage.jsp";
				</script>
			<%
		}}
		%>
	<h1>도서정보등록</h1>
	<form action="book_insert">
		<table>
			<tr><td>도서코드</td><td><input type="text" name="bcd"></td></tr>
			<tr><td>도서분류</td><td><select name="fcd"><option>1</option><option>2</option><option>3</option><option>4</option></select></td></tr>
			<tr><td>도서제목</td><td><input type="text" name="title"></td></tr>
			<tr><td>글쓴이</td><td><input type="text" name="writer"></td></tr>
			<tr><td>출판사</td><td><input type="text" name="publish"></td></tr>
			<tr><td>가격</td><td><input type="text" name="price"></td></tr>
			<tr><td>갯수</td><td><input type="text" name="bcnt"></td></tr>
			<tr><td></td><td><input type="submit" value="저장"><input type="reset" value="취소"></td></tr>
		</table>
	</form>
</body>
</html>