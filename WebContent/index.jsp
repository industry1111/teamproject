<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<c:set var="center" value="${param.center }"></c:set>
<c:if test="${center == null }">
	<c:set var="center" value="index-slider.html"></c:set>
</c:if>
	

<title>모두?</title>
</head>

<body>
	<%--Header --%>
	<jsp:include page="header.jsp"/>
	
	<%--Center --%>
	<jsp:include page="${center }"/>
	<!-- Footer-->
	<jsp:include page="footer.jsp"/>

</body>
</html>
