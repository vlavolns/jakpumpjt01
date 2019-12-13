<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%String result = (String) request.getAttribute("result");
	if(result.equals("true")){%>
	아이디: ${user.getId()}<br>
	이름: ${user.getName()}님 환영합니다
	<%}else{%>
		로그인 정보가 정확하지 않습니다.
	<% 	}%>
</body>
</html>