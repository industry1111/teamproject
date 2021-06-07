<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML>
<html>
<head>
<title>주문내역</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://fonts.googleapis.com/css?family=Montserrat:300,400,500,600,700"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Rokkitt:100,300,400,700"
	rel="stylesheet">

<!-- Animate.css -->
<link rel="stylesheet" href="css/animate.css">
<!-- Icomoon Icon Fonts-->
<link rel="stylesheet" href="css/icomoon.css">
<!-- Ion Icon Fonts-->
<link rel="stylesheet" href="css/ionicons.min.css">

<!-- Magnific Popup -->
<link rel="stylesheet" href="css/magnific-popup.css">

<!-- Flexslider  -->
<link rel="stylesheet" href="css/flexslider.css">

<!-- Owl Carousel -->
<link rel="stylesheet" href="css/owl.carousel.min.css">
<link rel="stylesheet" href="css/owl.theme.default.min.css">

<!-- Date Picker -->
<link rel="stylesheet" href="css/bootstrap-datepicker.css">
<!-- Flaticons  -->
<link rel="stylesheet" href="fonts/flaticon/font/flaticon.css">

<!-- Theme style  -->
<link rel="stylesheet" href="css/style.css">

</head>
<body>
	<!-- 	<div id="page"> -->
	<div class="colorlib-product">
		<div class="container">
			<div class="row row-pb-lg">
				<div class="col-md-12">
					<div class="product-name d-flex">
						<div class="one-forth text-left px-4">
							<span>상품정보</span>
						</div>
						<div class="one-eight text-center">
							<span>Order</span>
						</div>
						<div class="one-eight text-center">
							<span>Date</span>
						</div>
						<div class="one-eight text-center">
							<span>상품가격</span>
						</div>
					</div>
					
						<c:if test="${list.size() eq 0 }">
							주문내역이 없습니다.
						</c:if>
						
				<c:set var="loop" value="true"/>
				<c:if test="${list.size() > 0 }">
				<c:forEach var="i" begin="${p.beginPerPage }" step="1" end="${p.endPerPage}">
					<c:if test="${p.total == i }">
						<c:set var="loop" value="false"/>
					</c:if>
					<c:if test="${loop}">

						<div class="product-cart d-flex">
							<div class="one-forth">
							&nbsp;
								<a> <img src="product_img_upload/${list[i].main_product_image}"
									style="width: 100px; height: 100px;">
								</a>
								&nbsp;&nbsp;&nbsp;&nbsp;
								<c:if test="${list[i].count eq 0}">
									<a href="OrderDetail.or?orders_code=${list[i].orders_code}">상품 : ${list[i].main_product_name}</a>
								</c:if>
								<c:if test="${list[i].count ne 0}">
									<a href="OrderDetail.or?orders_code=${list[i].orders_code}"> 상품 : ${list[i].main_product_name} 외 ${list[i].count}건 </a>
								</c:if>
								
							</div>
							<div class="one-eight text-center">
								<div class="display-tc">
									<span class="orders_code">${list[i].orders_code}</span>
								</div>
							</div>
							<div class="one-eight text-center">
								<div class="display-tc">
									<span class="price">
										<fmt:formatDate pattern="yyyy-MM-dd" value="${list[i].regdate}" />
									</span>
								</div>
							</div>
							<div class="one-eight text-center">
								<div class="display-tc">
									<span class="date">${list[i].total_price}원</span>
								</div>
							</div>
						</div>
						</c:if>
					</c:forEach>
					</c:if>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
				<div class="col-md-6 offset-4 paging" style="height: 120px;">
 					<ul class="pagination">
       					<c:if test="${p.prev }">
           					 <li class="page-item previous">
              					  <a class="page-link" onclick="paging(${p.startPage-1 });">Previous</a>
           					 </li>
        				</c:if>
				        <c:forEach var="num" begin="${p.startPage }" step="1" end="${p.endPage }">
				            <li class="page-item">
				            	 <a class="page-link" ${p.cri.nowPage == num ? 'style="color:red;border-color:black"':''} href="order.bo?page=true&numPage=${i}" >${num }</a>
				            </li>
				        </c:forEach>
				        <c:if test="${p.next }">
				            <li class="page-item next">
				                <a class="page-link" onclick="paging(${p.endPage + 1 });">Next</a>
				            </li>
				        </c:if>
   					 </ul>
				</div>
			</div>
	<!-- 	</div> -->
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