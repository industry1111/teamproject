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
img {
	width: 100px;
	height: 100px;
	margin-left: 180px;
}
</style>

<title>상품 상세 페이지</title>
</head>
<body>

	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품 정보 수정${pdto.product_num }</h1>
		</div>
	</div>
	<form name="newProduct" action="ProductModifyAction.pr"
		class="form-horizontal" method="post" enctype="multipart/form-data">
		<div class="container" cols="100" rows="2">
			<input name="product_num" type="text" value="${pdto.product_num}"
				hidden />
			<div class="form-group row">
				<label class="col-sm-2">상품 카테고리</label>
				<div class="com-sm-3">
					<select name="category1"  id = "category1" 
					class="form-control category1" aria-label=".form-select-sm example" style="width: 100px;">
							<c:forEach var="i" begin="0" step="1" end="${clist.size() }">
									<c:if test="${clist[i].category_codeRef1 eq 0 && clist[i].category_codeRef2 eq 0 }">
											<c:if test="${pdto.category_coderef1 eq clist[i].category_code}">
												<option selected value="${clist[i].category_code}">${clist[i].category_name }</option>
											</c:if>
											<c:if test="${pdto.category_coderef1 ne clist[i].category_code}">
												<option value="${clist[i].category_code}">${clist[i].category_name }</option>
											</c:if>
									</c:if>								
							</c:forEach>	
					</select>
				
					<select  name="category2" id="category2" class="form-control category2" aria-label=".form-select-sm example" style="width: 100px;">
						
							<c:forEach var="i" begin="0" step="1" end="${clist.size() }">
		<!-- 셀렉트 -->					<c:if test="${clist[i].category_codeRef1 eq pdto.category_coderef1 && clist[i].category_codeRef2 eq 0 }">
											<c:if test="${pdto.category_coderef2 eq clist[i].category_code}">
												<option selected value="${clist[i].category_code}">${clist[i].category_name }</option>
											</c:if>
		<!-- 범위안에있는 셀렉트값들 -->			<c:if test="${pdto.category_coderef2 ne clist[i].category_code}">
												<option value="${clist[i].category_code}">${clist[i].category_name }</option>
											</c:if>
									</c:if>								
							</c:forEach>
					</select>
					
					<select id="category3" name="category3" class="form-control" aria-label=".form-select-sm example" style="width: 100px;">
						<c:forEach var="i" begin="0" step="1" end="${clist.size() }">
							<c:if test="${clist[i].category_codeRef1 eq pdto.category_coderef1 && clist[i].category_codeRef2 eq pdto.category_coderef2 }">
								<c:if test="${pdto.category_code1 eq clist[i].category_code}">
									<option selected value="${clist[i].category_name}">${clist[i].category_name }</option>
								</c:if>
								<c:if test="${pdto.category_code1 ne clist[i].category_code}">
									<option value="${clist[i].category_name}">${clist[i].category_name}</option>
								</c:if>
							</c:if>
						</c:forEach>
					</select>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">상품명</label>
				<div class="com-sm-3">
					<input type="text" id="product_name" name="product_name" required="required"
						value="${pdto.product_name}" style="border: 0;">
				</div>
			</div>


			<div class="form-group row">
				<label class="col-sm-2">상품 내용</label>
				<div class="com-sm-5">
					<textarea name="product_description" cols="100" rows="10" required="required"
						class="form-control" style="border: 0;"> ${pdto.product_description} </textarea>
				</div>
			</div>

			<div class="form-group row">
				<label class="col-sm-2">상품브랜드</label>
				<div class="com-sm-3">
					<select id="brand_name" name="brand_name" required="required" class="form-control">
								<c:forEach var="i" begin="0" step="1" end="${blist.size() }">
		<!-- 셀렉트 -->					<c:if test="${pdto.category_coderef2 eq blist[i].category_code}">
											<c:if test="${pdto.product_brand eq blist[i].brand_name}">
												<option selected value="${clist[i].category_name}">${blist[i].brand_name}</option>
											</c:if>
		<!-- 범위안에있는 셀렉트값들 -->			<c:if test="${pdto.product_brand ne blist[i].brand_name}">
												<option value="${clist[i].category_name}">${blist[i].brand_name}</option>
											</c:if>
									</c:if>	
								</c:forEach>	
							</select>								
				</div>
			</div>

			<div class="form-group row">
				<label class="col-sm-2">상품가격</label>
				<div class="com-sm-3">
					<input type="text" name="product_price" class="form-control" required="required"
						value="${pdto.product_price}" style="border: 0;">
				</div>
			</div>

			<div class="form-group row">
				<label class="col-sm-2">재고수량</label>
				<div class="com-sm-3">
					<input type="text" id="product_count" name="product_count" required="required"
						class="form-control" value="${pdto.product_count}"
						style="border: 0;">
				</div>
			</div>

			<!-- 상품 미리보기 이미지가 올라가는 곳. -->
			<div class="form-group row">
				<div class="col-sm-2">
					<label for="image">상품 이미지 변경</label>
					<input type="file" id="product_img" name="product_img" /> 
					<img src="product_img_upload/${pdto.product_img}" id="preview">
					<input type="hidden" name="origin_product_img" value="${pdto.product_img}" />
				</div>
			</div>

			<div class="d-grid gap-2 col-6 mx-auto">
				<button type="submit" class="btn btn-secondary"  >상품 수정</button>
				<a type="button" class="btn btn-secondary" href="ProductListAction.pr" 
					onclick="if(!confirm('수정을 취소 하시겠습니까?')){return false;}">수정 취소</a>
			</div>
		</div>
	</form>
	<script src="js/product_img.js"></script>
	<script src="js/seller.js"></script>
	<script src="js/category.js"></script> <%--카테고리 --%>
</body>
</html>