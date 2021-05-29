<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<style type="text/css">
.aa{
 position: relative;
 bottom: -30px;;
 width: 100%;
 
}
</style>
</head>
<body>
	<header>
		<jsp:include page="header.jsp"/>
	</header>
		<jsp:include page="${center }"/>
	<footer class="aa">
		<jsp:include page="footer.jsp"/>
	</footer>

</body>
</html>	