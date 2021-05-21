<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="utf-8" />
	
<c:set var="center" value="main2.jsp"></c:set>
<title>모두?</title>
</head>

<body>
	<%--Header --%>
	<jsp:include page="header.jsp"/>
	<hr>
	<%--Center --%>
	<jsp:include page="${center }"/>
	<!-- Footer-->
	<jsp:include page="footer.jsp"/>

</body>
</html>
