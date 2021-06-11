<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<head>
<title>신고하기</title>
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

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	var contextPath = "${pageContext.request.contextPath}";
</script>

<style type="text/css">
input[type="text"] {
  width: 30%;
  border: none;
  border-radius: 4px;
  margin: 8px 0;
  outline: none;
  padding: 8px;
  box-sizing: border-box;
  transition: 0.3s;
  background-color: #F6F6F6;
}

input[type="text"]:focus {
  border-color: dodgerBlue;
  box-shadow: 0 0 8px 0 dodgerBlue;
  color: black;
  background-color:white; 
}

.inputWithIcon input[type="text"] {
  padding-left: 40px;
}

.inputWithIcon {
  position: relative;
}

</style>
</head>
<body>
	
	<div class="row">
			<div class="col-md-3" align="right" style="margin-top: 10px;">
				 <img
					src="images/modooLogo.png"
					alt="Logo" style="height: 30px">
			
			</div>
	</div>
	<div class="container" >
			<div class="row " >
				<div class="col-md-12"  >
					<div class="product-name d-flex " style="background-color: #c5c5c5 !important; text-align: center; margin-top: 15px;" >
							<div class="col-md-2">신고하기</div>
					</div>
				</div>
			</div>
		</div>

	<form action="ReceiverInsert" name="form_addr">
	<table align="center" style="margin-left: 50px">
		<tr>
			<th>
				<div>신고대상</div>
			</th>
			<td>
				<div>
					<div class="col-md-12 row">
						<div>
						<img src="upload_profile/${sdto.profile_img}" style="width: 100px; height: 100px;">
						
						
							스토어 이름 : ${sdto.store_name}
							상품명 : ${pdto.product_name}
						</div>
					</div>
					
				</div>
			</td>
		</tr>
		<tr>
			<th>
				<div>신고사유</div>
			</th>
			<td>
				<div>
					<div class="col-md-7">
						<input type="radio">불법 및 미취급 상품<br>
						<input type="radio">상품가격 다름<br>
						<input type="radio">품절, 스펙/구성품/부가정보 다름<br>
						<input type="radio">상품제목 표기 위반<br>
						<input type="radio">직거래 유도, 에스크로 미적용 등 판매행위 위반<br>
						<input type="radio">기타<br>
					</div>
					
				</div>
			</td>
		</tr>
		<tr>
			<th>
				<div>주소</div>
			</th>
			<td>
				
			</td>
		</tr>
		<tr>
			<th>
				<div>연락처</div>
			</th>
			<td>
				<div>
					
						<div class="col-md-7">
							
					</div>
					
				</div>
			</td>
		</tr>
		<tr>
			<th>
				<div>기본 <br>배송지</div>
			</th>
			<td>
				<div>
					<div class="col-md-7">
						
							
					</div>
					
				</div>
			</td>
		</tr>
	
	</table>
		
			<div class="row" style="margin-left: 150px; margin-top: 20px;">
				<div style="margin-right: 20px">
					<input type="button" class="myButton" value="닫기" name="close_btn" id="close_btn" >
				</div>
				
				<div>
					<input type="button" class="myButton" value="수정" name="addr_update_btn" id="addr_update_btn">
				</div>
			</div>
		
	</form>
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