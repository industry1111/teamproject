<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>header</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!--         Core theme CSS (includes Bootstrap) -->
<link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet" />
<style>
.h_nav{
	font-size: 10px;
	font-weight: bold;
}
</style>
</head>


<c:set var="id" value="0"/>


<body>
	<!-- Navigation-->
	<nav class="navbar navbar-expand-lg " style="height: 30px">
		<div class="container">
			<a class="navbar-brand" href="${pageContext.request.contextPath}/index.jsp"><img
				src="${pageContext.request.contextPath}/images/modooLogo.jpg" alt="Logo" style="height: 30px"></a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarResponsive" aria-controls="navbarResponsive"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<!-- 로그인 안되었을때 -->
					<c:if test="${id == 0}">
						<li class="nav-item"><a class="nav-link h_nav" href="#!">로그인</a></li>
						<li class="nav-item"><a class="nav-link h_nav" href="#!">회원가입</a></li>
					</c:if>

					<!--로그인 되었을 경우 -->
					<c:if test="${id == 1}">
						<li class="nav-item"><a class="nav-link h_nav" href="#!">마이페이지</a></li>
						<li class="nav-item"><a class="nav-link h_nav" href="#!">장바구니</a></li>
						<li class="nav-item"><a class="nav-link h_nav" href="#!">로그아웃</a></li>
					</c:if>
					
					<!-- 판매자 로그인 -->
					<c:if test="${id == 2 }">
						<li class="nav-item"><a class="nav-link h_nav" href="#!">마이스토어</a></li>
						<li class="nav-item"><a class="nav-link h_nav" href="#!">마이페이지</a></li>
						<li class="nav-item"><a class="nav-link h_nav" href="#!">장바구니</a></li>
						<li class="nav-item"><a class="nav-link h_nav" href="#!">로그아웃</a></li>
					</c:if>

					<!-- ------------------------------------ -->

					



				</ul>
			</div>
		</div>
	</nav>
	<!-- Bootstrap core JS-->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="${pageContext.request.contextPath}/js/scripts.js"></script>
</body>
</html>
