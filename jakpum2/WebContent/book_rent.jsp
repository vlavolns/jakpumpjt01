<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="book.bookDTO"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<script type="text/javascript">
		function check(){
			window.open("book_id_check.jsp","","width=500px height=400px");
		}
		 function check2(){
			window.open("book_title_check.jsp","","width=500px height=400px");
		} 
		function blankcheck(){
			if(!form.id.value){
				alert("id를 입력해주세요");
				form.id.focus();
				return false;
			}
			if(!form.title.value){
				alert("책이름을 입력해주세요");
				form.title.focus();
				return false;
			}
			return true;
		}
	</script>
	
	<style>
	 form{text-align: -webkit-center;}
	</style>
</head>
<%if(request.getAttribute("title")!=null){
	%>
		<script>
			alert("'"+"${name}"+"'"+ "  님에게 책  "+ "'" +"${title}"+"'"+"  (을)를 대여하였습니다");
		</script>
	<%
}
%>
<body>
	<form action="rentinsert" name = "form" onsubmit="return blankcheck()">
		<h1>책빌리기</h1>
		<table>
			<tr>
				<td>id:
				</td>
				<td>
					<input type='text' name='id' readonly value=''>
				</td>
				<td>
					<input type="button" onclick="check()" value="조회하기">
				</td>
			</tr>
			<tr>
				<td>title:
				</td>
				<td>
					<input type="text" name="title" readonly value=''>
					<input type="hidden" name="price" value="">
				</td>
				<td>
					 <input type="button" onclick="check2()" value="조회하기">
				</td>
			</tr>
			<tr>
				<td>
				</td>
				
				<td colspan="2">
					<input type="submit" value="대여">
					<input type="button" value="대여목록" onclick="location.href='rentlist'">
					<input type="button" value="취소" onclick="top.location.href='mainpage.jsp'">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>