<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원등록</title>
</head>
<body>
	<jsp:include page="header.jsp" />
	<div id="beforeRegist" align="center">
		<h3>회원가입 전 유의사항</h3>
		1. 확인 후 회원가입을 진행해 주세요<br>
		2. 무슨말을 써야하죠?<br>
		<div id="confirmMsg" style="color: tomato;"></div>		
		<input type="checkbox" id="confirm">확인했습니다.<br>
		<input type="button" value="가입하기" onclick="checkBeforeRegist()">
	</div>
	
	
	<div id="regiForm" style="display: none;" align="center">
		<h3>회원가입</h3>
		
		<form action="regist" method="post">
			<table>
				<tr>
					<th>아이디</th>
					<td>
						<input type="text" id="id" name="id" placeholder="ID입력">
						<input type="button" value="중복검사" onclick="checkId()">
						<div id="id_msg"></div>
					</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="text" id="pw" name="pw" placeholder="PW입력"></td>
				</tr>
				<tr>
					<th>이름</th>
					<td><input type="text" id="name" name="name" placeholder="이름입력"></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<div id="msg" style="color: red;"></div>
						<input type="submit" value="가입하기" onclick="return checkInput()">
					</td>
				</tr>
			</table>
		</form>
	</div>
<script>
	var id = document.querySelector("#id");
	var pw = document.querySelector("#pw");
	var username = document.querySelector("#name");
	var msg = document.querySelector("#msg");

	function checkBeforeRegist() {
		console.log(document.querySelector("#confirm").checked);
		if (!document.querySelector("#confirm").checked) {
			document.querySelector("#confirmMsg").innerHTML = "유의사항을 확인해 주세요.<br>"
			return false;
		}
		
		document.querySelector("#beforeRegist").style.display = "none";
		document.querySelector("#regiForm").style.display = "";
		id.focus();
		
	}
	
	let id_val;
	function checkId() {
		var xhr = new XMLHttpRequest();
		id_val = id.value;
		var id_msg = document.querySelector("#id_msg");
		//console.log(id_val);
		
		xhr.onreadystatechange = function() {
			if(xhr.readyState == 4 && xhr.status == 200) {
				let result = xhr.responseText;
				
				if (result == -1) {
					id_msg.innerHTML = "<span style='color: red;'>아이디를 입력해주세요.</span>";
				} else if (result == 1) {
					id_msg.innerHTML = "<span style='color: red;'>이미 사용중인 아이디입니다.</span>";
				} else if (result == 0) {
					id_msg.innerHTML = "<span style='color: seagreen;'>사용가능한 아이디입니다.</span>";
				}
			}
		}
		
		xhr.open("get", "checkId?id=" + id_val, true);
		xhr.send();
	}
	
	function checkInput() {
		
		if (id.value.length == 0) {
			msg.innerText = "아이디를 입력해주세요";
			id.focus();
			return false;
		}
		
		if (id_val != id.value) {
			msg.innerText = "아이디 중복검사를 해주세요"
			id_val = "";
			id_msg.innerHTML = "";
			id.focus();
			return false;
		} 
		
		if (pw.value.length == 0) {
			msg.innerText = "비밀번호를 입력해주세요";
			pw.focus();
			return false;
		}
		
		if (username.value.length == 0) {
			msg.innerText = "이름을 입력해주세요";
			username.focus();
			return false;
		}
		
		alert(id_val + "님 가입완료되었습니다.");
	}
	
</script>
</body>
</html>