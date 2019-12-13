<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.*,book.bookDTO"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	input{width:200px;font-size:20px;}
	body{
    text-align: -webkit-center;
	}
</style>
<script>
	<%
		if(request.getAttribute("updatedbook")!=null){
			%>
				alert("정보수정이 완료되었습니다");
				top.location.href='mainpage.jsp'
			<%
		}
		else{
			if(request.getAttribute("result")!=null){
				%>
					alert("정보수정에 실패하였습니다");
				<%
			}
		}
		if(request.getAttribute("delete")!=null){
			%>
			alert("정보삭제가 완료되었습니다");
			top.location.href='mainpage.jsp'
		<%
		}
		else{
			if(request.getAttribute("delresult")!=null){
				%>
				alert("정보삭제에 실패하였습니다");
			<%
			}
		}
	%>
</script>
</head>
<body>
	<form action="booklist_update">
	<table>
		<tr><td>BCD</td><td><input type="text" name="bcd" readonly value="${book.getBCD()}"></td></tr>
		<tr><td>FCD</td><td><input type="text" name="fcd" value="${book.getFCD()}"></td></tr>
		<tr><td>title</td><td><input type="text" name="title" value="${book.getTITLE()}"></td></tr>
		<tr><td>writer</td><td><input type="text" name="writer" value="${book.getWRITER()}"></td></tr>
		<tr><td>publish</td><td><input type="text" name="publish" value="${book.getPUBLISH()}"></td></tr>
		<tr><td>price</td><td><input type="text" name="price" value="${book.getPRICE()}"></td></tr>
		<tr><td>bcnt</td><td><input type="text" name="bcnt" value="${book.getBCNT()}"></td></tr>
	</table>
		<input type="submit" value="정보수정" style="width: 100px;font-size: 17px;">
		<input type="reset" value="기존 정보로 초기화" style="width: 160px;font-size: 17px;">
		<input type="button" value="삭제" onclick="location.href='book_delete?bcd=${book.getBCD()}'">
	</form>
</body>
</html>