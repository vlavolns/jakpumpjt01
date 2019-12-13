<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	body{
    text-align: -webkit-center;
	}
</style>
</head>
<body>
	<h4>게시글 읽기</h4>
	[제목] ${border.title}
	[조회수] ${border.readcnt}<br>
	[작성자] ${border.writer}
	[작성일시]${border.regdate}<br>
	-----------------------------------------------------<br>
	<pre>${border.content}</pre><br><br>
	<a href='board_update_input?bno=${border.bno}'>[수정]</a>
	<a href='board_delete?bno=${border.bno}'>[삭제]</a>
	<a href="board_list">[목록으로]</a>
</body>
</html>