
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>템플렛3번입니다.</title>
<link rel="icon" href="template3/img/core-img/favicon.ico">
<link rel="stylesheet" href="template3/css/core-style.css">
<link rel="stylesheet" href="template3/style.css">
</head>

<body>

	<!--================ Start Header Menu Area =================-->
	<div class="search-wrapper section-padding-100">
		<div class="search-close">
			<i class="fa fa-close" aria-hidden="true"></i>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="search-content">
						<form action="#" method="get">
							<input type="search" name="search" id="search"
								placeholder="Type your keyword...">
							<button type="submit">
								<img src="img/core-img/search.png" alt="">
							</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- ##### Main Content Wrapper Start ##### 꼭 있어야함-->
	<div class="main-content-wrapper d-flex clearfix">
		<!-- Mobile Nav (max width 767px)  -->
		<div class="mobile-nav">
			<!-- Navbar Brand  -->
			<div class="amado-navbar-brand">
				<a href="index.html"><img src="img/core-img/logo.png" alt="">
					상호명</a>
			</div>
			<!--Navbar Toggler -->
			<div class="amado-navbar-toggler">
				<span></span><span></span><span></span>
			</div>
		</div>

		<div class="shop_sidebar_area">
			<!-- 	##### Single Widget ##### -->
			<div class="widget catagory mb-50">
				<!-- Widget Title -->
				<div class="logo">
					<a href="index.html"> <img src="img/core-img/logo.png" alt="">
					<h1>
							상호명
							<h1></a>
				</div>
				<br>

				<h6 class="widget-title mb-30">카테고리</h6>

				<!-- ================ 카테고리 섹션 시작 ================= -->
				<div class="catagories-menu">
					<ul>
						<li class="active"><a href="#">의자</a></li>
				</div>
			</div>
			<div class="widget brands mb-50">
				<!-- 카테고리2 시작 -->
				<h6 class="widget-title mb-30">카테고리2</h6>
				<div class="widget-desc">
					<!-- 카테고리2 폼체크 -->
					<div class="form-check">
						<input class="form-check-input" type="checkbox" value=""
							id="amado"> <label class="form-check-label" for="amado">세부카테고리</label>
					</div>
				</div>
			</div>
		</div>

		<div class="amado_product_area section-padding-20">
			<div class="container-fluid">

				<div class="row" align="right">
					<div class="col-12">
						<div
							class="product-topbar d-xl-flex align-items-end justify-content-between">

							<div class="total-products"></div>

							<header class="header-area clearfix"> <!-- Cart Menu -->
							<div class="cart-fav-search mb-100">
								<a href="#" class="search-nav"><img
									src="img/core-img/search.png" alt=""> Search</a>
							</div>
							</header>
							<div class="product-sorting d-flex">
								<div class="sort-by-date d-flex align-items-center mr-15">
									<p>옵션</p>
									<form action="#" method="get">
										<select name="select" id="sortBydate">
											<option value="value">높은가격</option>
											<option value="value">낮은가격</option>
											<option value="value">인기순</option>
										</select>
									</form>
								</div>
								<div class="view-product d-flex align-items-center"></div>
							</div>
						</div>
					</div>
				</div>
				<form action="StoreProductListAction.st" method="post"
					enctype="multipart/form-data">
					<div class="row">

						<c:set var="loop" value="true" />
						<c:if test="${list.size() ne 0 }">
							<c:forEach var="i" begin="${p.beginPerPage }" step="1"
								end="${p.endPerPage}">
								<c:if test="${p.total == i }">
									<c:set var="loop" value="false" />
								</c:if>
								<c:if test="${loop }">
									<div class="col-12 col-sm-6 col-md-12 col-xl-6">
										<div class="single-product-wrapper">
											<!-- Product Image -->
											<div class="product-img">
												<img src="product_img_upload/${list[i].product_img}" alt="">
												<!-- Hover Thumb
                                <img class="hover-img" src="img/product-img/product2.jpg" alt="">  -->
											</div>

											<!-- Product Description -->
											<div
												class="product-description d-flex align-items-center justify-content-between">
												<div class="product-meta-data">
													<div class="line"></div>
													<p class="product-price">${list[i].product_price }</p>
													<a href="StoreProductDetail.st?product_num=${list[i].product_num}">
														<h6>${list[i].product_name}</h6>
													</a>
												</div>
											</div>
										</div>
									</div>
								</c:if>
							</c:forEach>
						</c:if>
					</div>
				</form>
				<%--  </c:forEach> --%>
			</div>
		</div>
	</div>

	<script src="template3/js/jquery/jquery-2.2.4.min.js"></script>
	<script src="template3/js/popper.min.js"></script>
	<script src="template3/js/bootstrap.min.js"></script>
	<script src="template3/js/plugins.js"></script>
	<script src="template3/js/active.js"></script>
</body>
</html>