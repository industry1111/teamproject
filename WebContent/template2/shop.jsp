<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>템플렛2번입니다.</title>
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
</head>
<body>

	<form action="StoreProductListAction.st" method="post"
		enctype="multipart/form-data">
		<!-- 상단베너 시작 -->
		<header>
			<!-- TOP HEADER -->

			<!-- /TOP HEADER -->

			<!-- MAIN HEADER -->
			<div id="header">
				<!-- container -->
				<div class="container">
					<!-- row -->
					<div class="row">
						<!-- LOGO -->
						<div class="col-md-3">
							<div class="header-logo">
								<h1>
									<font color="#BDBDBD">${list[1].store_name}</font>
								</h1>
							</div>
						</div>
	
					</div>
				</div>
			</div>
		</header>

		<!-- SECTION -->
		<div class="section">
			<!-- container -->
			<div class="container">
				<!-- row -->
				<div class="row">
					<!-- ASIDE -->
					<div id="aside" class="col-md-3">

						<!-- 카테고리1끝 -->


						<!-- 카테고리2 -->
						<div class="aside">
							<h2 class="aside-title" style="font-size: 30px;">브랜드</h2>
							<div class="checkbox-filter">
								<div class="input-checkbox">
									</a>
									<c:set var="loop" value="true" />
									<c:if test="${blist.size() ne 0 }">
										<c:forEach var="i" begin="0" step="1" end="${blist.size()-1 }">
											<c:if test="${p.total == i }">
												<c:set var="loop" value="false" />
											</c:if>
											<c:if test="${loop}">
												<div>
													<label for="brand-1"> <span></span>
													<a	href="./BrandProductAction.st?store_num=${store_num}&brand=${blist[i].brand_name}"><h4>${blist[i].brand_name}(${blist[i].count })</h4></a>
													</label>
												</div>
											</c:if>
										</c:forEach>
									</c:if>
								</div>
							</div>
						</div>

					</div>
					<!-- /ASIDE -->

					<!-- STORE -->
					<div id="store" class="col-md-9">
						<!-- 카테고리2끝 -->

						<!-- 상품리스트 -->

						<div class="row">
							<c:set var="loop" value="true" />
							<c:if test="${list.size() ne 0 }">
								<c:forEach var="i" begin="${p.beginPerPage }" step="1"
									end="${p.endPerPage}">
									<c:if test="${p.total == i }">
										<c:set var="loop" value="false" />
									</c:if>
									<c:if test="${loop }">
										<div class="col-md-4 col-xs-6">
											<div class="product">
												<div class="product-img">
													<img src="product_img_upload/${list[i].product_img}"
														width="200px" height="200px" alt="">
													<div class="product-label"></div>
												</div>
												<div class="product-body">
													<p class="product-category">${list[i].category_name }</p>
													<h3 class="product-name">${list[i].product_name}</h3>
													<h4 class="product-price">${list[i].product_price}원</h4>
												</div>
												<div class="add-to-cart">
													<a
														href="StoreProductDetail.st?product_num=${list[i].product_num}"
														type="button">
														<h3>
															<font color="#BDBDBD"> 상품 상세보기 </font>
														</h3>
													</a>
												</div>
											</div>
										</div>
									</c:if>
								</c:forEach>
							</c:if>
						</div>
					</div>
				</div>
				<div class="row" style="margin-top: 40px;">
					<div class="col-md-7 offset-4 paging" style="height: 120px;">
					<div class="text-center">
						<ul class="pagination justify-content-center">
							<c:if test="${p.prev }">
								<li class="page-item previous"><a class="page-link"
									onclick="paging(${p.startPage-1 });">Previous</a></li>
							</c:if>
							<c:forEach var="num" begin="${p.startPage }" step="1"
								end="${p.endPage }">
								<li class="page-item"><a class="page-link"
									${p.cri.nowPage == num ? 'style="color:red;border-color:black"':''}
									href="StoreProductListAction.st?store_num=${list[1].store_num}&nowPage=${num}&page='true'">${num}</a></li>
							</c:forEach>
							<c:if test="${p.next }">
								<li class="page-item next"><a class="page-link"
									href="StoreProductListAction.st?store_num=${list[1].store_num}&nowPage=${p.endPage + 1 }&page='true'">Next</a></li>
							</c:if>
						</ul>
						</div>
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
