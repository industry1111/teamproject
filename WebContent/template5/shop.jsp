<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>템플렛 5입니다.</title>

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

</head>
<body>
	<!--================ Start Header Menu Area =================-->
	<div class="site-wrap">
		<div class="bg-light py-3">
			<div class="container">
				<div class="row">
					<div class="col-md-12 mb-0">
						<h2>
							<font color="#7971ea">${ list[1].store_name}</font>
						</h2>
					</div>
				</div>
			</div>
		</div>
		<!-- 상품시작 -->
		<form action="StoreProductListAction.st" method="post"
			enctype="multipart/form-data">
			<div class="site-section">
				<div class="container">
					<div class="row mb-5">
						<div class="col-md-9 order-2">
							<div class="row mb-5">

								<c:set var="loop" value="true" />
								<c:if test="${list.size() ne 0 }">
									<c:forEach var="i" begin="${p.beginPerPage }" step="1"
										end="${p.endPerPage}">
										<c:if test="${p.total == i }">
											<c:set var="loop" value="false" />
										</c:if>
										<c:if test="${loop }">
											<div class="col-sm-6 col-lg-4 mb-4" data-aos="fade-up">
												<div class="block-4 text-center border">
													<figure class="block-4-image"> <a
														href="StoreProductDetail.st?product_num=${list[i].product_num}">
														<img src="product_img_upload/${list[i].product_img}"
														alt="Image placeholder" width="250" height="250">
													</a> </figure>
													<div class="block-4-text p-4" style="height: 160px;">
														<h3>
															<a
																href="StoreProductDetail.st?product_num=${list[i].product_num}">${list[i].product_name}</a>
														</h3>
														<p class="mb-0">${list[i].product_brand }</p>
														<p class="text-primary font-weight-bold">${list[i].product_price}
															원</p>
													</div>
												</div>
											</div>
										</c:if>
									</c:forEach>
								</c:if>

							</div>
							<!-- /row md-5 -->
						</div>
						<!-- /md-9 order-2 -->

						<!-- category start -->
						<div class="border p-4 rounded mb-4">
							
							<div class="mb-4">
								<h3 class="mb-3 h6 text-uppercase text-black d-block">브랜드</h3>
								<c:if test="${blist.size() ne 0 }">
									<c:forEach var="i" begin="0" step="1" end="${blist.size()-1 }">
										<div>
											<span
												class="bg-danger color d-inline-block rounded-circle mr-2"></span>
											<span class="text-black"> <a href="./BrandProductAction.st?store_num=${store_num}&brand=${blist[i].brand_name}">
													${blist[i].brand_name}(${blist[i].count }) </a>
											</span>
										</div>
									</c:forEach>
								</c:if>
							</div>
						</div>
						<!-- /category -->
					</div>
					<!-- /row md-5 -->
					<div class="row">
						<div class="col-md-5 offset-4 paging" style="height: 120px;">
							<ul class="pagination justify-content-center">
								<c:if test="${p.prev }">
									<li class="page-item previous"><a class="page-link"
										onclick="paging(${p.startPage-1 });">Previous</a></li>
								</c:if>
								<c:forEach var="num" begin="${p.startPage }" step="1"
									end="${p.endPage }">
									<li class="page-item"><a class="page-link"
										${p.cri.nowPage == num ? 'style="color:red;border-color:black"':''}
										href="StoreProductListAction.st?store_num=${list[1].store_num}&nowPage=${num}">${num}</a></li>
								</c:forEach>
								<c:if test="${p.next }">
									<li class="page-item next"><a class="page-link"
										href="StoreProductListAction.st?store_num=${list[1].store_num}&nowPage=${num}">Next</a></li>
								</c:if>
							</ul>
						</div>
					</div>

				</div>
				<!-- /container -->
			</div>
			<!-- /site session -->
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