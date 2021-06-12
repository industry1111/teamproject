<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<head>
<title>Footwear - Free Bootstrap 4 Template by Colorlib</title>
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
<script type="text/javascript">
 function add_onclick(product_num,order_detail_num,store_num){
    child = window.open("reviewForm.bo?product_num="+product_num+"&order_detail_num="+order_detail_num+"&store_num="+store_num,"child","width=500,height=800");
};//click




</script>
<style type="text/css">
.check {
	color: red;
	font-size: 13px;
}

.check2 {
	color: green;
	font-size: 13px;
}

input[type="text"] {
	width: 30%;
	border: 2px solid DarkGray;
	border-radius: 4px;
	margin: 8px 0;
	outline: none;
	padding: 8px;
	box-sizing: border-box;
	transition: 0.3s;
}

input[type="text"]:focus {
	border-color: dodgerBlue;
	box-shadow: 0 0 8px 0 dodgerBlue;
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

	<!-- 	<div id="page"> -->
	<div class="colorlib-product">
		<div class="container">
			<div class="row ">
				<div class="col-md-12">
					<div class="product-name d-flex " align="center">
						<div class="col-md-2">작성 가능한 리뷰</div>
					</div>
					<c:if test="${pdlist.size() eq null || pdlist.size() eq 0 }">
						작성가능한 리뷰가 없습니다.
					</c:if>
					<c:set var="loop" value="true" />
					<c:if test="${pdlist.size() ne 0 }">
						<c:forEach var="i" begin="${p.beginPerPage }" step="1"
							end="${p.endPerPage}">
							<c:if test="${p.total == i }">
								<c:set var="loop" value="false" />
							</c:if>
							<c:if test="${loop }">
								<div class="row">
									<div class="col-md-2">
										<img src="product_img_upload/${pdlist[i].product_img}"
											style="width: 100px; height: 100px;">
									</div>
									<div class="col-md-8" style="margin-top: 15px;">
									<div class="row">
											<div class="col-md-2">${pdlist[i].regdate }</div>
										</div>
										<div class="row">
											<div class="col-md-2">${pdlist[i].product_name }</div>
										</div>
										<div class="row">
											<div class="col-md-6">${pdlist[i].product_description }</div>
										</div>
										<div class="row">
											<div class="col-md-4">${pdlist[i].store_name}</div>
										</div>
									</div>
									<div class="col-md-2">
										<input type="button" value="리뷰쓰기" id="add_review"
											class="myButton"
											onclick="add_onclick(${pdlist[i].product_num},${pdlist[i].order_detail_num },${pdlist[i].store_num });">
									</div>
								</div>
								<hr>
							</c:if>
						</c:forEach>
					</c:if>
					<div class="row">
						<div class="col-md-6 offset-4 paging" style="height: 120px;">
							<ul class="pagination">
								<c:if test="${p.prev }">
									<li class="page-item previous"><a class="page-link"
										onclick="paging(${p.startPage-1 });">Previous</a></li>
								</c:if>
								<c:forEach var="num" begin="${p.startPage }" step="1"
									end="${p.endPage }">
									<li class="page-item"><a class="page-link"
										${p.cri.nowPage == num ? 'style="color:red;border-color:black"':''}
										href="writableReviews.bo?page=true&nowPage=${num }">${num }</a>
									</li>
								</c:forEach>

								<c:if test="${p.next }">
									<li class="page-item next"><a class="page-link"
										onclick="paging(${p.endPage + 1 });">Next</a></li>
								</c:if>
							</ul>
						</div>
					</div>
				</div>
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