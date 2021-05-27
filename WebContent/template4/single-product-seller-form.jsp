<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">

							<title>탬플렛4-판매자 상품  업로드 페이지</title>

<link rel="icon" href="img/Fevicon.png" type="image/png">
<link rel="stylesheet" href="vendors/bootstrap/bootstrap.min.css">
<link rel="stylesheet" href="vendors/fontawesome/css/all.min.css">
<link rel="stylesheet" href="vendors/themify-icons/themify-icons.css">
<link rel="stylesheet" href="vendors/linericon/style.css">
<link rel="stylesheet" href="vendors/nice-select/nice-select.css">
<link rel="stylesheet"
	href="vendors/owl-carousel/owl.theme.default.min.css">
<link rel="stylesheet" href="vendors/owl-carousel/owl.carousel.min.css">

<link rel="stylesheet" href="css/style.css">
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<header class="header_area">
		<div class="main_menu">
			<nav class="navbar navbar-expand-lg navbar-light">
				<div class="container">
					<a class="navbar-brand logo_h" href="index.html"><img
						src="img/logo.png" alt=""></a>
					<button class="navbar-toggler" type="button" data-toggle="collapse"
						data-target="#navbarSupportedContent"
						aria-controls="navbarSupportedContent" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
				</div>
			</nav>
		</div>
	</header>

	<!--================상품등록 시작 =================-->
	
	<div class="product_image_area">
		<div class="container">
			<div class="row s_product_inner">
				<div class="col-lg-6">
					<div class="owl-carousel owl-theme s_Product_carousel">
						<div class="single-prd-item">
							<img class="img-fluid" src="img/category/s-p1.jpg" alt="">
						</div>
					</div>
				</div>
				<div class="col-lg-5 offset-lg-1">
					<div class="s_product_text">
						<h3>상품명  <input type="text" name="pname"> </h3>
						<h2>상품가격   <input type="text">   원</h2>
						<ul class="list">
							<li><a class="active" href="#"><span>카테고리</span> :
									<input type="text"> </a></li>
							<li><a href="#"><span>Availibility</span> :  <input type="text"></a></li>
						</ul>
						<p>상품정보 <br> <input type="text"></p>
						<div class="product_count">
							<label for="qty">물품 수량:</label>
							<button
								onclick="var result = document.getElementById('sst'); var sst = result.value; if( !isNaN( sst )) result.value++;return false;"
								class="increase items-count" type="button">
								<i class="ti-angle-left"></i>
							</button>
							<input type="text" name="qty" id="sst" size="2" maxlength="12"
								value="1" title="Quantity:" class="input-text qty">
						</div>
<!-- 						<div class="card_area d-flex align-items-center"> -->
<!-- 							<a class="icon_btn" href="#"><i class="lnr lnr lnr-diamond"></i></a> -->
<!-- 							<a class="icon_btn" href="#"><i class="lnr lnr lnr-heart"></i></a> -->
<!-- 						</div> -->
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--================상품등록 폼 끝. =================-->

	<!-- 상품등록, 취소 부분 시작  -->
	<section class="cart_area">
		<div class="container">
			<div class="cart_inner">
				<div class="table-responsive">
					<table class="table">
						<tbody>
							<tr class="out_button_area">
								<td class="d-none-l"></td>
								<td class=""></td>
								<td>
									<div class="checkout_btn_inner d-flex align-items-center">
										<!-- 상품등록을 취소하고 리스트 화면으로 돌아가기 -->
										<a class="gray_btn" href="shop_seller.jsp">상품 등록 취소</a> 
										<!-- 상품등록하기 -->
										<a class="primary-btn ml-2" href="">상품 등록</a>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</section>
	<!-- 상품등록, 취소 부분 끝 -->
	<!--================푸터부분 =================-->
	<jsp:include page="../footer.jsp"/>
	<!--================푸터 끝  =================-->
	<script src="vendors/jquery/jquery-3.2.1.min.js"></script>
	<script src="vendors/bootstrap/bootstrap.bundle.min.js"></script>
	<script src="vendors/skrollr.min.js"></script>
	<script src="vendors/owl-carousel/owl.carousel.min.js"></script>
	<script src="vendors/nice-select/jquery.nice-select.min.js"></script>
	<script src="vendors/jquery.ajaxchimp.min.js"></script>
	<script src="vendors/mail-script.js"></script>
	<script src="js/main.js"></script>
</body>
</html>