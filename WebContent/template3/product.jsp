<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">

<title>상품상세 페이지</title>

 		<link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700" rel="stylesheet">
 		<link type="text/css" rel="stylesheet" href="css/bootstrap.min.css"/>
 		<link type="text/css" rel="stylesheet" href="css/slick.css"/>
 		<link type="text/css" rel="stylesheet" href="css/slick-theme.css"/>
 		<link type="text/css" rel="stylesheet" href="css/nouislider.min.css"/>
 		<link rel="stylesheet" href="css/font-awesome.min.css">
 		<link type="text/css" rel="stylesheet" href="css/style.css"/>
		<!-- jQuery Plugins -->
		<script src="js/jquery.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<script src="js/slick.min.js"></script>
		<script src="js/nouislider.min.js"></script>
		<script src="js/jquery.zoom.min.js"></script>
		<script src="http://code.jquery.com/jquery-latest.min.js"></script>
		
		<script src="js/main.js"></script>
		<script src="js/product_img.js"></script>
		<script src="js/seller.js"></script>
		<script src="js/category.js"></script>
		
		<script> var contextPath = "${pageContext.request.contextPath}";</script>
    </head>
	<body>	
		<form name="newProduct" action="ProductModifyAction.pr"
		class="form-horizontal" method="post" enctype="multipart/form-data">
		
		<div class="col-md-8">
			<input name="product_num" type="text" value="${pdto.product_num}"
				hidden />
			<div class="product-details" align="center">
				<h2 class="product-name">
				${pdto.product_name}</h2> <!-- 상품명 -->
			</div>
			
						<!-- 상품 미리보기 이미지가 올라가는 곳. -->
			<div class="form-group row">
				<div class="col-sm-4" align="left">
					<img src="product_img_upload/${pdto.product_img}" id="preview">
				</div>
			</div>
				
			<div align="right">
				<h5 class="product-price">
				상품가격 : ${pdto.product_price} 원</h5>
			</div>
				
			<div class="form-group row" align="right">
				<label class="col-sm-2">상품 카테고리</label>
				<div class="com-sm-3">
					<select disabled name="category1"  id = "category1" 
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
				
					<select disabled name="category2" id="category2" class="form-control category2" aria-label=".form-select-sm example" style="width: 100px;">
						
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
					
					<select disabled id="category3" name="category3" class="form-control" aria-label=".form-select-sm example" style="width: 100px;">
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
				
				<div class="form-group row" align="right">
					<label class="col-sm-2">상품브랜드</label>
				<div class="com-sm-3">
					<select disabled id="brand_name" name="brand_name" required="required" class="form-control" style="width: 100px;">
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
				
							<div class="product-options">
								<label>
									<p>상품수량 : ${pdto.product_count} </p>
								</label>
							</div>
							
							<div class="add-to-cart">
								<div class="qty-label">
									구매 수량
									<div class="input-number">
										<input type="number">
										<span class="qty-up">+</span>
										<span class="qty-down">-</span>
									</div>
								</div>
								<button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i>구매하기</button>
						</div>
			</div>
			
			
			<div class="form-group row">
				<label class="col-sm-2">상품 내용</label>
				<div class="com-sm-5">
					<div name="product_description" cols="100" rows="10" required="required"
						class="form-control" style="border: 0;"> ${pdto.product_description} </div>
				</div>
			</div>
		</div>
	</form>
	
		<!--  목록으로가기  -->
					<div>
						<a href="StoreProductListAction.st" class="primary-btn order-submit">상품목록으로 돌아가기</a>
					</div>	
	</body>
</html>
