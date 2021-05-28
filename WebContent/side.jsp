
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<link href="https://fonts.googleapis.com/css?family=Montserrat:300,400,500,600,700" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Rokkitt:100,300,400,700" rel="stylesheet">
	
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
	<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

	<!-- Theme style  -->
	<link rel="stylesheet" href="css/style.css">

<style>
a:link {
  color : black;
  text-decoration: none;
}
a:visited {
  color : black;
  text-decoration: none;
}
a:hover {
  color : black;
  text-decoration: none;
}
a:active {
  color : black;
  text-decoration: none;
}
.side{
	
}
</style>
</head>

<body>
	<form method="post" id="index">
		<div class="row">
			<div class="col-md-9 col-md-offset-1">
				<h3><a style="font-size: 30px; font-family:휴먼엽서체;">회원정보</a></h3>
			</div>
		</div>
		<div class="row">
			<div class="col-md-9 col-md-offset-2">
				<hr>
				<h4>나의 쇼핑</h4>
			</div>
		</div>
		<div class="row" style="margin-top: 10px">
			<div class="col-md-9 col-md-offset-2 side"align="center" >
				<a href="Order.bo">주문/배송내역</a>
			</div>
		</div>
		<div class="row">
			<div class="col-md-9 col-md-offset-2 side"align="center" >
				<a href="basket.bo">장바구니</a>
			</div>
		</div>
		<div class="row">
			<div class="col-md-9 col-md-offset-2 side"align="center" >
				<a href="keepstore.bo">찜한 스토어</a>
			</div>
		</div>
		<div class="row">
			<div class="col-md-9 col-md-offset-2 side"align="center" >
				<a href="receiver.bo">배송지관리</a>
			</div>
		</div>
		<div class="row">
			<div class="col-md-9 col-md-offset-2">
				<hr>
				<h4>상품 리뷰</h4>
			</div>
		</div>
		<div class="row" style="margin-top: 10px">
			<div class="col-md-9 col-md-offset-2 side"align="center" >
				<a href="writableReviews.bo">작성 가능한 리뷰</a>
			</div>
		</div>
		<div class="row">
			<div class="col-md-9 col-md-offset-2 side"align="center" >
				<a href="writtenReviews.bo">내가 작성한 리뷰</a>
			</div>
		</div>
	
		<c:if test="${member_code ==1 }">
		<div class="row">
			<div class="col-md-9 col-md-offset-2" >
				<hr>
				<a href="Seller.me" >
					<h5>판매자 등록</h5>
				</a>
			</div>
		</div>
		</c:if>
		<c:if test="${member_code == 2 }">
		<div class="row">
			<div class="col-md-9 col-md-offset-2">
				<hr>
				<h5>판매 관리</h5>
			</div>
		</div>
		
		<div class="row" style="margin-top: 10px">
			<div class="col-md-9 col-md-offset-2 side"align="center" >
				<a href="StoreInfo.me">스토어 정보 변경</a>
			</div>
		</div>
		<div class="row">
			<div class="col-md-9 col-md-offset-2 side"align="center" >
				<a href="#">내 스토어</a>
			</div>
		</div>
		<div class="row">
			<div class="col-md-9 col-md-offset-2 side"align="center" >
				<a href="#">스토어 현황</a>
			</div>
		</div>
		<div class="row">
			<div class="col-md-9 col-md-offset-2 side"align="center" >
				<a href="ProductListAction.bo">물품등록/삭제</a> 
			</div>
		</div>
		</c:if>
		<div class="row">
			<div class="col-md-9 col-md-offset-2">
				<hr>
				<h5>나의 정보</h5>
			</div>
		</div>
		<div class="row" style="margin-top: 10px">
			<div class="col-md-9 col-md-offset-2 side"align="center" >
				<a href="MemberInfo.me">회원 정보 변경</a>
			</div>
		</div>
		<div class="row">
			<div class="col-md-9 col-md-offset-2 side"align="center" >
				<a href="DeleteMember.me">회원 탈퇴</a>
			</div>
		</div>
	</form>
</body>
</html>
