<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<link rel="stylesheet" type="text/css" href="css/style.css">

</head>
<body>
<c:set var="rating" value="4"></c:set>
	<form action="RatingAction.bo">
	
		<div class="star-rating">
			<c:if test="${rating == 1 }">
				<input type="text" id="5" name="rating" value="5" /> 
				<label for="5" class="star" >&#9733;</label> 
				<input type="text"	id="4-stars" name="rating" value="4" />
				<label for="4-stars" class="star">&#9733;</label> 
				<input type="text" id="3" name="rating" value="3"/>
				<label for="3-stars" class="star">&#9733;</label>
				<input type="text" id="2-stars" name="rating" value="2" /> 
				<label	for="2-stars" class="star">&#9733;</label> 
				<input type="text"	id="1-star" name="rating" value="1" checked /> 
				<label for="1-star"	class="star">&#9733;</label>
			</c:if>
		</div>
		<div class="star-rating">
			<c:forEach var="i" begin="1" step="1" end="5">
			<c:if test="${rating != 6-i }">
				<input type="radio" id="${6-i }-stars" name="rating" value="${6-i }" /> 
				<label for="${6-i }-stars" class="star" >&#9733;</label> 
			</c:if>
			<c:if test="${rating == 6-i }">
				<input type="radio" id="${6-i }-stars" name="rating" value="${6-i }" checked /> 
				<label for="${6-i }-stars" class="star" >&#9733;</label> 
			</c:if>
			
			</c:forEach>
		</div>
	
	</form>
</body>
</html>