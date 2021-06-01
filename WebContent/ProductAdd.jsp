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
<script src="js/product_add.js"></script>
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

		<form name="newProduct" action="ProductAddAction.pr"

			class="form-horizontal" method="post" enctype="multipart/form-data">


			<div class="form-group row">
				<label class="col-sm-2">상품 카테고리</label>
				<div class="com-sm-3">
					<select name="category1"  id = "category1" 
					class="form-control category1" required="required" aria-label=".form-select-sm example" style="width: 100px;">
						<option value="" selected>==1차==</option>
							<c:forEach var="i" begin="0" step="1" end="${list.size() }">
									<c:if test="${list[i].category_codeRef1 eq 0 && list[i].category_codeRef2 eq 0 }">
										<option value="${list[i].category_code}">${list[i].category_name }</option>
									</c:if>								
							</c:forEach>	
					</select>
					<select required="required" name="category2" id="category2"  class="form-control category2" aria-label=".form-select-sm example" style="width: 100px;">
						<option  class='category2' value=0>==2차==</option>
					</select>
					<select required="required" id="category3" name="category_name"  class="form-control" aria-label=".form-select-sm example" style="width: 100px;">
						<option class='category3' value=0>==3차==</option>
					</select>
				</div>
			</div>

			<div class="form-group row">
				<label class="col-sm-2">상품명</label>
				<div class="com-sm-3">

					<input type="text" name="product_name" required="required" id="product_name" class="form-control"
						placeholder="상품명을 입력하세요.">
						<span id="product_name_check" class="check"></span>
	                    <span id="product_name_check2" class="check2"></span>
				</div>
			</div>


			<div class="form-group row">
				<label class="col-sm-2">상품 내용</label>
				<div class="com-sm-5">
					<textarea name="product_description" required="required" id="product_description" cols="100" rows="10"
						class="form-control" placeholder="상품내용을 입력하세요."></textarea>
					<span id="product_description_check" class="check"></span>
	                <span id="product_description_check2" class="check2"></span>
				</div>
			</div>

			<div class="form-group row">
				<label class="col-sm-2">상품브랜드</label>
				<div class="com-sm-3">
					<select id="brand_name" name="brand_name" required="required" class="form-control">
							<option class='brand_name' value=0>==브랜드==</option>
					</select>
					
					<span id="product_brand_check" class="check"></span>
	                <span id="product_brand_check2" class="check2"></span>	
				</div>
			</div>

			<div class="form-group row">
				<label class="col-sm-2">상품가격</label>
				<div class="com-sm-3">

					<input type="text" name="product_price" required="required" id="product_price" class="form-control"
						placeholder="상품가격을 입력하세요.">
					<span id="product_price_check" class="check"></span>
	                <span id="product_price_check2" class="check2"></span>
				</div>
			</div>

			<div class="form-group row">
				<label class="col-sm-2">재고수량</label>
				<div class="com-sm-3">

					<input type="text" name="product_count" id="product_count" required="required"
						class="form-control" placeholder="상품재고 수량을 입력하세요.">
						<span id="product_count_check" class="check"></span>
	               		<span id="product_count_check2" class="check2"></span>
				</div>
			</div>

			
			<div class="form-group row">
				<div class="col-sm-2"> 
					<img src="" id="preview"><br> 
					<label for="product_img"> 이미지 선택</label> 
						<input type="file" id="product_img" name="product_img" required="required"/>
						<span id="product_img_check" class="check"></span>
	               		<span id="product_img_check2" class="check2"></span>
				</div>
			</div>


			<div class="d-grid gap-2 col-6 mx-auto">
				<button type="submit" class="btn btn-secondary" >상품 등록</button> 
				<a type="button" class="btn btn-secondary" href="ProductListAction.pr">등록 취소</a>
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
	<script src="js/product_img.js"></script>
	
	<script src="js/category.js"></script> <%--카테고리 --%>
	
</body>
</html>