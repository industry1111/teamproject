<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta charset="UTF-8">
<meta name="description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

<!-- Title  -->
<title>Amado - Furniture Ecommerce Template | Shop</title>

<!-- Favicon  -->
<link rel="icon" href="img/core-img/favicon.ico">

<!-- Core Style CSS -->
<link rel="stylesheet" href="css/core-style.css">
<link rel="stylesheet" href="style.css">

</head>

<body>

	<jsp:include page="../header.jsp"></jsp:include>

	<!-- Search Wrapper Area Start -->
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
	<!-- Search Wrapper Area End -->

	<!-- ##### Main Content Wrapper Start ##### -->
	<div class="main-content-wrapper d-flex clearfix">

		<!-- Mobile Nav (max width 767px)-->
		<div class="mobile-nav">
			<!-- Navbar Brand -->
			<div class="amado-navbar-brand">
				<a href="index.html"><img src="img/core-img/logo.png" alt=""></a>
			</div>
			<!-- Navbar Toggler -->
			<div class="amado-navbar-toggler">
				<span></span><span></span><span></span>
			</div>
		</div>

		<!-- Header Area End -->

		<div class="shop_sidebar_area">

			<!-- ##### Single Widget ##### -->
			<div class="widget catagory mb-50">
				<!-- Widget Title -->
				<div class="logo">
					<a href="index.html"> <img src="img/core-img/logo.png" alt=""></a>
				</div>
				<br>

				<h6 class="widget-title mb-30">카테고리</h6>

				<!--  Catagories  -->
				<div class="catagories-menu">
					<ul>
						<li class="active"><a href="#">Chairs</a></li>
				</div>
			</div>

			<!-- ##### Single Widget ##### -->
			<div class="widget brands mb-50">
				<!-- Widget Title -->
				<h6 class="widget-title mb-30">카테고리2</h6>

				<div class="widget-desc">

					<!-- Single Form Check -->

					<div class="form-check">
						<input class="form-check-input" type="checkbox" value=""
							id="amado"> <label class="form-check-label" for="amado">Amado</label>
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
								<a href="#" class="search-nav"><img src="img/core-img/search.png" alt=""> Search</a>
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
								<div class="view-product d-flex align-items-center">
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="row">

					<!-- Single Product Area -->
					<div class="col-12 col-sm-6 col-md-12 col-xl-6">
						<div class="single-product-wrapper">
							<!-- Product Image -->
							<div class="product-img">
								<img src="img/product-img/product1.jpg" alt="">
								<!-- Hover Thumb
                                <img class="hover-img" src="img/product-img/product2.jpg" alt="">  -->
							</div>

							<!-- Product Description -->
							<div
								class="product-description d-flex align-items-center justify-content-between">
								<!-- Product Meta Data -->
								<div class="product-meta-data">
									<div class="line"></div>
									<p class="product-price">상품가격</p>
									<a href="product-details.jsp">
										<h6>상품명</h6>
									</a>
								</div>
								</div>
							</div>
						</div>
					</div>
						</div>
					</div>
				</div>
			</div>
	<!-- ##### Main Content Wrapper End ##### -->

	<!-- ##### jQuery (Necessary for All JavaScript Plugins) ##### -->
	<script src="js/jquery/jquery-2.2.4.min.js"></script>
	<!-- Popper js -->
	<script src="js/popper.min.js"></script>
	<!-- Bootstrap js -->
	<script src="js/bootstrap.min.js"></script>
	<!-- Plugins js -->
	<script src="js/plugins.js"></script>
	<!-- Active js -->
	<script src="js/active.js"></script>

	<jsp:include page="../footer.jsp" />
</body>

>>>>>>> ff9bd9938c46f05410061d2f280d4a923da64edc:WebContent/templete5/shop.jsp
</html>