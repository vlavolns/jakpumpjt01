<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
	function check(){
		if(!f.writer.value){
			alert("작성자를 입력해주세요")
			f.writer.focus();
			return false;
		}
		if(!f.title.value){
			alert("제목을 입력해주세요")
			f.title.focus();
			return false;
		}
		if(!f.content.value){
			alert("내용을 입력해주세요")
			f.content.focus();
			return false;
		}
		return true;
	}
</script>
</head>
<body>
	<form action="board_save" method="post" name="f" onsubmit="return check()">
		작성자<input type="text" name="writer"><br>
		제&nbsp;&nbsp;&nbsp;목<input type="text" name="title" size="60" maxlength="60"><br>
		내&nbsp;&nbsp;&nbsp;용<textarea rows="10" cols="65" name="content" maxlength="2000"></textarea><br>
		<a href = 'board_list'><input type="button" value="목록으로"></a>
		<input type="submit" value="전송">
	</form>
</body>
</html>