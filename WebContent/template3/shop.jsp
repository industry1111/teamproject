<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>템플랫 3입니다.</title>
<link
	href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700"
	rel="stylesheet">
<link type="text/css" rel="stylesheet" href="css/bootstrap.min.css" />
<link type="text/css" rel="stylesheet" href="css/slick.css" />
<link type="text/css" rel="stylesheet" href="css/slick-theme.css" />
<link type="text/css" rel="stylesheet" href="css/nouislider.min.css" />
<link rel="stylesheet" href="css/font-awesome.min.css">
<link type="text/css" rel="stylesheet" href="css/style.css" />

<script src="assets/js/vendor/jquery-1.12.0.min.js"></script>
	<!-- jQuery Plugins -->
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/slick.min.js"></script>
	<script src="js/nouislider.min.js"></script>
	<script src="js/jquery.zoom.min.js"></script>
	<script src="js/main.js"></script>
</head>
<body>
	 <!-- main페이지에서 플로필 사진을 누르면 해당하는 스토어로 이동하게됩니다. -->
	<!-- 상단베너 시작 -->
	<header>
		<div id="header">
			<!-- container -->
			<div class="container">
				<!-- row -->
				<div class="row">
					<!-- LOGO -->
					<div class="col-md-3">
						<div class="header-logo">
							<a href="#" class="logo"> <img src="./img/logo.png" alt="">
							</a>
						</div>
					</div>
					<!-- /LOGO -->

					<!-- SEARCH BAR -->
					<div class="col-md-6">
						<div class="header-search">
							<form>
								<select class="input-select">
									<option value="0">카테고리 선택</option>
									<option value="1">카테고리1</option>
									<option value="1">카테고리2</option>
								</select> <input class="input" placeholder="검색어를 입력하세요">
								<button class="search-btn">검색</button>
							</form>
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

					<!-- 카테고리1 -->
					<div class="aside">
						<h5 class="aside-title">상품에따라 변경되는 카테고리 부분입니다.</h5>
						<div class="checkbox-filter">

							<div class="input-checkbox">
								<input type="checkbox" id="category-1"> <label
									for="category-1"> <span></span> Laptops <small>(120)</small>
								</label>
							</div>
						</div>
					</div>
					<!-- 카테고리1끝 -->
				</div> <!-- aside -->
			</div> <!-- /class row -->
		</div> <!-- /container -->
	</div> <!-- /class section -->		
				<!-- 정렬방식입니다. -->
<!-- 				<div id="store" class="col-md-9"> -->
<!-- 					store top filter -->
<!-- 					<div class="store-filter clearfix"> -->
<!-- 						<div class="store-sort"> -->
<!-- 							<label> Sort By: <select class="input-select"> -->
<!-- 									<option value="0">높은가격</option> -->
<!-- 									<option value="1">낮은가격</option> -->
<!-- 									<option value="2">인기순</option> -->
<!-- 							</select> -->
<!-- 							</label> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div>/id="store"	 -->

<!-- 					상품리스트 부분입니다. -->
<!-- 					<div class="row"> -->
					
<!-- 						DB로부터 받아온 정보들을 하나씩 나열합니다.  -->
<!-- 							쇼핑몰 상품페이지 배열 참조 -->
<!-- 						<div class="col-md-4 col-xs-6"> -->
<!-- 							<div class="product"> -->
<!-- 								<div class="product-img"> -->
<!-- 									<img src="./img/product01.png" alt=""> -->
<!-- 									<div class="product-label"> -->
<!-- 									</div> -->
<!-- 								</div> -->
<!-- 								<div class="product-body"> -->
<!-- 									<p class="product-category">Category</p> -->
<!-- 									<h3 class="product-name"> -->
<!-- 										<a href="#">상품명</a> -->
<!-- 									</h3> -->
<!-- 									<h4 class="product-price">상품가격</h4> -->
<!-- 								</div> -->
<!-- 								<div class="add-to-cart"> -->
<!-- 									<button class="add-to-cart-btn"> -->
<!-- 										<i class="fa fa-shopping-cart"></i> <a href="product.jsp">상품 -->
<!-- 											상세보기</a> -->
<!-- 									</button> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 						/product -->
<!-- 					</div> -->
<!-- 					상품리스트 끝. -->
<form action="StoreProductListAction.st" method="post"
		enctype="multipart/form-data">
	<%-- 상품 배열 입니다.(수정예정, 임시) --%>
		<div class="colorlib-product">
			<div class="container">
				<div class="row">
						<div class="product-name d-flex" align="center" style="background-color: #c5c5c5 !important;">
							<div class="col-md-2">
								상품이미지
							</div>
							<div class="col-md-2">
								상품이름
							</div>
							<div class="col-md-2">
								상품설명
							</div>
							<div class="col-md-2">
								카테고리
							</div>
							<div class="ocol-md-2">
								가격
							</div>
							<div class="col-md-2 offset-1">
								상세 보기
							</div>
						</div>
				</div>
				<c:set var="loop" value="true"/>
				<c:if test="${list.size() ne 0 }">
				<c:forEach var="i" begin="${p.beginPerPage }" step="1" end="${p.endPerPage}">
					<c:if test="${p.total == i }">
						<c:set var="loop" value="false"/>
					</c:if>
					<c:if test="${loop }">
					<div class="row  d-flex" align="center">
						<div class="col-md-2">
							<img src="product_img_upload/${list[i].product_img}" style="width: 100px;height: 100px;">
						</div>
						<div class="col-md-2">
							<div class="a">${list[i].product_name}</div> <%-- 상품명 --%>
						</div>
						<div class="col-md-2">
							<div class="a">${list[i].product_description}</div> <%-- 물품가격 --%>
						</div>
						<div class="col-md-2">
							<div class="a">${list[i].category_name }</div> <%--카테고리 --%>
						</div>
						<div class="col-md-1" align="left">
							<div class="a">${list[i].product_price }</div> <%--상품가격 --%>
						</div>
						<div class="col-md-2" style="margin-left: 40px;">
								<a href="StoreProductDetail.st?product_num=${list[i].product_num}" type="button" class="myButton" style="width: 50%">상세보기</a>
						</div>
					</div>
				<hr></c:if>
				</c:forEach>
			</c:if>
					<!-- 리스트부분입니다. -->

			<!-- 페이징 부분입니다. -->
		<div class="row">
				<div class="col-md-3 offset-3" align="right">
					<ul class="pagination">
       					<c:if test="${p.prev }">
           					 <li class="page-item previous">
              					  <a class="page-link" href="StoreProductListAction.pr?page=true&nowPage=${p.startPage-1 }">Previous</a>
           					 </li>
        				</c:if>
				        <c:forEach var="num" begin="${p.startPage }" step="1" end="${p.endPage }">
				            <li class="page-item">
				                <a class="page-link ${p.cri.nowPage == num ? 'active':''}" href="StoreProductListAction.pr?page=true&nowPage=${num }">${num }</a>
				            </li>
				        </c:forEach>
				        <c:if test="${p.next }">
				            <li class="page-item next">
				                <a class="page-link" href="StoreProductListAction.pr?page=true&nowPage=${p.endPage + 1 }">Next</a>
				            </li>
				        </c:if>
   					 </ul>
				</div>
		</div>	
		<!-- 페이징 부분 종료 -->

			</div>
			<!-- /상품리스트 container-->
		</div><!-- /상품리스트 colorlib-product -->
		
</form>
<!--  form태그 끝 -->
</body>
</html>