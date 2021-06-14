<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<style>

.star-rating {
  border:none;
  display:flex;
  flex-direction: row-reverse;
  font-size:0.8em;
  justify-content:space-around;
  padding:0 .2em;
  text-align:center;
  width:5em;
  
}

.star-rating input {
  display:none;
}

.star-rating label {
  color:#ccc;
  cursor:pointer;
}

.star-rating :checked ~ label {
  color:#f90;
}

</style>
</head>
<body>

	<!-- 상품 메인 페이지 부분 -->
	<div class="colorlib-product" >
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
				
				<!-- 상품 리뷰가 없을때  -->
				
				<div class="row">
					<div class="col-md-12" >
						<hr>
						<c:if test="${rvlist.size() eq 0 || rvlist.size() eq null}">
							<h3>상품 리뷰</h3>
						<div class="row"
							style="margin-top: 30px; background-color: #f7fafc; height: 300px;"
							align="center">
							<div class="col-md-4" style="margin-top: 30px;">
								<div class="row" align="center">
									<div class="col-md-12">
										상품 총 평점
									</div>
								</div>
								<div class="star-rating" style="margin-top: 40px; font-size: 2.5em;">
										<c:forEach var="s" begin="1" step="1" end="5">
										<c:if test="${0 != 6-s }">
											<input type="radio" id="${6-s }-stars"
												name="rating" value="${6-s }" disabled />
											<label for="${6-s }-stars" class="star">&#9733;</label>
										</c:if>
										<c:if test="${0 == 6-s }">
											<input type="radio" id="${6-s }-stars"
												name="rating" value="${6-s }" checked disabled />
											<label for="${6-s }-stars" class="star">&#9733;</label>
										</c:if>
									</c:forEach>
								</div>
								<h2>0/<span style="color: #E1E1E1;">5</span></h2>
							</div>
							<div class="col-md-4" style="margin-top: 30px;">
								<div class="row">
									<div class="col-md-12">
										전체 리뷰수
									</div>
								</div>
								<div class="row">
									<div class="col-md-12" style="margin-top: 45px;">
										<img src="${pageContext.request.contextPath}/images/review.png" width="20%">
									</div>
								</div>
								<div class="row">
									<div class="col-md-12" align="center">
										<h2>0</h2>									
									</div>
								</div>
							</div>
							<div class="col-md-4" style="margin-top: 30px;">평점 비율</div>
						</div>
						</c:if>
						<!-- 상품리뷰가 없을때 끝 -->
						<!-- 상품리뷰가  있을 때 시작 -->
						<c:if test="${rvlist.size() > 0 }">
						<h3>상품 리뷰</h3>
						<div class="row"
							style="margin-top: 30px; background-color: #f7fafc; height: 300px;"
							align="center">
							<div class="col-md-4" style="margin-top: 30px;">
								<div class="row" align="center">
									<div class="col-md-12">
										상품 총 평점
									</div>
								</div>
								<c:forEach var="rv" items="${rvlist }">
									<c:set var="total" value="${total+(rv.rating1+rv.rating2+rv.rating3)/3}"/>
								</c:forEach>
								<div class="star-rating" style="margin-top: 40px; font-size: 2.5em;">
								<fmt:formatNumber var="total_rating"	value="${total/rvlist.size()}" pattern="0" />
										<c:forEach var="s" begin="1" step="1" end="5">
										<c:if test="${total_rating != 6-s }">
											<input type="radio" id="${6-s }-stars"
												name="rating${i }" value="${6-s }" disabled />
											<label for="${6-s }-stars" class="star">&#9733;</label>
										</c:if>
										<c:if test="${total_rating == 6-s }">
											<input type="radio" id="${6-s }-stars"
												name="rating${i }" value="${6-s }" checked disabled />
											<label for="${6-s }-stars" class="star">&#9733;</label>
										</c:if>
									</c:forEach>
								</div>
								<h2><fmt:formatNumber value="${total/rvlist.size()}" pattern="0.0" />/<span style="color: #E1E1E1;">5</span></h2>
							</div>
							<div class="col-md-4" style="margin-top: 30px;">
								<div class="row">
									<div class="col-md-12">
										전체 리뷰수
									</div>
								</div>
								<div class="row">
									<div class="col-md-12" style="margin-top: 45px;">
										<img src="${pageContext.request.contextPath}/images/review.png" width="20%">
									</div>
								</div>
								<div class="row">
									<div class="col-md-12" align="center">
										<h2>${rvlist.size() }</h2>									
									</div>
								</div>
							</div>
							<div class="col-md-4" style="margin-top: 30px;">평점 비율</div>
						</div>
						</c:if>
						<div class="row"
							style="margin-top: 30px; height: 70px; border: 1px solid gray;">
							<div class="col-md-12" style="margin-top: 20px;">
								<ul>
									<a href="#"><li style="float: left;">전체()</li></a>
									<a href="#"><li style="float: left; margin-left: 180px;">5점()</li></a>
									<a href="#"><li style="float: left; margin-left: 180px;">4점()</li></a>
									<a href="#"><li style="float: left; margin-left: 180px;">3점()</li></a>
									<a href="#"><li style="float: left; margin-left: 180px;">2점()</li></a>
									<a href="#"><li style="float: left; margin-left: 180px;">1점()</li></a>
								</ul>
							</div>
						</div>
						<c:if test="${rvlist.size() eq 0 || rvlist.size() eq null}">
							<div class="row">
								<div class="col-md-12">
									작성된 리뷰가 없습니다.
								</div>
							</div>
						</c:if>
						<c:set var="loop" value="true" />
						<c:if test="${rvlist.size() > 0 }">
						<c:forEach var="i" begin="${p.beginPerPage }" step="1"
							end="${p.endPerPage}">
							<c:if test="${p.total == i }">
								<c:set var="loop" value="false" />
							</c:if>
							<c:if test="${loop }">
									<div class="row" style="margin-top: 40px;">
										<fmt:formatNumber var="rating"	value="${(rvlist[i].rating1+rvlist[i].rating2+rvlist[i].rating3)/3}" pattern="0.0" />
										<div class="col-md-10">
											<div class="star-rating">
											/${rating }
											<fmt:formatNumber var="rating"	value="${(rvlist[i].rating1+rvlist[i].rating2+rvlist[i].rating3)/3}" pattern="0" />
												<c:forEach var="s" begin="1" step="1" end="5">
													<c:if test="${rating != 6-s }">
														<input type="radio" id="${6-s }-stars"
															name="rating${i }" value="${6-s }" disabled />
														<label for="${6-s }-stars" class="star">&#9733;</label>
													</c:if>
													<c:if test="${rating == 6-s }">
														<input type="radio" id="${6-s }-stars"
															name="rating${i }" value="${6-s }" checked disabled />
														<label for="${6-s }-stars" class="star">&#9733;</label>
													</c:if>
												</c:forEach>
											</div>
										</div>
										<div class="col-md-2">답변달기</div>
									</div>
									<div class="row">
										<div class="col-md-12">
											(${fn:substring(rvlist[i].id,0,4) }****)/<fmt:formatDate value="${rvlist[i].regdate }"/>
										</div>
									</div>
									<div class="row" style="margin-top: 10px;">
										<div class="col-md-8">
											${rvlist[i].review_content }
										</div>
										<div class="col-md-2 offset-2">
											<img alt="" src="upload_review/${rvlist[i].review_img}" width="100%" height="150px;">
										</div>
									</div>
									<div class="row">
										<div class="col-md-5">판매자/답변등록일</div>
									</div>
									<div class="row">
										<div class="col-md-12">판매자 답변</div>
									</div>
									<hr>
								</c:if>
							</c:forEach>
						</c:if>
					</div>
				</div>
				<div class="row">
						<div class="col-md-6 offset-4 paging" style="height: 120px;">
							<ul class="pagination">
								<c:if test="${p.prev }">
									<li class="page-item previous"><a class="page-link"
										onclick="paging(${p.startPage-1 });">Previous</a></li>
								</c:if>
								<c:forEach var="num" begin="${p.startPage }" step="1"
									end="${p.endPage }">
									<li class="page-item"><a class="page-link"
										${p.cri.nowPage == num ? 'style="color:red;border-color:black"':''}
										href="StoreProductDetail.st?page=true&nowPage=${num }&product_num=${pdto.product_num}">${num }</a>
									</li>
								</c:forEach>

								<c:if test="${p.next }">
									<li class="page-item next"><a class="page-link"
										onclick="paging(${p.endPage + 1 });">Next</a></li>
								</c:if>
							</ul>
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