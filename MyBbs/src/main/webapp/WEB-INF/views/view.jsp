<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세보기</title>
</head>
<body>
	<jsp:include page="header.jsp" />
	
	<h3 align="center">게시글 보기</h3>
	<table align="center" border="1px" width="900px">
		<tr>
			<th width="80px">제목</th>
			<td>${bbsDto.title}</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>${bbsDto.writer}</td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea style="width: 800px; height: 350px;" readonly>${bbsDto.content}</textarea></td>
		</tr>
		<c:if test="${bbsDto.writer eq loginUser.name}">
			<tr>
				<td colspan="2" align="center">
					<input type="button" value="수정" onclick="location.href='updateForm?num=${bbsDto.num}'">
					<input type="button" value="삭제" onclick="location.href='delete?num=${bbsDto.num}'">
				</td>
			</tr>
		</c:if>
		<!-- 댓글창 -->
		<c:if test="${not empty loginUser}">
			<tr>
				<th colspan="2">댓글</th>
			</tr>
			<tr>
				<td colspan="2">
					<form action="insertReply">
						<textarea name="comments" style="width: 800px;"></textarea>
						<input type="hidden" name="bbs_num" value="${bbsDto.num}">
						<input type="submit" value="댓글등록">
					</form>
				</td>
			</tr>
			<c:forEach var="replyList" items="${replyDto}">
				<tr>
					<td>${replyList.writer}</td>
					<td>${replyList.comments}</td>
				</tr>
			</c:forEach>
		</c:if>
	</table>
</body>
</html>