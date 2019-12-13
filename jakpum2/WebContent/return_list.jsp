<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import = "java.util.*,book.bookDTO"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	input{width:420px;font-size:20px;}
	body{
    text-align: -webkit-center;
	}
</style>
</head>
<body>
<table border="1">
		<tr><td>id</td><td>name</td><td>TITLE</td><td>대여일</td><td>반납일</td></tr>
		<%
			List list = (List)request.getAttribute("list");
			for(int i =0;i<list.size();i++){
				bookDTO book = (bookDTO)list.get(i);
				out.print("<tr><td>"+book.getId()+"</td>");
				out.print("<td>"+book.getName()+"</td>");
				out.print("<td>"+book.getTITLE()+"</td>");
				out.print("<td>"+book.getRentdate()+"</td>");
				out.print("<td>"+book.getReturndate()+"</td></tr>");
			}
		%>
	</table>
	<br>
	<input type="button" value="반납 화면으로 돌아가기" onclick="location.href='book_return.jsp'">
</body>
</html>