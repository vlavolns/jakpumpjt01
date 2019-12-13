<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="book.bookDTO" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>도서 조회 페이지</title>
<style>
	html{
    text-align: -webkit-center;
	}
	input,select{font-size:15px;}
</style>
</head>
<body>
<form action="booksearch" method="post">
	<table border="1">
	
	<tr><td>
		<select name="type">
			<option>책번호</option>
			<option>책이름</option>
		</select>
	</td>
	</tr>
	<tr>
	<td>
		<input type="text" name="value">
		<input type="submit" value="검색">
		<input type="button" value="전체 목록 검색" onclick="location.href='selectall'">

	</td></tr>
	</table>
</form>
</body>
</html>