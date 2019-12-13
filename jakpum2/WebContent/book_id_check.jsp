<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="book.bookDTO"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%if(request.getAttribute("id")!=null){
	%>
			<script>
				opener.form.id.value = "${id}";
				window.self.close();
			</script>
	<%
	}
	else{
		if(request.getAttribute("result")!=null){
			%>
			
			<script>
				alert("해당id가 존재하지 않습니다");
			</script>
	<%
		}
	}
	%>
	<form action="book_id_check">
		<input type="text" name="id">
		<input type="submit" value="조회">
	</form>
</body>
</html>