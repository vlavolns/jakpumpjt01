<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%if(request.getAttribute("title")!=null){
	%>
			<script>
				opener.form.title.value = "${title}";
				opener.form.price.value = "${price}";
				window.self.close();
			</script>
	<%
	}
	else{
		if(request.getAttribute("result")!=null){
			%>
			
			<script>
				alert("해당 책이 등록되어 있지 않습니다");
			</script>
	<%
		}
	}
	%>
	<form action="book_title_check">
		<input type="text" name="title">
		<input type="submit" value="조회">
	</form>
</body>
</html>