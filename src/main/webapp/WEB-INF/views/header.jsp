<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<header>
	<h1 align="center">My Bulletin Board System</h1>
	<hr>
		<div align="center">
			<c:if test="${not empty loginUser}">
				${loginUser.name}님 &nbsp;&nbsp;&nbsp;
				<a href="board">게시글목록</a> &nbsp;&nbsp;&nbsp;
				<a href="logout">로그아웃</a>
			</c:if>
			<c:if test="${empty loginUser}">
				GUEST님 &nbsp;&nbsp;&nbsp;
				<a href="board">게시글목록</a> &nbsp;&nbsp;&nbsp;
				<a href="loginForm">로그인</a>
			</c:if>
		</div>
	<hr>
</header>