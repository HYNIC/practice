<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
	<jsp:include page="header.jsp" />
	<h3 align="center">로그인</h3>
	<form action="login" method="post">
		<table align="center">
			<tr>
				<th>아이디</th>
				<td><input type="text" id="id" name="id"></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" id="pw" name="pw"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<div id="msg"></div>
					<input type="submit" value="로그인" onclick="return checkInput()">
					<input type="button" value="회원가입" onclick="location.href='registForm'"><br>
					<a href="board">Guest로 입장</a> 
				</td>
			</tr>
		</table>
	</form>
	
	
<script>
	function checkInput() {
		var id = document.querySelector("#id");
		var pw = document.querySelector("#pw");
		var msg = document.querySelector("#msg");
		if (id.value.length == 0) {
			msg.innerText = "아이디를 입력해주세요";
			return false;
		}
		
		if (pw.value.length == 0) {
			msg.innerText = "비밀번호를 입력해주세요";
			return false;
		}
		
		alert(id.value + "님 환영합니다");
	}
</script>
</body>
</html>