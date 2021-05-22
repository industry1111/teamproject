<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
<head>
<meta charset="utf-8" />
<title>header</title>

<style>
.h_nav {
	font-size: 10px;
	font-weight: bold;
	color: black;
	text-decoration: none;
}


</style>
</head>

<c:if test="${code == null }">
	<c:set var="code" value="0" />
</c:if>

<body>
	<div class="row">
		<div class="col-md-3" align="right">
			<a href="${pageContext.request.contextPath}/index.jsp"> <img
				src="${pageContext.request.contextPath}/images/modooLogo.jpg"
				alt="Logo" style="height: 30px">
			</a>
		</div>
		<div class="col-md-6" align="right">

			<!-- 로그인 안되었을때 -->
			<c:if test="${code == 0}">
				<a class="h_nav" href="member/login.jsp">로그인</a>
				<a class="h_nav" href="member/join.jsp">회원가입</a>
<%-- 			</c:if> --%>

			<!--로그인 되었을 경우 -->
<%-- 			<c:if test="${code == 1}"> --%>
				<a class="h_nav" href="#!">마이페이지</a>
				<a class="h_nav" href="#!">장바구니</a>
				<a class="h_nav" href="seller/joinSeller.jsp">스토어 등록</a>
				<a class="h_nav" href="#!">로그아웃</a>
			</c:if>

			<!-- 판매자 로그인 -->
			<c:if test="${code == 2 }">
				<a class="h_nav" href="#!">마이스토어</a>
				<a class="h_nav" href="#!">마이페이지</a>
				<a class="h_nav" href="#!">장바구니</a>
				<a class="h_nav" href="#!">로그아웃</a>
			</c:if>

		</div>
	</div>
	<!-- Bootstrap core JS-->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4"
	crossorigin="anonymous"></script>
</body>
</html>
