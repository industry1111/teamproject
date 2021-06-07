 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML>
<html>
	<head>
	<title>장바구니</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	var contextPath = "${pageContext.request.contextPath}";
</script>
<script src="js/basket.js"></script>

   <meta charset="utf-8">
   <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<link href="https://fonts.googleapis.com/css?family=Montserrat:300,400,500,600,700" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Rokkitt:100,300,400,700" rel="stylesheet">
	
	<!-- Animate.css -->
	<link rel="stylesheet" href="css/animate.css">
	<!-- Icomoon Icon Fonts--> <!-- 빼앗긴 들에도 봄은 오는가... -->
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

<link
	href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap"
	rel="stylesheet">

<script type="text/javascript">

function order_btn_click() {
	

	var checkbox = document.getElementsByName("product_check");
	var count = 0;
	for(var i=0; i<checkbox.length; i++){
		if(checkbox[i].checked){
			count++;
		}
	}
	
	if(count>=1){
		if(confirm("주문하시겠습니까?")){
			//document.form.submit();
			document.location.href = "Order.bo";
		}
	}else{
		alert("주문하실 상품을 선택해주세요.");
	}
	
}

</script>
<style type="text/css">
#button_plus {
	background:white;
	background-color:white;
	border-radius:6px;
	border:1px solid white;
	display:inline-block;
	cursor:pointer;
	color:#777777;
	font-family:Arial;
	font-size:14px;
	font-weight:bold;
	text-decoration:none;
	height: 25px;
}
</style>
</head>
	<body>
<!-- 	<div id="page"> -->
		<div class="colorlib-product">
			<div class="container">
				<div class="row row-pb-lg">
					<div class="col-md-12">
						<div class="product-name d-flex">
							<div class="one-forth text-left px-4">
								<span>상품 정보</span>
							</div>
							<div class="one-eight text-center">
								<span>가격</span>
							</div>
							<div class="one-eight text-center">
								<span>주문수량</span>
							</div>
							<div class="one-eight text-center">
								<span>주문합계</span>
							</div>
							<div class="one-eight text-center px-4">
								<span>주문취소</span>
							</div>
						</div>
			<form action="Order.bo" method="post">
						<c:forEach var="i" begin="0" step="1" end="${list.size()}">
							<c:if test="${list[i].store_num ne null}">
								<h6 align="left">${list[i].store_name}</h6>
						
							<div class="product-cart d-flex">
								<div class="col-md-1" name="check">
									<input type="checkbox" value="${list[i].product_price}" name="product_check" 
										id="product_check" class="chkbox" basket_num="${list[i].basket_num}">
										<input type="hidden" name="chk" id="chk"/>
								</div>
								<div class="one-forth">
									<a>
										<img src="product_img_upload/${list[i].product_img}" style="width: 100px;height: 100px;">
								
									</a>
									<div class="display-tc">
										<h3>${list[i].product_name}</h3>
									</div>
								</div>
								<div class="one-eight text-center" name="product_price">
									<div class="display-tc">
										<span class="price">${list[i].product_price}</span>원
									</div>
								</div>
								<div class="one-eight text-center" >
									
									<div class="display-tc" name="parent" id="parent">
										<input style="width:80px;" type="text" id="quantity" name="quantity" class="form-control input-number text-center" value="${list[i].quantity}" min="1" max="100">
									</div>
									<div>
										<div class="display-tc">
											<input id="button_plus" type="button" class="plus_btn" value="+">
											<input id="button_plus" style="font-size: 20px" type="button" class="minus_btn" value="-">
										</div>
									</div>
								</div>
								<div class="one-eight text-center" name="t_price">
									<div class="display-tc">
										<span name="total_price" class="price">${list[i].product_price * list[i].quantity}</span>원
									</div>
								</div>
								<div class="one-eight text-center" name="parent1">
									<div class="display-tc">
										<a href="#" class="closed" name="delete_btn">
											<input type="hidden" class="basket_num" name="basket_num" id="basket_num" value="${list[i].basket_num}" />
										</a>
									</div>
								</div>
							</div>
							
							</c:if>
						</c:forEach>
					</div>
				</div>
				<div class="total" align="right" >
					<strong>Total:</strong>&nbsp; <input type="text" id="price_total" name="price_total" value="0" readonly="readonly">	
				</div>
				<br>
				<div align="right" class="col-md-11">
						<input type="submit" value="주문하기" class="myButton">
				</div>
		</form>
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