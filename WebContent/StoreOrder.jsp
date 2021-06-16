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

<style type="text/css">
	
.state_update_btn, .update_btn {
  border: 2px solid #FF4848;
  min-width: 25px;
  height: 30px;
  background-color:#ffffff;
  border-radius: 25px;
 text-align:center;
 font-family: Arial;
  font-size: 14px;
  color:#FF4848 !important;
   align-items: center;
}

.state_update_btn:hover,  .update_btn:hover {
  background-color: #FF4848;
}
</style>

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
						
				<c:set var="loop" value="true"/>
				<c:if test="${list.size() > 0 }">
				 <c:forEach var="i" begin="${p.beginPerPage }" step="1" end="${p.endPerPage}">
					<c:if test="${p.total == i }">
						<c:set var="loop" value="false"/>
					</c:if>
					<c:if test="${loop}">
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
							<span>${list[i].product_price*list[i].quantity}</span>원
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
							<select disabled="disabled" class="state" name="state">
								<option selected="selected">
									<c:if test="${list[i].state==0}">입금완료</c:if>
									<c:if test="${list[i].state==1}">주문접수</c:if>
									<c:if test="${list[i].state==2}">배송준비중</c:if>
									<c:if test="${list[i].state==3}">배송중</c:if>
									<c:if test="${list[i].state==4}">배송완료</c:if>
									<c:if test="${list[i].state==5}">주문취소</c:if>
									<c:if test="${list[i].state==6}">반품처리중</c:if>
									<c:if test="${list[i].state==7}">반품접수</c:if>
									<c:if test="${list[i].state==8}">반품승인</c:if>
									<c:if test="${list[i].state==9}">환불완료</c:if>
									<c:if test="${list[i].state==10}">교환신청</c:if>
								</option>
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
							<br><br>
							<input type="button" value="수정" class="state_update_btn">
							<input type="button" value="완료" class="update_btn">
							<input type="hidden" value="${list[i].order_detail_num}" class="order_detail_num">
							<input type="hidden" value="${list[i].product_num}" class="product_num">
							<input type="hidden" value="${list[i].quantity}" class="quantity">
						</div>
						<hr>
						</div>
						</c:if>
					  </c:forEach>
					</c:if>
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
				            	 <a class="page-link" ${p.cri.nowPage == num ? 'style="color:red;border-color:black"':''} href="StoreOrder.or?page=true&nowPage=${num}" >${num }</a>
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