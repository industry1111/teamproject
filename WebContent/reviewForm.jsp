<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<head>
<title>배송지 등록</title>
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
.myButton {
	box-shadow: inset 0px 1px 0px 0px #ffffff;
	background: linear-gradient(to bottom, #ffffff 5%, #f6f6f6 100%);
	background-color: #ffffff;
	border-radius: 6px;
	border: 1px solid #dcdcdc;
	display: inline-block;
	cursor: pointer;
	color: #666666;
	font-family: Arial;
	font-size: 15px;
	font-weight: bold;
	padding: 6px 24px;
	text-decoration: none;
	text-shadow: 0px 1px 0px #ffffff;
}

.myButton:hover {
	background: linear-gradient(to bottom, #f6f6f6 5%, #ffffff 100%);
	background-color: #f6f6f6;
}

.myButton:active {
	position: relative;
	top: 1px;
}

.check {
	color: red;
	font-size: 13px;
}

.check2 {
	color: green;
	font-size: 13px;
}

input[type="text"] {
	width: 40%;
	border: 1px solid DarkGray;
	border-radius: 4px;
	margin: 8px 0;
	outline: none;
	padding: 8px;
	box-sizing: border-box;
	transition: 0.3s;
}
</style>
</head>
<body>

	<div class="row">
		<div class="col-md-3" align="right">
			<img src="images/modooLogo.png" alt="Logo" style="height: 30px">
		</div>
	</div>
	<h4 align="center">리뷰쓰기</h4>
		<form action="WriteReviewAction.bo" method="post" enctype="multipart/form-data">
		<div class="row">
			<div class="col-md-8 offset-1">
				<div class="row" style="border: 1px solid black;">
					<div class="col-md-1" style="border: 1px solid black;">
						<img src="" style="width: 50px; height: 50px;">
					</div>
					<div class="col-md-4">
						상품이름<br> 상품설명
					</div>
				</div>
					<div class="row" style="border: 1px solid black;">
						<div class="col-md-8 offset-4" >
							<div class="row">상품은 만족스러운가요?</div>
							<div class="row">배송은 만족스러운가요?</div>
							<div class="row">다시 구매할 의향이 있나요?</div>
						<div class="row">
							어떤점이 좋았나요? <br> 
							
							<textarea name="textarea" cols="50" rows="10" placeholder="자유롭게 작성해주세요"></textarea>
							
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-md-8">
			<div class="form-group mb-4">
				<img src="" id="preview"><br> <label for="profile_img">사진 첨부하기</label> 
					<input type="file"  id="profile_img" name="profile_img" hidden />
			</div>
		</div>
		
		
			<div class="row" style="margin-left: 100px">
				<div style="margin-right: 20px">
					<input type="button" class="myButton" value="닫기" name="close_review_btn" id="close_review_btn">
				</div>
				<div>
					<input type="submit" class="myButton" value="저장" name="write_review_btn" id="write_review_btn">
			</div>
		</div>
	</form>

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