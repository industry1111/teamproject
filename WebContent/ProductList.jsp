<%@page import="db.productDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
 List<productDTO> list =(List<productDTO>)request.getAttribute("productList");
%>
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

	</head>
	<body>
<!-- 	<div id="page"> -->
		<div class="colorlib-product">
			<div class="container">
				<div class="row row-pb-lg">
					<div class="col-md-12">
						<div class="product-name d-flex">
							<div class="one-eight text-left px-4">
								<span>상품목록</span>
							</div>
							<div class="one-forth text-center">
								<span>상품설명</span>
							</div>
							<div class="one-eight text-center">
								<span>카테고리</span>
							</div>
							<div class="one-eight text-center">
								<span>가격</span>
							</div>
							<div class="one-eight text-center px-4">
								<span>상품 수정</span>
							</div>
							<div class="one-eight text-center px-4">
								<span>상품 삭제</span>
							</div>
						</div>

						<c:forEach var="list" items="${productlist}">

							<div class="product-cart d-flex">
								<div class="one-forth">
									<div>
										<img src="${list.product_img}" style="width: 100px;height: 100px;">
									</div>
									<div class="display-tc">
										<h3>${list.product_name}</h3> <%-- 상품명 --%>
									</div>
								</div>
								<div class="one-forth text-center">
									<div class="display-tc">
										${list.description} <%-- 물품가격 --%>
									</div>
								</div>
								<div class="one-eight text-center">
									<div class="display-tc">
										${list.product_category } <%--카테고리 --%>
									</div>
								</div>
								<div class="one-eight text-center">
									<div class="display-tc">
										${list.price } <%--상품가격 --%>
									</div>
								</div>
								<div class="one-eight text-center">
									<div class="display-tc">
										<a href="ProductModify.bo" type="button" class="btn btn-outline-success">수정</a>
									</div>
								</div>
								<div class="one-eight text-center">
									<div class="display-tc">
									<a href="ProductDelete.bo" type="button" class="btn btn-outline-danger">삭제</a>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
					<%--해당 쇼핑몰 홈페이지로 이동 --%>
					<div class="one-eight text-center">
						<div class="display-tc">
							<a href="ProductAdd.bo" type="button" class="btn btn-outline-info">신규 상품 등록</a>
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