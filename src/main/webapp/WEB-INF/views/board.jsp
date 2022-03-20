<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
</head>
<body>

	<jsp:include page="header.jsp" />
	
	<h3 align="center">게시글 목록</h3>
	
	<table align="center" border="1px" width="900px">
		<tr>
			<td colspan="5" align="right">
				<form action="search">
					<select name="search_opt">
						<option value="" selected>--선택--</option>
						<option value="title">제목</option>
						<option value="writer">작성자</option>
						<option value="content">내용</option>
					</select>
					<input type="text" name="search_keyword">
					<input type="submit" value="검색">
				</form>
			</td>
		</tr>
		<tr>
			<td colspan="5">
				<input type="button" value="글쓰기" onclick="location.href='writeForm'">
			</td>
		</tr>
		<tr>
			<th width="50px">No</th>
			<th>제목</th>
			<th width="100px">작성자</th>
			<th width="180px">작성일자</th>
			<th width="50px">댓글</th>
		</tr>
		
		<c:if test="${empty searchList}">
			<c:set var="bList" value="${list}" />
		</c:if>
		<c:if test="${not empty searchList}">
			<c:set var="bList" value="${searchList}" />
		</c:if>
		
		<c:forEach var="bbsList" items="${bList}">
			<tr>
				<td>${bbsList.num}</td>
				<td><a href=view?num=${bbsList.num}>${bbsList.title}</a></td> 
				<td>${bbsList.writer}</td>
				<td>${bbsList.regdate}</td>
				<td>${bbsList.replycnt}</td>
			</tr>
		</c:forEach>
	</table>
	
	<!-- 페이징처리 해야함 -->
	<p align="center">
		<c:if test="${pageNum > 1}">
			<a href="board?page=${pageNum - 1}">prev</a>&nbsp;&nbsp;
			<c:if test="${pageNum > 2}">
				<a href="board?page=${pageNum - 2}">${pageNum -2}</a>&nbsp;&nbsp;
			</c:if>
			
			<a href="board?page=${pageNum - 1}">${pageNum -1}</a>&nbsp;&nbsp; 
		</c:if>
		
		<a href="board?page=${pageNum}">${pageNum}</a>&nbsp;&nbsp;
		
		<c:if test="${pageNum < lastPage}">
			<a href="board?page=${pageNum + 1}">${pageNum + 1}</a>&nbsp;&nbsp;
			<c:if test="${pageNum < (lastPage - 1)}">
				<a href="board?page=${pageNum + 2}">${pageNum + 2}</a>&nbsp;&nbsp;
			</c:if>
			<a href="board?page=${pageNum + 1}">next</a>&nbsp;&nbsp;
		</c:if>
	</p>

	

</body>
</html>