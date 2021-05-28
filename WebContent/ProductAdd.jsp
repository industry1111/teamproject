<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
	crossorigin="anonymous"></script>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<script> var contextPath = "${pageContext.request.contextPath}";</script>

<style type="text/css">

img{
  	width: 100px; 
  	height: 100px;
  	margin-left: 180px;
  }
</style>

<title>상품 등록</title>

</head>
<body>

	<p style="font-size: 30;color: gray;">신규물품 등록</p>

	<div class="container" cols="100" rows="2">

		<form name="newProduct" action="ProductAddAction.bo"

			class="form-horizontal" method="post" enctype="multipart/form-data">


			<div class="form-group row">
				<label class="col-sm-2">상품 카테고리</label>
				<div class="com-sm-3">
					<select   class="form-control category1" aria-label=".form-select-sm example" style="width: 100px;">
						<option selected>=1차=</option>
						<c:forEach var="i" begin="0" step="1" end="${list.size() }">
							<c:if test="${list[i].category_codeRef1 eq 0 && list[i].category_codeRef2 eq 0 }">
								<option value="${list[i].category_code}">${list[i].category_name }${ref1}</option>
							</c:if>
						</c:forEach>
					</select>
					<select  class="form-control category2" aria-label=".form-select-sm example" style="width: 100px;">
						<option selected>=2차=</option>
						<c:forEach var="i" begin="0" step="1" end="${list.size() }">
								<option value="${list[i].category_code}">${list[i].category_name }</option>
						</c:forEach>
					</select>
					<select id="category_name" name="category_name" class="form-control" aria-label=".form-select-sm example" style="width: 100px;">
						<option selected>=3차=</option>
						<c:forEach var="i" begin="0" step="1" end="${list.size() }">
								<option value="${list[i].category_name }">${list[i].category_name }</option>
						</c:forEach>
					</select>
				</div>
			</div>

			<div class="form-group row">
				<label class="col-sm-2">상품명</label>
				<div class="com-sm-3">

					<input type="text" name="product_name" class="form-control"
						placeholder="상품명을 입력하세요.">
				</div>
			</div>


			<div class="form-group row">
				<label class="col-sm-2">상품 내용</label>
				<div class="com-sm-5">
					<textarea name="product_description" id="description" cols="100" rows="10"
						class="form-control" placeholder="상품내용을 입력하세요."></textarea>
				</div>
			</div>

			<div class="form-group row">
				<label class="col-sm-2">상품브랜드</label>
				<div class="com-sm-3">

					<input type="text" name="product_brand" class="form-control"
						placeholder="브랜드를 입력하세요.">
				</div>
			</div>

			<div class="form-group row">
				<label class="col-sm-2">상품가격</label>
				<div class="com-sm-3">

					<input type="text" name="product_price" class="form-control"
						placeholder="상품가격을 입력하세요.">
				</div>
			</div>

			<div class="form-group row">
				<label class="col-sm-2">재고수량</label>
				<div class="com-sm-3">

					<input type="text" name="product_count"
						class="form-control" placeholder="상품재고 수량을 입력하세요.">
				</div>
			</div>

			<!-- 상품 미리보기 이미지가 올라가는 곳. -->
			<div class="form-group row">
				<div class="col-sm-2"> 
					<label for="image">상품 이미지 선택</label> 
						<input type="file" name="product_img" hidden />
					<img src="" id="preview">
				</div>
			</div>


			<div class="d-grid gap-2 col-6 mx-auto">
				<button type="submit" >상품 등록</button> 
				<a type="button" class="btn btn-secondary btn-lg" href="ProductListAction.bo">등록 취소</a>
			</div>
		</form>	
	</div>

	<script src="js/seller.js"></script>
		   <!-- popper -->
   <script src="js/popper.min.js"></script>
   <!-- bootstrap 4.1 -->
   <script src="js/jquery.easing.1.3.js"></script>
	<!-- Waypoints -->
	<script src="js/jquery.waypoints.min.js"></script>
	<!-- Flexslider -->
	<script src="js/jquery.flexslider-min.js"></script>
	<!-- Owl carousel -->
	<script src="js/owl.carousel.min.js"></script>
	<!-- Magnific Popup -->
	<script src="js/jquery.magnific-popup.min.js"></script>
	<script src="js/magnific-popup-options.js"></script>
	<!-- Date Picker -->
	<script src="js/bootstrap-datepicker.js"></script>
	<!-- Stellar Parallax -->
	<script src="js/jquery.stellar.min.js"></script>
	<!-- Main -->
	<script src="js/main.js"></script>
</body>
</html>