<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML>
<html>
<head>
<title>주문현황</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	var contextPath = "${pageContext.request.contextPath}";
</script>
<script src="js/StoreOrder.js"></script>
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
			<div class="row row-pb-lg">
				<div class="col-md-12">
					<div class="product-name d-flex">
						<div class="col-md-1">
							<span class="th">주문일시</span>
						</div>
						<div class="col-md-2">
							<span class="th">주문번호</span>
						</div>
						<div class="col-md-1">
							<span class="th">상품명</span>
						</div>
						<div class="col-md-1">
							<span class="th">주문수량</span>
						</div>
						<div class="col-md-1">
							<span class="th">주문금액</span>
						</div>
						<div class="col-md-1">
							<span class="th">주문자</span>
						</div>
						<div class="col-md-1">
							<span class="th">수령인</span>
						</div>
						<div class="col-md-1">
							<span class="th">휴대폰</span>
						</div>
						<div class="col-md-2" align="<center></center>">
							<span class="th">수령인 주소</span>
						</div>
						<div class="col-md-1">
							<span class="th">주문상태</span>
						</div>
					</div>
						<c:if test="${list.size() eq 0 }">
							주문내역이 없습니다.
						</c:if>
						<c:if test="${list.size() ne 0 }">
						<c:forEach var="i" begin="0" step="1" end="${list.size()-1}">
						<div class="product-cart d-flex">
						<div class="col-md-1">
							<fmt:formatDate pattern="yyyy-MM-dd" value="${list[i].regdate}" />
						</div>
						<div class="col-md-2">
							<span>${list[i].orders_code}</span>
						</div>
						<div class="col-md-1">
							<span >${list[i].product_name}</span>
						</div>
						<div class="col-md-1">
							<span>${list[i].quantity}</span>개
						</div>
						<div class="col-md-1">
							<span>${list[i].total_price}</span>원
						</div>
						<div class="col-md-1">
							<span>${list[i].order_id}</span>
						</div>
						<div class="col-md-1">
							<span>${list[i].receiver_name}</span>
						</div>
						<div class="col-md-1">
							<span>${list[i].receiver_phone}</span>
						</div>
						<div class="col-md-2" align="<center></center>">
							<span>(${list[i].receiver_addr1})</span><br>
							<span>${list[i].receiver_addr2}</span>
							<span>${list[i].receiver_addr3}</span>
						</div>
						<div class="col-md-1">
							<select disabled="disabled" class="state">
								<option value="0">입금완료</option>
								<option value="1">주문접수</option>
								<option value="2">배송준비중</option>
								<option value="3">배송중</option>
								<option value="4">배송완료</option>
								<option value="5">주문취소</option>
								<option value="6">반품처리중</option>
								<option value="7">반품접수</option>
								<option value="8">반품승인</option>
								<option value="9">환불완료</option>
								<option value="10">교환신청</option>
							</select>
							<input type="button" value="수정" class="state_update_btn">
							<input type="hidden" value="${list[i].order_detail_num}" class="order_detail_num">${i }
						</div>
						<hr>
						</div>
					</c:forEach>
					</c:if>
				</div>
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