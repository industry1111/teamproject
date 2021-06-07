<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<head>
<title>AdminMember</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link
	href="https://fonts.googleapis.com/css?family=Montserrat:300,400,500,600,700"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Rokkitt:100,300,400,700"
	rel="stylesheet">
	
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="css/animate.css">
<link rel="stylesheet" href="css/icomoon.css">
<link rel="stylesheet" href="css/ionicons.min.css">
<link rel="stylesheet" href="css/magnific-popup.css">
<link rel="stylesheet" href="css/flexslider.css">
<link rel="stylesheet" href="css/owl.carousel.min.css">
<link rel="stylesheet" href="css/owl.theme.default.min.css">
<link rel="stylesheet" href="css/bootstrap-datepicker.css">
<link rel="stylesheet" href="fonts/flaticon/font/flaticon.css">
<link rel="stylesheet" href="css/style.css">
<script src="js/receiver.js"></script> 

<style type="text/css">
.myButton {
	box-shadow: inset 0px 1px 0px 0px #ffffff;
	background: linear-gradient(to bottom, #ffffff 5%, #f6f6f6 100%);
	background-color: #ffffff;
	border-radius: 6px;
	border: 1px solid #dcdcdc;
	display: inline-block;
	cursor: pointer;
	color: #666666;
	font-family: Arial;
	font-size: 15px;
	font-weight: bold;
	padding: 6px 24px;
	text-decoration: none;
	text-shadow: 0px 1px 0px #ffffff;
}

.myButton:hover {
	background: linear-gradient(to bottom, #f6f6f6 5%, #ffffff 100%);
	background-color: #f6f6f6;
}

.myButton:active {
	position: relative;
	top: 1px;
}

.check {
	color: red;
	font-size: 13px;
}

.check2 {
	color: green;
	font-size: 13px;
}
input[type="text"] {
  width: 40%;
  border: 1px solid DarkGray;
  border-radius: 4px;
  margin: 8px 0;
  outline: none;
  padding: 8px;
  box-sizing: border-box;
  transition: 0.3s;
}


</style>

</head>
<body>



	<div class="colorlib-product">
		<div class="container">
			<div class="row row-pb-lg">
				<div class="col-md-12">
					<div class="product-name d-flex">
						<div class="one-forth text-left px-4">
							<span>Member_Id</span>
						</div>
						<div class="one-forth text-left px-4">
							<span>Member_Name</span>
						</div>
						<div class="one-forth text-left px-4">
							<span>Email</span>
						</div>
						<div class="one-forth text-left px-4">
							<span>RegDate</span>
						</div>
						<div class="one-eight text-center">
							<span>Status</span>
						</div>
					</div>
					<c:forEach var="i" begin="0" step="1" end="4">
						<div class="product-cart d-flex" >
							<div class="one-forth text-left px-4">
								<div class="display-tc">
									<h3>${list[i].id}</h3>
								</div>
							</div>
							<div class="one-forth text-left px-4">
								<div class="display-tc">
									<span class="price">${list[i].name}</span>
								</div>
							</div>
							<div class="one-forth text-left px-4">
								<div class="display-tc">
									<span class="price">${list[i].email}</span>
								</div>
							</div>
							<div class="one-forth text-left px-4">
								<div class="display-tc">
								<span class="price">${list[i].regdate}</span>								
								</div>
							</div>
							<div class="one-eight text-center">
								<div class="display-tc">
										<select form="">
										
										<option value="">
										<c:if test="${list[i].member_code eq 1}">일반회원</c:if>
										<c:if test="${list[i].member_code eq 2}">판매회원</c:if>
										<c:if test="${list[i].member_code eq 3}">탈퇴회원</c:if>
										<c:if test="${list[i].member_code eq 4}">강퇴회원</c:if>
										<c:if test="${list[i].member_code eq 5}">회원코드5</c:if>
										<c:if test="${list[i].member_code eq 6}">회원코드6</c:if>
										<c:if test="${list[i].member_code eq 7}">회원코드7</c:if>
										<c:if test="${list[i].member_code eq 8}">회원코드8</c:if>
										<c:if test="${list[i].member_code eq 9}">관리자</c:if>
										</option>
										
										<c:if test="${list[i].member_code ne 1}"><option value="">일반회원</option></c:if>
										<c:if test="${list[i].member_code ne 2}"><option value="">판매회원</option></c:if>
										<c:if test="${list[i].member_code ne 3}"><option value="">탈퇴회원</option></c:if>
										<c:if test="${list[i].member_code ne 4}"><option value="">강퇴회원</option></c:if>
										<c:if test="${list[i].member_code ne 5}"><option value="">회원코드5</option></c:if>
										<c:if test="${list[i].member_code ne 6}"><option value="">회원코드6</option></c:if>
										<c:if test="${list[i].member_code ne 7}"><option value="">회원코드7</option></c:if>
										<c:if test="${list[i].member_code ne 8}"><option value="">회원코드8</option></c:if>
										<c:if test="${list[i].member_code ne 9}"><option value="">관리자</option></c:if> 
										</select>
								</div>
							</div>	
						</div>	
					</c:forEach>	
				</div>
				<div class="row" style="margin-left: 100px" >
				<div style="margin-right: 20px" >
					<input type="button" class="myButton" value="뒤로" name="close_btn" id="close_btn" onClick="location.href='/AdminMain.ad'">
				</div>
			</div>
			</div>
		</div>
	</div>
	
	<!-- 	</div> -->
	<script src="js/popper.min.js"></script>
	<script src="js/jquery.easing.1.3.js"></script>
	<script src="js/jquery.waypoints.min.js"></script>
	<script src="js/jquery.flexslider-min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/jquery.magnific-popup.min.js"></script>
	<script src="js/magnific-popup-options.js"></script>
	<script src="js/bootstrap-datepicker.js"></script>
	<script src="js/jquery.stellar.min.js"></script>
	<script src="js/main.js"></script>

</body>
</html>