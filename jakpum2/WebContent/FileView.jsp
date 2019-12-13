<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>File View</title>
</head>
<body>
	<% String file = request.getParameter("file"); %>
	<img src = "view?file=<%= file %>"/>
	<a href = "view?file=<%= file %>">다운</a>
</body>
</html>