<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.*,book.bookDTO"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	input{width:420px;font-size:20px;}
	body{
    text-align: -webkit-center;
	}
</style>
</head>
<body>

<%bookDTO book = (bookDTO)request.getAttribute("book");
if(book.getBCD()!=null){ 
System.out.print(request.getAttribute("book"));%>
<table border="1">
		<tr><td>BCD</td><td>FCD</td><td>TITLE</td><td>WRITER</td><td>PUBLISH</td><td>PRICE</td><td>BCNT</td></tr>
	<%
		out.print("<tr><td>"+book.getBCD()+"</td>");
		out.print("<td>"+book.getFCD()+"</td>");
		out.print("<td><a href='updateselect?title=" + book.getTITLE() + "'>"+book.getTITLE()+"</a></td>");
		out.print("<td>"+book.getWRITER()+"</td>");
		out.print("<td>"+book.getPUBLISH()+"</td>");
		out.print("<td>"+book.getPRICE()+"</td>");
		out.print("<td>"+book.getBCNT()+"</td></tr>");
	%>
	</table>
	<%}else{%>
		<script type="text/javascript">
			alert("해당 도서정보가 존재하지 않습니다");
			location.href='booksearch.jsp';
		</script>
	<%
	}		
	%>

	<br>
	<input type="button" value="검색 화면으로 돌아가기" onclick="location.href='booksearch.jsp'">
</body>
</html>