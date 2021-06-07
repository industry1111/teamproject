<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>	
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>2번째 템플릿입니다.</title>
 		<link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700" rel="stylesheet">
 		<link type="text/css" rel="stylesheet" href="template2/css/bootstrap.min.css"/>
 		<link type="text/css" rel="stylesheet" href="template2/css/slick.css"/>
 		<link type="text/css" rel="stylesheet" href="template2/css/slick-theme.css"/>
 		<link type="text/css" rel="stylesheet" href="template2/css/nouislider.min.css"/>
 		<link rel="stylesheet" href="template2/css/font-awesome.min.css">
 		<link type="text/css" rel="stylesheet" href="template2/css/style.css"/>
 		
 		<script> var contextPath = "${pageContext.request.contextPath}";</script>
</head>
	<body>
		<header>

			<!-- MAIN HEADER -->
			<div id="header">
				<!-- container -->
				<div class="container">
					<!-- row -->
					<div class="row">
						<!-- LOGO -->
						<div class="col-md-3">
							<div class="header-logo">
								<a href="#" class="logo">
									<!-- <img src="./img/logo.png" alt=""> --><h1>상호명</h1></a>
							</div>
						</div>
						<!-- /LOGO -->
						
						<!-- ACCOUNT -->
						<div class="col-md-3 clearfix">
							<div class="header-ctn">
								<!-- Wishlist -->
								<div align="right">
									<a href="#">
										<i class="fa fa-heart-o"></i>
										<span>Your Wishlist</span>
										<div class="qty">2</div>
									</a>
								</div>
								<!-- /Wishlist -->

								<!-- Cart -->
								<div class="dropdown">
									<a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true">
										<i class="fa fa-shopping-cart"></i>
										<span>Your Cart</span>
										<div class="qty">3</div>
									</a>
									<div class="cart-dropdown">
										<div class="cart-list">
											<div class="product-widget">
												<div class="product-img">
													<img src="product_img_upload/${pdto.product_img}" alt="">
												</div>
												<div class="product-body">
													<h3 class="product-name"><a href="#">상품명</a></h3>
													<h4 class="product-price"><span class="qty">1x</span>$980.00</h4>
												</div>
												<button class="delete"><i class="fa fa-close"></i></button>
											</div>

											<div class="product-widget">
												<div class="product-img">
													<img src="product_img_upload/${pdto.product_img}" alt="">
												</div>
												<div class="product-body">
													<h3 class="product-name"><a href="#">product name goes here</a></h3>
													<h4 class="product-price"><span class="qty">3x</span>$980.00</h4>
												</div>
												<button class="delete"><i class="fa fa-close"></i></button>
											</div>
										</div>
										<div class="cart-summary">
											<small>3 Item(s) selected</small>
											<h5>SUBTOTAL: $2940.00</h5>
										</div>
										<div class="cart-btns">
											<a href="#">View Cart</a>
											<a href="#">Checkout  <i class="fa fa-arrow-circle-right"></i></a>
										</div>
									</div>
								</div>
								<!-- /Cart -->

								<!-- Menu Toogle -->
								<div class="menu-toggle">
									<a href="#">
										<i class="fa fa-bars"></i>
										<span>Menu</span>
									</a>
								</div>
								<!-- /Menu Toogle -->
							</div>
						</div>
						<!-- /ACCOUNT -->
					</div>
					<!-- row -->
				</div>
				<!-- container -->
			</div>
		</header>

		<!-- SECTION -->
		<div class="section">
			<!-- container -->
			<div class="container">
				<!-- row -->
				<div class="row">
		<form name="newProduct" action="StoreProductDetail.st"
			class="form-horizontal" method="post" enctype="multipart/form-data">
					<!-- 상품상세보기시작 -->
					<div class="col-md-5">
						<div class="product-widget">
												<div class="product-img">
													<img src="product_img_upload/${pdto.product_img}" alt="">
												</div>
											</div>	
						<div class="product-details">
							<h2 class="product-name">${pdto.product_name}</h2>
						<div>
								<h3 class="product-price">${pdto.product_price}</h3>
								<span class="product-available">재고있음</span>
							</div>
							<p>상품설명  :  ${pdto.product_description}</p>
							<div class="product-options">
								<label>
									크기
									<select class="input-select">
										<option value="0">X</option>
									</select>
								</label>
								<label>
									색상
									<select class="input-select">
										<option value="0">Red</option>
									</select>
								</label>
							</div>

							<div class="add-to-cart">
								<div class="qty-label">
									수량
									<div class="input-number">
										<input type="number">
										<span class="qty-up">+</span>
										<span class="qty-down">-</span>
									</div>
								</div>
								<button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i>장바구니추가하기</button>
							</div>
						</div>
					</div>
					<!-- 상품상세보기 끝 -->

					</form>

									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

			

		<script src="template2/js/jquery.min.js"></script>
		<script src="template2/js/bootstrap.min.js"></script>
		<script src="template2/js/slick.min.js"></script>
		<script src="template2/js/nouislider.min.js"></script>
		<script src="template2/js/jquery.zoom.min.js"></script>
		<script src="template2/js/main.js"></script>

	</body>
</html>