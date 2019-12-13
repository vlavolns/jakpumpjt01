<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import ="java.util.*,board.BorderDTO"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	html{
    text-align: -webkit-center;
	}
</style>
</head>
<body>
	<h4>게시판 목록 보기</h4>
	<input type="button" onclick="location.href='input.jsp'" value="글쓰기" style=" width: 100px; height: 50px; margin-left: 580px;">
	<table border="1">
		<tr>
		<td width=40>순번${param.rowcnt}</td>
		<td width=300>제목</td>
		<td width=80>작성자</td>
		<td width=90>작성일자</td>
		<td width=90>수정일자</td>
		<td width=40>조회수</td>
		</tr>
		<%
			List borderlist = (List)request.getAttribute("list");
			
		for(int i=0;i<borderlist.size();i++){
			BorderDTO border = (BorderDTO)borderlist.get(i);
			out.print("<tr><td>"+border.getBno()+"</td>");
			out.print("<td><a href = 'board_read?SEQ_NO="+border.getBno()+"'>"+border.getTitle()+"</a></td>");
			out.print("<td>"+border.getWriter()+"</td>");
			out.print("<td>"+border.getRegdate()+"</td>");
			out.print("<td>"+border.getUpdatedate()+"</td>");
			out.print("<td>"+border.getReadcnt()+"</td></tr>");
		}
		
		%>
	</table>
	<table>
		<tr>
		<td width="600" align="center">
		<%
			int rowcnt = (int)request.getAttribute("rowcnt");
			for(int pcnt=1;pcnt<=rowcnt;pcnt++){%>
			<a href = 'board_list?SEQ_NO=<%=pcnt %>'>[<%=pcnt %>]</a>
		<%	}	%>
		</td>
		</tr>
	</table>
</body>
</html>