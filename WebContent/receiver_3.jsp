<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<head>
<title>배송지 정보</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://fonts.googleapis.com/css?family=Montserrat:300,400,500,600,700"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Rokkitt:100,300,400,700"
	rel="stylesheet">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<!-- Animate.css -->
<link rel="stylesheet" href="css/animate.css">
<!-- Icomoon Icon Fonts-->
<link rel="stylesheet" href="css/icomoon.css">
<!-- Ion Icon Fonts-->
<link rel="stylesheet" href="css/ionicons.min.css">

<!-- Magnific Popup -->
<link rel="stylesheet" href="css/magnific-popup.css">

<!-- Flexslider  -->
<link rel="stylesheet" href="css/flexslider.css">

<!-- Owl Carousel -->
<link rel="stylesheet" href="css/owl.carousel.min.css">
<link rel="stylesheet" href="css/owl.theme.default.min.css">

<!-- Date Picker -->
<link rel="stylesheet" href="css/bootstrap-datepicker.css">
<!-- Flaticons  -->
<link rel="stylesheet" href="fonts/flaticon/font/flaticon.css">

<!-- Theme style  -->
<link rel="stylesheet" href="css/style.css">

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	var contextPath = "${pageContext.request.contextPath}";
</script>
<script src="js/receiver.js"></script> 
<style type="text/css">
table
{
    border-collapse: collapse;
    width: 90%;
}
th, td
{
    text-align: left;
    padding: 8px;
}
tr:nth-child(even)
{
    background-color: white;
}
th
{
    background-color: #4CAF50;
    color: white;
}
</style>
</head>
<body>
	
	<div class="row">
			<div class="col-md-3" align="right">
				 <img
					src="images/modooLogo.png"
					alt="Logo" style="height: 30px">
			
			</div>
	</div>
	<h6 align="center">배송지 목록</h6>

	<table align="center">
	<tr>
		<th>배송지</th>
		<th>주소</th>
		<th>연락처</th>
		<th>선택</th>
	</tr>
	<c:forEach var="i" begin="0" step="1" end="${list.size()-1}" >
		<tr>
			<td>${list[i].address_name}</td>
			<td>${list[i].receiver_addr1}<br>
				${list[i].receiver_addr2}<br>
				${list[i].receiver_addr3}
			</td>
			<td>${list[i].receiver_phone}</td>
			<td>선택</td>
		<tr>
	</c:forEach>
	
	</table>
		
			<div class="row" style="margin-left: 100px">
				<div style="margin-right: 20px">
					<input type="button" class="myButton" value="닫기" name="close_btn" id="close_btn" >
				</div>
			</div>

	<!-- 	</div> -->
	<!-- popper -->
	<script src="js/popper.min.js"></script>
	<!-- bootstrap 4.1 -->
	<script src="js/jquery.easing.1.3.js"></script>
	<!-- Waypoints -->
	<script src="js/jquery.waypoints.min.js"></script>
	<!-- Flexslider -->
	<script src="js/jquery.flexslider-min.js"></script>
	<!-- Owl carousel -->
	<script src="js/owl.carousel.min.js"></script>
	<!-- Magnific Popup -->
	<script src="js/jquery.magnific-popup.min.js"></script>
	<script src="js/magnific-popup-options.js"></script>
	<!-- Date Picker -->
	<script src="js/bootstrap-datepicker.js"></script>
	<!-- Stellar Parallax -->
	<script src="js/jquery.stellar.min.js"></script>
	<!-- Main -->
	<script src="js/main.js"></script>

</body>
</html>