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

<script src="js/addbasket.js"></script>

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
								<h1>
									<font color="#BDBDBD">${pdto.store_name}</font>
								</h1>
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
							<img src="product_img_upload/${pdto.product_img}" width="450" height="300" alt="">
						</div>
					</div>

					<div class="col-lg-7 mt-5">
						<div class="product-details">
							<div align="center">
								<h1>${pdto.product_name}  </h1>
								<div align="center" >
									 <h5><font color="#5D5D5D">${pdto.product_brand }</font></h5> 
								</div>
							</div>
									<div align="center">
										<h3 class="product-price">${pdto.product_price}원</h3>
									</div>
							<div class="add-to-cart" align="center">
								<div style="margin-left: 30px;">
									
										수량  <input type="number" id="quantity" step="1" min="1" max="300" name="quantity" value="1" style="text-align: right;">
									
									
										<input value="${pdto.product_num}" type="hidden" name="product_num" id="product_num" />
										<button class="add-to-cart-btn" type="button" id="addbasket" style="margin-left: 10px;" >
											장바구니추가하기
										</button>
									
									</div>
								</div>

							<div 
									style="height: auto; width: auto; margin-top: 20px;">
									<p>${pdto.product_description}</p>
							</div>


								<div align="right" style="margin-top: 100px;">
									<a type="button" class="primary-btn"
										href="StoreProductListAction.st?store_num=${pdto.store_num}">
										<font color="#FFF">상품목록으로가기 </font>
									</a>
								</div>
							</div>
						</div>
					</div>
					<!-- 상품상세보기 끝 -->
					<!-- 상품 리뷰  -->
					<div class="row">
						<div class="col-md-12">
							<hr>
							<h3>상품 리뷰</h3>
							<div class="row" style="margin-top: 30px; background-color:#f7fafc; height:300px;" align="center">
								<div class="col-md-4" style="margin-top: 30px;">
									사용자 총 평점
								</div>
								<div class="col-md-4" style="margin-top: 30px;">
									전체 리뷰 수
								</div>
								<div class="col-md-4" style="margin-top: 30px;">
									평점 비율
								</div>
							</div>
							<div class="row" style="margin-top: 30px; height: 70px; border: 1px solid gray;" >
								<div class="col-md-12" style="margin-top: 20px;">
									<ul >
										<a href="#"><li style="float: left;" >전체()</li></a>
										<a href="#"><li style="float: left; margin-left: 180px;">5점()</li></a>
										<a href="#"><li style="float: left; margin-left: 180px;">4점()</li></a>
										<a href="#"><li style="float: left; margin-left: 180px;">3점()</li></a>
										<a href="#"><li style="float: left; margin-left: 180px;">2점()</li></a>
										<a href="#"><li style="float: left; margin-left: 180px;">1점()</li></a>
									</ul>
								</div>
							</div>
							<c:forEach var="i" begin="0" step="1" end="5">
								<div class="row" style="margin-top: 40px;">
									<div class="col-md-10">
										별점/숫자<br>
										아이디(앞4글자+****)/리뷰 등록날짜
									</div>
									<div class="col-md-2">
										답변달기
									</div>
								</div>
								<div class="row" style="margin-top: 10px;">
									<div class="col-md-8">
										리뷰내용
									</div>
									<div class="col-md-2 offset-2">
										<img alt="" src="" width="100%" height="150px;">
									</div>
								</div>
								<div class="row">
									<div class="col-md-5">
										판매자/답변등록일
									</div>
								</div>
								<div class="row">
									<div class="col-md-12">
										판매자 답변
									</div>
								</div>
								<hr>
						</c:forEach>
					</div>
				</div>
				<!-- Q&A  -->
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