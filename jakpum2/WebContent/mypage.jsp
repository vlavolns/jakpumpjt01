<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="templet.joinDTO" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>my page</title>
<script>
function oncheck(){
	if(!fmM.name.value){
		alert("이름을 입력하세요"); 
		fmM.name.focus();
		return false;
	}
	if(!fmM.name.value.match(/^\D*$/)) {
		alert("이름은 한글,영문자만 가능합니다");
		fmM.name.focus();
		return false;
	}
	if(!fmM.password.value){
		alert("암호를 입력하세요");
		fmM.pass.focus();
		return false;
	}
	if(!fmM.tel.value){
		alert("전화번호를 입력하세요");
		fmM.tel.focus();
		return false;
	}
	if(!fmM.tel.value.match(/^[0-9]{3}-[0-9]{3,4}-[0-9]{4}$/)) {
		alert("전화번호를 형식에 맞게 입력하세요.");
		fmM.tel.focus();
		return false;
	}
	if(!(fmM.gender[0].checked||fmM.gender[1].checked)){
		alert("성별을 선택하세요");
		return false;
	}
	if(!(fmM.hobby[0].checked||fmM.hobby[1].checked||fmM.hobby[2].checked||fmM.hobby[3].checked)){
		alert("취미를 한가지이상 선택하세요");
		return false;
	}
	if(!fmM.intro.value){
		alert("자기소개글을 1자이상 입력하세요");
		fmM.intro.focus();
		return false;
	}
	return true;
}
</script>
<style>

    html{text-align: -webkit-center;}

</style>
</head>
<body>
<form action="update" name="fmM" onsubmit="return oncheck()">
	<table>
	<tr><td colspan="2"><h3>개인정보수정</h3></td></tr>
	<%
		joinDTO user = (joinDTO)request.getAttribute("user");
		out.println("<tr><td>id</td>");
		out.println("<td><input type='text' readonly name='id' value='"+user.getId()+"'></td></tr>");
		out.println("<tr><td>이름</td>");
		out.println("<td><input type='text' name='name' value='"+user.getName()+"'></td></tr>");
		out.println("<tr><td>비밀번호</td>");
		out.println("<td><input type='text' name='password' value='"+user.getPassword()+"'></td></tr>");
		out.println("<tr><td>전화번호</td>");
		out.println("<td><input type='text' name='tel' value='"+user.getTel()+"'>(예)010-555-5555</td></tr>");
	%>
		<tr>
			<td>㉠ 직업</td>
			<td>
				<select name="job">
					<option>학생</option>
					<option>회사원</option>
					<option>자영업</option>
					<option>기타</option>
				</select>
			</td>
		</tr>
		<tr>
			<td>ⓐ 성별</td>
			<td>
			<input name="gender" type="radio" value="남"/>남자
			<input name="gender" type="radio" value="여" />여자
			</td>
		</tr>
		<tr>
			<td>ⓑ 취미</td>
			<td>
			<input name="hobby" type="checkbox" value="공부" />공부
			<input name="hobby" type="checkbox" value="게임" />게임
			<input name="hobby" type="checkbox" value="낚시" />낚시
			<input name="hobby" type="checkbox" value="음악" />음악
			</td>
		</tr>
		<%
			out.println("<tr><td>자기소개글</td>");
			out.println("<td><textarea rows='10' cols='70' name='intro'"
			+ ">" + user.getIntro() + "</textarea></td></tr>");
		%>
		<tr>
			<td colspan="2" align="center">
			<input type="submit" value="수정하기">
			<input type="reset" value="다시쓰기">
			<a><input type="button" value="삭제하기" onclick="top.location.href='delete?id=${user.getId()}'"></a>
			</td>
		</tr>
	</table>
	</form>
</body>
</html>