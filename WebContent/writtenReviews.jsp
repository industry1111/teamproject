<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<head>
<title>Footwear - Free Bootstrap 4 Template by Colorlib</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://fonts.googleapis.com/css?family=Montserrat:300,400,500,600,700"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Rokkitt:100,300,400,700"
	rel="stylesheet">

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

<style type="text/css">
.check {
	color: red;
	font-size: 13px;
}

.check2 {
	color: green;
	font-size: 13px;
}

input[type="text"] {
	width: 30%;
	border: 2px solid DarkGray;
	border-radius: 4px;
	margin: 8px 0;
	outline: none;
	padding: 8px;
	box-sizing: border-box;
	transition: 0.3s;
}

input[type="text"]:focus {
	border-color: dodgerBlue;
	box-shadow: 0 0 8px 0 dodgerBlue;
}

.inputWithIcon input[type="text"] {
	padding-left: 40px;
}

.inputWithIcon {
	position: relative;
}
</style>

</head>
<body>

	<!-- 	<div id="page"> -->
	<div class="colorlib-product">
		<div class="container">
			<div class="row ">
				<div class="col-md-12">
					<div class="product-name d-flex " align="center">
						<div class="col-md-2">내가 작성한 리뷰</div>
					</div>
				</div>
			</div>
			//for
			<div class="row">
				<div class="col-md-12">
					<div class="row" style="border: 1px solid black;">
						<div class="col-md-1"style="border: 1px solid black;">
							<img src="" style="width: 50px;height: 50px;">
						</div>
						<div class="col-md-4">
							상품이름<br>
							상품설명
						</div>
					</div>
					<div class="row" style="border: 1px solid black;">
						<div class="col-md-12">
							<div class="row">
								<div class="col-md-3 offset-1">
								${rdto.rating1 }


								</div>
								<div class="col-md-1 offset-7">
									x
								</div>
							</div>
							<div class="row">
								<div class="col-md-7">
									상품 평
								</div>
								<div class="col-md-4" align="right">
									<img src="" style="width: 100px; height: 100px;">
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			//for
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