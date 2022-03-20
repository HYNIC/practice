<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글수정</title>
</head>
<body>
	<jsp:include page="header.jsp" />
	
	<h3 align="center">게시글 수정</h3>
	
	<form action="update">
		<table align="center" border="1px" width="900px">
			<tr>
				<th width="80px">제목</th>
				<td><input type="text" name="title" value="${bbsDto.title}"></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>${bbsDto.writer}</td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea name="content" style="width: 800px; height: 350px;">${bbsDto.content}</textarea></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="hidden" name="num" value="${bbsDto.num}">
					<input type="submit" value="수정"> 
					<input type="button" value="삭제" onclick="location.href='delete?num=${bbsDto.num}'">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>