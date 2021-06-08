<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<title>탬플렛5의 상품상세페이지</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Mukta:300,400,700">
<link rel="stylesheet" href="template5/fonts/icomoon/style.css">
<link rel="stylesheet" href="template5/css/bootstrap.min.css">
<link rel="stylesheet" href="template5/css/magnific-popup.css">
<link rel="stylesheet" href="template5/css/jquery-ui.css">
<link rel="stylesheet" href="template5/css/owl.carousel.min.css">
<link rel="stylesheet" href="template5/css/owl.theme.default.min.css">
<link rel="stylesheet" href="template5/css/aos.css">
<link rel="stylesheet" href="template5/css/style.css">

<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<script src="js/product_img.js"></script>
<script src="js/seller.js"></script>
<script src="js/category.js"></script>

<script>
	var contextPath = "${pageContext.request.contextPath}";
</script>
</head>
<body>

	<div class="site-wrap">
		<header class="site-navbar" role="banner">
		<div class="site-navbar-top">
			<div class="container">
				<div class="row align-items-center">

					<div
						class="col-6 col-md-4 order-2 order-md-1 site-search-icon text-left">
						<form action="" class="site-block-top-search">
							<span class="icon icon-search2"></span> <input type="text"
								class="form-control border-0" placeholder="Search">
						</form>
					</div>
		
					<div
						class="col-12 mb-3 mb-md-0 col-md-4 order-1 order-md-2 text-center">
						<div class="site-logo">
							<a href="index.html" class="js-logo-clone">${pdto.store_name}</a>
						</div>
					</div>

					<div class="col-6 col-md-4 order-3 order-md-3 text-right">
						<div class="site-top-icons">
							<ul>
								<li><a href="#"><span class="icon icon-person"></span></a></li>
								<li><a href="#"><span class="icon icon-heart-o"></span></a></li>
								<li><a href="cart.html" class="site-cart"> <span
										class="icon icon-shopping_cart"></span> <span class="count">2</span>
								</a></li>
								<li class="d-inline-block d-md-none ml-md-0"><a href="#"
									class="site-menu-toggle js-menu-toggle"><span
										class="icon-menu"></span></a></li>
							</ul>
						</div>
					</div>

				</div>
			</div>
		</div>
		</header>
	<form name="newProduct" action="StoreProductDetail.st"
			class="form-horizontal" method="post" enctype="multipart/form-data">
		<div class="bg-light py-3">
			<div class="container">
				<div class="row">
					<div class="col-md-12 mb-0">
						<a href="index.html">카테고리표시</a> <span class="mx-2 mb-0">/</span> <strong
							class="text-black">카테고리표시</strong>
					</div>
				</div>
			</div>
		</div>

		
			<div class="site-section">
				<div class="container">
					<div class="row">
						<div class="col-md-6">
							<img src="product_img_upload/${pdto.product_img}" alt="Image"
								class="img-fluid">
						</div>
						<div class="col-md-6">
							<h2 class="text-black">${pdto.product_name}</h2>
							<p>${pdto.product_description}</p>
							<p class="mb-4">${pdto.product_brand}</p>
							<p>
								<strong class="text-primary h4">${pdto.product_price}</strong>
							</p>
							<div class="mb-1 d-flex">
								<label for="option-sm" class="d-flex mr-3 mb-3"> <span
									class="d-inline-block mr-2"
									style="top: -2px; position: relative;"><input
										type="radio" id="option-sm" name="shop-sizes"></span> <span
									class="d-inline-block text-black">옵션1</span>
								</label> <label for="option-md" class="d-flex mr-3 mb-3"> <span
									class="d-inline-block mr-2"
									style="top: -2px; position: relative;"><input
										type="radio" id="option-md" name="shop-sizes"></span> <span
									class="d-inline-block text-black">옵션2</span>
								</label> <label for="option-lg" class="d-flex mr-3 mb-3"> <span
									class="d-inline-block mr-2"
									style="top: -2px; position: relative;"><input
										type="radio" id="option-lg" name="shop-sizes"></span> <span
									class="d-inline-block text-black">옵션3</span>
								</label> <label for="option-xl" class="d-flex mr-3 mb-3"> <span
									class="d-inline-block mr-2"
									style="top: -2px; position: relative;"><input
										type="radio" id="option-xl" name="shop-sizes"></span> <span
									class="d-inline-block text-black">옵션4</span>
								</label>
							</div>
							<div class="mb-5">
								<div class="input-group mb-3" style="max-width: 120px;">
									<div class="input-group-prepend">
										<button class="btn btn-outline-primary js-btn-minus"
											type="button">&minus;</button>
									</div>
									<input type="text" class="form-control text-center" value="1"
										placeholder="" aria-label="Example text with button addon"
										aria-describedby="button-addon1">
									<div class="input-group-append">
										<button class="btn btn-outline-primary js-btn-plus"
											type="button">&plus;</button>
									</div>
								</div>

							</div>
							<p>
								<a href="cart.html" class="buy-now btn btn-sm btn-primary">Add
									To Cart</a>
							</p>
						</div>

					</div>
					<p>
						<a href="StoreProductListAction.st?store_num=${pdto.store_num}"
							class="buy-now btn btn-sm btn-primary">목록으로</a>
					</p>
				</div>

			</div>
		</form>
	</div>
	

	<script src="template5/js/jquery-3.3.1.min.js"></script>
	<script src="template5/js/jquery-ui.js"></script>
	<script src="template5/js/popper.min.js"></script>
	<script src="template5/js/bootstrap.min.js"></script>
	<script src="template5/js/owl.carousel.min.js"></script>
	<script src="template5/js/jquery.magnific-popup.min.js"></script>
	<script src="template5/js/aos.js"></script>
	<script src="template5/js/main.js"></script>

</body>
</html>