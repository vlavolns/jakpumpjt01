<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="JoinItemServlet" method="post" name="idcheckform">
		아이디: <input type="text" name="cid">
			<input type="submit" value="중복 확인">
	</form>
	<%
		
		if(request.getAttribute("result")!=null){
			boolean result =(boolean)request.getAttribute("result");
			if(result){ %>
			<script>
			alert('이미사용중인 아이디입니다');
			history.go(-1);
			</script>
	<% }else{ %>
		<script type="text/javascript">
			alert('사용 가능한 아이디 입니다');
			opener.document.fm.id.value = "${cid}";
			opener.fm.name.focus();
			window.self.close();
		</script>
		<% }
		}
	%>
</body>
</html>