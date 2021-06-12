<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>템플렛4번 상세페이지입니다.</title>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link
	href="https://fonts.googleapis.com/css?family=Montserrat:300,400,500,600,700"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Rokkitt:100,300,400,700"
	rel="stylesheet">


<link rel="stylesheet" href="template4/css/animate.css">
<link rel="stylesheet" href="template4/css/icomoon.css">
<link rel="stylesheet" href="template4/css/ionicons.min.css">
<link rel="stylesheet" href="template4/css/bootstrap.min.css">
<link rel="stylesheet" href="template4/css/magnific-popup.css">
<link rel="stylesheet" href="template4/css/flexslider.css">
<link rel="stylesheet" href="template4/css/owl.carousel.min.css">
<link rel="stylesheet" href="template4/css/owl.theme.default.min.css">
<link rel="stylesheet" href="template4/css/bootstrap-datepicker.css">
<link rel="stylesheet" href="template4/fonts/flaticon/font/flaticon.css">
<link rel="stylesheet" href="template4/css/style.css">

<script>
	var contextPath = "${pageContext.request.contextPath}";
</script>

<script src="js/addbasket.js"></script>
</head>
<body>

	<!-- 상품 메인 페이지 부분 -->
	<div class="colorlib-product">
		<div class="container">
			<form name="newProduct" action="StoreProductDetail.st"
				class="form-horizontal" method="post" enctype="multipart/form-data">
				<div class="row row-pb-lg product-detail-wrap">
					<div class="col-sm-5">
<!-- 						<div class="owl-carousel"> -->
<!-- 							<div class="item"> -->
								<div >
<!-- 									<a href="#" class="prod-img">  -->
									<img
										src="product_img_upload/${pdto.product_img}" class="img-fluid"
										alt="">
<!-- 									</a> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 														<div class="item"> -->
<!-- 															<div class="product-entry border"> -->
<!-- 																<a href="#" class="prod-img"> -->
<!-- 																	<img src="images/item-2.jpg" class="img-fluid" alt="Free html5 bootstrap 4 template"> -->
<!-- 																</a> -->
<!-- 															</div> -->
<!-- 														</div> -->
							<!-- 							<div class="item"> -->
							<!-- 								<div class="product-entry border"> -->
							<!-- 									<a href="#" class="prod-img"> -->
							<!-- 										<img src="images/item-3.jpg" class="img-fluid" alt="Free html5 bootstrap 4 template"> -->
							<!-- 									</a> -->
							<!-- 								</div> -->
							<!-- 							</div> -->
							<!-- 							<div class="item"> -->
							<!-- 								<div class="product-entry border"> -->
							<!-- 									<a href="#" class="prod-img"> -->
							<!-- 										<img src="images/item-4.jpg" class="img-fluid" alt="Free html5 bootstrap 4 template"> -->
							<!-- 									</a> -->
							<!-- 								</div> -->
							<!-- 							</div> -->
						</div>
					</div>
					<div class="col-sm-4">
						<div class="product-desc">
							<h3>${pdto.product_name}</h3>
								<h4 class="price">
									<span>${pdto.product_price} 원</span>
								</h4>
							<p>${pdto.product_brand }</p>
							<p>${pdto.product_description}</p>
							<div class="size-wrap"></div>
							<div class="input-group mb-4">
								구매수량	<input type="number" class="qty-text" id="quantity" step="1" min="1" max="300" name="quantity" value="1" style="text-align: right; margin-left: 20px;">
							</div>
							<div class="row" align="center">
								<div class="col-sm-12 text-center">
									<p class="addtocart">
										<input value="${pdto.product_num}" type="hidden" name="product_num" id="product_num" />
										<button type="button" id="addbasket" class="btn btn-primary btn-addtocart" style="margin-bottom: 20px;">장바구니 담기</button>
									</p>
								</div>
								<div>
									<a style="margin-left: 15px;" class="btn btn-primary" href="StoreProductListAction.st?store_num=${pdto.store_num}">상품목록으로 가기</a>
								</div>
								
							</div>
						</div>
					</div>
				</div>
			</form>	
				<div class="row">
					<div class="col-sm-12">
						<div class="row">
							<div class="col-md-12 pills">
								<div class="bd-example bd-example-tabs">
									<ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
										<li class="nav-item"><a class="nav-link"
											id="pills-review-tab" data-toggle="pill" href="#pills-review"
											role="tab" aria-controls="pills-review" aria-expanded="true">리뷰</a>
										</li>
									</ul>
										<div class="tab-pane border fade" id="pills-review"
											 aria-labelledby="pills-review-tab">
											<div class="row">
												<div class="col-md-8">
													<h3 class="head">리뷰</h3>
													<div class="review">
														<div class="user-img"
															style="background-image: url(images/person1.jpg)"></div>
														<div class="desc">
															<h4>
																<span class="text-left">리뷰작성자</span> <span
																	class="text-right">리뷰작성일</span>
															</h4>
															<p class="star">
																별점부분
																<span> <i class="icon-star-full"></i> <i
																	class="icon-star-full"></i> <i class="icon-star-full"></i>
																	<i class="icon-star-half"></i> <i
																	class="icon-star-empty"></i>
																</span> <span class="text-right"><a href="#"
																	class="reply"><i class="icon-reply"></i></a></span>
															</p>
															<p>리뷰작성부분입니다.</p>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
		</div>

	<script src="template4/js/jquery.min.js"></script>
	<script src="template4/js/popper.min.js"></script>
	<script src="template4/js/bootstrap.min.js"></script>
	<script src="template4/js/jquery.easing.1.3.js"></script>
	<script src="template4/js/jquery.waypoints.min.js"></script>
	<script src="template4/js/jquery.flexslider-min.js"></script>
	<script src="template4/js/owl.carousel.min.js"></script>
	<script src="template4/js/jquery.magnific-popup.min.js"></script>
	<script src="template4/js/magnific-popup-options.js"></script>
	<script src="template4/js/bootstrap-datepicker.js"></script>
	<script src="template4/js/jquery.stellar.min.js"></script>
	<script src="template4/js/main.js"></script>


</body>
</html>