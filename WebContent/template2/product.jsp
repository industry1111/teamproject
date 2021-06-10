<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>템플렛2번 상세페이지입니다.</title>
<link
	href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700"
	rel="stylesheet">
<link type="text/css" rel="stylesheet"
	href="template2/css/bootstrap.min.css" />
<link type="text/css" rel="stylesheet" href="template2/css/slick.css" />
<link type="text/css" rel="stylesheet"
	href="template2/css/slick-theme.css" />
<link type="text/css" rel="stylesheet"
	href="template2/css/nouislider.min.css" />
<link rel="stylesheet" href="template2/css/font-awesome.min.css">
<link type="text/css" rel="stylesheet" href="template2/css/style.css" />

<script>
	var contextPath = "${pageContext.request.contextPath}";
</script>
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
							<a href="StoreProductListAction.st?store_num=${pdto.store_num}">
									<h3><font color="#FFF">${pdto.store_name}</font></h3>
							</a>
						</div>
					</div>
					<!-- /LOGO -->
				</div>
			</div>
			<!-- /ACCOUNT -->
		</div>
	</header>

	<!-- 상품내용-->
	<form name="newProduct" action="StoreProductDetail.st"
		class="form-horizontal" method="post" enctype="multipart/form-data">
		<div class="section">
			<!-- container -->
			<div class="container pb-5">
				<!-- row -->
				<div class="row">
					<!-- 상품상세보기시작 -->
						<div class="col-lg-5 mt-5">
							<div class="row">
								<img src="product_img_upload/${pdto.product_img}" alt="">
							</div>
						</div>

						<div class="col-lg-7 mt-5">
							<div class="product-details">
								<h1>${pdto.product_name}</h1>
								<div>
									<h3 class="product-price">${pdto.product_price}원</h3>
								</div>
								
								<p> ${pdto.product_brand } </p>
								
								<div>
								
								</div>
									<p> ${pdto.product_description}</p>
								
								<div class="add-to-cart">
									<div class="qty-label">
										수량
										<div class="input-number">
											<input type="number" value="1"> <span class="qty-up">+</span> <span
												class="qty-down">-</span>
										</div>
									</div>
									<button class="add-to-cart-btn">
										<i class="fa fa-shopping-cart"></i>장바구니추가하기
									</button>
									<br><br>
										<div>
									<a type="button" class="primary-btn" href="StoreProductListAction.st?store_num=${pdto.store_num}">
												<font color="#FFF">상품목록으로가기 </font>
									</a>
									</div>
								</div>
							</div>
						</div>
						<!-- 상품상세보기 끝 -->
					</div>
				</div>
			</div>
		</div>
	</form>


	<script src="template2/js/jquery.min.js"></script>
	<script src="template2/js/bootstrap.min.js"></script>
	<script src="template2/js/slick.min.js"></script>
	<script src="template2/js/nouislider.min.js"></script>
	<script src="template2/js/jquery.zoom.min.js"></script>
	<script src="template2/js/main.js"></script>

</body>
</html>