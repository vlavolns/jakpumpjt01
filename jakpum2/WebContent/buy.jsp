<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			if(!form.bcnt.value){
				alert("갯수를 입력해주세요");
				form.bcnt.focus();
				return false;
			}
			if(!form.sumprice.value){
				alert("최종가격 계산을 진행해주세요");
				form.sumprice.focus();
				return false;
			}
			return true;
		}
		function sumresult(){
			form.sumprice.value=form.price.value*form.bcnt.value;
		}
		<%
			if(request.getAttribute("true")!=null){
				%>
					alert("구매가 정상적으로 처리되었습니다");
				<%
			}
			else{
				if(request.getAttribute("false")!=null){
					%>
					alert("구매가 정상적으로 처리되지 않았습니다 다시 시도 바랍니다");
					<%
				}
			}
		%>
	</script>
	
	<style>
	 form{text-align: -webkit-center;}
	</style>
</head>
<body>
	<form action="buyinsert" name = "form" onsubmit="return blankcheck()">
		<h1>도서구입</h1>
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
				<td>제목:
				</td>
				<td>
					<input type="text" name="title" readonly value=''>
				</td>
				<td>
					 <input type="button" onclick="check2()" value="조회하기">
				</td>
			</tr>
			<tr>
				<td>도서가격:
				</td>
				<td>
					<input type="text" name="price" readonly value=''>
				</td>
			</tr>
			
			<tr>
				<td>갯수:
				</td>
				<td>
					<input type="text" name="bcnt">
				</td>
			</tr>
			
			<tr>
				<td>계산할금액:
				</td>
				<td>
					<input type="text" name="sumprice" readonly value=''>
				</td>
				<td>
					<input type="button" onclick="sumresult()" value="계산하기">
				</td>
			</tr>
			
			<tr>
				<td>결제구분:
				</td>
				<td>
					<select name="tg">
						<option>카드</option>
						<option>현금</option>
					</select>
				</td>
			</tr>
			
			<tr>
				<td>
				</td>
				
				<td colspan="2">
					<input type="submit" value="구입">
					<input type="button" value="구입목록" onclick="location.href='buylist'">
					<input type="button" value="취소" onclick="top.location.href='mainpage.jsp'">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>