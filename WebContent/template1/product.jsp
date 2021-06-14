<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>템플릿 1 상세페이지 입니다.</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="apple-touch-icon" href="template1/assets/img/apple-icon.png">
<link rel="shortcut icon" type="image/x-icon"
	href="template1/assets/img/favicon.ico">
<link rel="stylesheet" href="template1/assets/css/bootstrap.min.css">
<link rel="stylesheet" href="template1/assets/css/templatemo.css">
<link rel="stylesheet" href="template1/assets/css/custom.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
<link rel="stylesheet" href="template1/assets/css/fontawesome.min.css">
<link rel="stylesheet" type="text/css"
	href="template1/assets/css/slick.min.css">
<link rel="stylesheet" type="text/css"
	href="template1/assets/css/slick-theme.css">

<script>
	var contextPath = "${pageContext.request.contextPath}";
</script>
</head>

<body>
	<nav class="navbar navbar-expand-lg navbar-light shadow">
	<div
		class="container d-flex justify-content-between align-items-center">
		<a class="navbar-brand text-success logo h1 align-self-center"
			href="StoreProductListAction.st?store_num=${pdto.store_num}">${pdto.store_name}</a>

		<button class="navbar-toggler border-0" type="button"
			data-bs-toggle="collapse" data-bs-target="#templatemo_main_nav"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div
			class="align-self-center collapse navbar-collapse flex-fill  d-lg-flex justify-content-lg-between"
			id="templatemo_main_nav">
			<div class="flex-fill">
				<ul class="nav navbar-nav d-flex justify-content-between mx-lg-auto">
					<li class="nav-item"></li>
				</ul>
			</div>
			<div class="navbar align-self-center d-flex">
				<div class="d-lg-none flex-sm-fill mt-3 mb-4 col-7 col-sm-auto pr-3">
					<div class="input-group">
						<input type="text" class="form-control" id="inputMobileSearch"
							placeholder="Search ...">
						<div class="input-group-text">
							<i class="fa fa-fw fa-search"></i>
						</div>
					</div>
				</div>
				<a href="StoreProductListAction.st?store_num=${pdto.store_num}">
					목록으로가기 </a>
			</div>
		</div>

	</div>
	</nav>
	<!-- Close Header -->



	<!-- Open Content -->
	<section class="bg-light">
	<form name="newProduct" action="StoreProductDetail.st"
		class="form-horizontal" method="post" enctype="multipart/form-data">
		<div class="container pb-5">
			<div class="row">
				<div class="col-lg-5 mt-5">
					<div class="row" align="center">
						<img class="card-img img-fluid"
							src="product_img_upload/${pdto.product_img}" alt="">
					</div>
				</div>

				<div class="col-lg-7 mt-5">
					<div class="card">
						<div class="card-body" align="center" style="margin-top: 30px;">
							<h1 class="h2">${pdto.product_name}</h1>
							<p class="h3 py-2">${pdto.product_price}원</p>
							<p style="color: #59ab6e; font-size: 30px;">${pdto.product_brand}</p>
						</div>

						<div class="row">
							<div align="center">
								<li class="list-inline-item text-right" align="center">수량</li> <input
									type="number" id="quantity" step="1" min="1" max="${pdto.product_count}"
									name="quantity" value="1" 
									style="text-align: right; margin-right: 20px;"> <input
									value="${pdto.product_num}" type="hidden" name="product_num"
									id="product_num" />
								<button type="button" class="btn btn-success btn-lg"
									id="addbasket">장바구니 담기</button>
							</div>
						</div>
						<p style="margin : 30px;">${pdto.product_description}</p>
					</div>
				</div>
			</div>
		</div>
	</form>
	</section>

	<script src="template1/assets/js/jquery-1.11.0.min.js"></script>
	<script src="template1/assets/js/jquery-migrate-1.2.1.min.js"></script>
	<script src="template1/assets/js/bootstrap.bundle.min.js"></script>
	<script src="template1/assets/js/templatemo.js"></script>
	<script src="template1/assets/js/custom.js"></script>
	<script src="js/addbasket.js"></script>

	<!-- 슬라이드 start 넣을꺼면 하고 남겨둠!  -->
	<script src="template1/assets/js/slick.min.js"></script>
	<script>
		$('#carousel-related-product').slick({
			infinite : true,
			arrows : false,
			slidesToShow : 4,
			slidesToScroll : 3,
			dots : true,
			responsive : [ {
				breakpoint : 1024,
				settings : {
					slidesToShow : 3,
					slidesToScroll : 3
				}
			}, {
				breakpoint : 600,
				settings : {
					slidesToShow : 2,
					slidesToScroll : 3
				}
			}, {
				breakpoint : 480,
				settings : {
					slidesToShow : 2,
					slidesToScroll : 3
				}
			} ]
		});
	</script>
</body>

</html>