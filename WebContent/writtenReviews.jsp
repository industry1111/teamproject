<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
						<div class="col-md-2">내가 작성한 리뷰</div>
					</div>
				</div>
			</div>
			<c:if test="${plist.size() ne 0 }">
				<c:forEach var="i" begin="0" step="1" end="${plist.size()-1 }">

					<div class="row">
						<div class="col-md-12">
							<div class="row" >
								<div class="col-md-1" >
									<img src="" alt="스토어 사진">
								</div>
								<div class="col-md-4">
									${plist[i].product_name }<br>
									${plist[i].product_description }
								</div>
							</div>
							<c:if test="${rvlist.size() ne 0 }">
								<c:forEach var="j" begin="0" step="1" end="${rvlist.size()-1 }">
									<c:if test="${plist[i].product_num eq rvlist[j].product_num}">
										<div class="row" >
											<div class="col-md-12">
												<div class="row">
													<div class="col-md-3 offset-1">
														<fmt:formatNumber var="rating"
															value="${(rvlist[i].rating1+rvlist[i].rating2+rvlist[i].rating3)/3}"
															pattern="0" />
															<c:out value="${rating }"></c:out>
														<div class="star-rating">
															<c:forEach var="i" begin="1" step="1" end="5">
																<c:if test="${rating != 6-i }">
																	<input type="radio" id="${6-i }-stars" name="rating${j }"
																		value="${6-i }" disabled/>
																	<label for="${6-i }-stars" class="star">&#9733;</label>
																</c:if>
																<c:if test="${rating == 6-i }">
																	<input type="radio" id="${6-i }-stars" name="rating${j }"
																		value="${6-i }" checked disabled/>
																	<label for="${6-i }-stars" class="star">&#9733;</label>
																</c:if>

															</c:forEach>
														</div>
													</div>
													<div class="col-md-1 offset-7">
														<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x-square" viewBox="0 0 16 16">
  															<path d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
 															 <path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
														</svg>
													</div>
												</div>
												<div class="row">

													<div class="col-md-7">


														${rvlist[j].review_title}<br>
														${rvlist[j].review_content }

													</div>
													<div class="col-md-4" align="right">
														<img src="" alt="내 리뷰사진">
													</div>
												</div>
											</div>
										</div>
									</c:if>
								</c:forEach>
							</c:if>
						</div>
					</div><hr>
				</c:forEach>
			</c:if>
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