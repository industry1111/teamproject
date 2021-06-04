<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<head>
<title>주문내역</title>
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

</head>
<body>
	<!-- 	<div id="page"> -->
	<div class="colorlib-product">
		<div class="container">
			<div class="row row-pb-lg">
				<div class="col-md-12">
					<div class="product-name d-flex">
						<div class="one-forth text-left px-4">
							<span>Product Details</span>
						</div>
						<div class="one-eight text-center">
							<span>Price</span>
						</div>
						<div class="one-eight text-center">
							<span>quantity</span>
						</div>
						<div class="one-eight text-center">
							<span>Total Price</span>
						</div>
						<div class="one-eight text-center px-4">
							<span>Status</span>
						</div>
					</div>
					<c:forEach var="i" begin="0" step="1" end="${list.size()-1}">
						
						<div class="product-cart d-flex">
							<div class="one-forth">
							&nbsp;
								<a> <img src="product_img_upload/${list[i].image}"
									style="width: 100px; height: 100px;">
								</a>
								&nbsp;&nbsp;&nbsp;&nbsp;
								
									상품 : ${list[i].product_name}
									
							</div>
							<div class="one-eight text-center">
								<div class="display-tc">
									<span class="price">${list[i].product_price}</span>
								</div>
							</div>
							<div class="one-eight text-center">
								<div class="display-tc">
									<span class="quantity">${list[i].quantity}</span>
								</div>
							</div>
							<div class="one-eight text-center">
								<div class="display-tc">
									<span class="total_price">${list[i].quantity * list[i].product_price}원</span>
								</div>
							</div>
							
						</div>
					
					</c:forEach>
				</div>
			</div>
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