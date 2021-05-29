<%@page import="dto.productDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML>
<html>
	<head> <%--not used --%>
	<title>판매자 물품관리 페이지</title>
   <meta charset="utf-8">
   <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<link href="https://fonts.googleapis.com/css?family=Montserrat:300,400,500,600,700" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Rokkitt:100,300,400,700" rel="stylesheet">
	
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
	<style>
		.a{
			margin-top: 40px;
		}
	</style>
	</head>
	<body>
	<form action="ProductListAction.bo" method="post"
		enctype="multipart/form-data">
		<div class="colorlib-product">
			<div class="container">
				<div class="row">
						<div class="product-name d-flex" align="center">
							<div class="col-md-2">
								상품이미지
							</div>
							<div class="col-md-2">
								상품이름
							</div>
							<div class="col-md-2">
								상품설명
							</div>
							<div class="col-md-2">
								카테고리
							</div>
							<div class="ocol-md-2">
								가격
							</div>
							<div class="col-md-2 offset-1">
								수정 및 삭제
							</div>
						</div>
				</div>

				<c:forEach var="i" begin="0" step="1" end="${list.size() }">

					<div class="row  d-flex" align="center">
						<div class="col-md-2">
								<img src="${list[i].product_img}" style="width: 100px;height: 100px;">
						</div>
						<div class="col-md-2">
							<div class="a">${list[i].product_name}</div> <%-- 상품명 --%>
						</div>
						<div class="col-md-2">
							<div class="a">${list[i].product_description}</div> <%-- 물품가격 --%>
						</div>
						<div class="col-md-2">
							<div class="a">${list[i].category_name }</div> <%--카테고리 --%>
						</div>
						<div class="col-md-1" align="left">
							<div class="a">${list[i].product_price }</div> <%--상품가격 --%>
						</div>
						<div class="col-md-2" style="margin-left: 40px;">
							<div class="a">
								<a href="ProductModify.bo?product_num=${list[i].product_num}" type="button" class="btn btn-outline-success">수정</a>
								<a href="ProductDelete.bo?product_num=${list[i].product_num}" type="button" class="btn btn-outline-danger">삭제</a>
							</div>
						</div>
					</div>
				</c:forEach>
			
			<%--해당 쇼핑몰 홈페이지로 이동 --%>
			<div class="row">
				<div class="col-md-3 offset-3" align="right">페이징</div>
				<div class="col-md-3 offset-3" align="right">
					<a href="ProductAdd.bo" type="button" class="btn btn-outline-info">신규 상품 등록</a>
				</div>
			</div>
			
<!-- 	</div> -->
	</div>
</form>
<!--  form태그 끝 -->
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