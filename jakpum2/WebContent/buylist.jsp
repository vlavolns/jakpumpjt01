<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,book.bookDTO"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	body{text-align:-webkit-center;font-size:20px;}
	input[type=button]{width:610px;font-size:20px;}
</style>
</head>
<body>
	<%
		if(request.getAttribute("list")!=null){
			List list = (List)request.getAttribute("list");
			%>
			<table border="1">
				<tr><td>거래번호</td><td>도서번호</td><td>ID</td><td>가격</td><td>갯수</td><td>총가격</td><td>결제종류</td><td>구입한날짜</td></tr>
			<%
			for(int i=0;i<list.size();i++){
				bookDTO book = (bookDTO)list.get(i);
				out.println("<tr><td>"+book.getTradeno()+"</td>");
				out.println("<td>"+book.getBCD()+"</td>");
				out.println("<td>"+book.getId()+"</td>");
				out.println("<td>"+book.getPRICE()+"</td>");
				out.println("<td>"+book.getBCNT()+"</td>");
				out.println("<td>"+book.getSumprice()+"</td>");
				if(book.getTg().equals("1")){
					out.println("<td>현금</td>");
				}
				else if(book.getTg().equals("2")){
					out.println("<td>카드</td>");
				}
				out.println("<td>"+book.getBuydate()+"</td></tr>");
			}
			%>
			</table>
			<%
			
		};
	%>
	<input type="button" value="이전화면으로 돌아가기" onclick="location.href='buy.jsp'">
</body>
</html>