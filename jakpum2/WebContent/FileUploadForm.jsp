<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.io.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>파일 올리기</title>
	
</head>
<body>
	<form action = "FileUploadServlet" method = "post" enctype = "multipart/form-data">
		<br/>
		<h3>파일 올리기</h3>
		<fieldset>
			<legend>파일 정보</legend>
			<table>
				<tr>
					<td><label>파일</label></td>
					<td><input type = "file" name = "fname" size = "40"/></td>
				</tr>
				<tr>
					<td colspan = "2" height = "50px">
						
							<input type = "submit" value = "전송"/> 
							<input type = "reset" value = "취소"/>
						
					</td>
				</tr>
			</table>
		</fieldset>
	</form>
</body>
</html>