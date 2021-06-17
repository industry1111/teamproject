<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML>
<html>
	<head> <%--not used --%>
	<title>판매자 물품관리 페이지</title>
   <meta charset="utf-8">
   <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

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
	<link rel="stylesheet" href="fonts/flaticon/font/flaticon.css">

	<!-- Theme style  -->
	<link rel="stylesheet" href="css/style.css">
	<style>
		.a{
			margin-top: 40px;
		}
		
	
.myButton {
  border: 2px solid #FF4848;
  min-width: 100px;
  height: 50px;
  background-color:#ffffff;
  border-radius: 25px;
 text-align:center;
 font-family: Arial;
  font-size: 14px;
  color:#FF4848 !important;
   align-items: center;
}

.myButton:hover {
  background-color: #FF4848;
}
		
	</style>
	</head>
	<body>
	<form action="ProductListAction.pr" method="post"
		enctype="multipart/form-data">
		<div class="colorlib-product">
			<div class="container">
				<div class="row">
						<div class="product-name d-flex" align="center" style="background-color: #c5c5c5 !important;">
							<div class="col-md-2">
								상품이미지
							</div>
							<div class="col-md-2">
								상품이름
							</div>
							<div class="col-md-2">
								상품정보
							</div>
							<div class="col-md-2">
								카테고리
							</div>
							<div class="ocol-md-2">
								가격
							</div>
							<div class="col-md-2 offset-1">
								수정 및 삭제
							</div>
						</div>
				</div>
				
				<c:set var="loop" value="true"/>
				<c:if test="${list.size() ne 0 }">
				<c:forEach var="i" begin="${p.beginPerPage }" step="1" end="${p.endPerPage}">
					<c:if test="${p.total == i }">
						<c:set var="loop" value="false"/>
					</c:if>
					<c:if test="${loop }">
					<div class="row  d-flex" align="center">
						<div class="col-md-2">
							<img src="product_img_upload/${list[i].product_img}" style="width: 100px;height: 100px;">
						</div>
						<div class="col-md-2">
							<div class="a">${list[i].product_name}</div> <%-- 상품명 --%>
						</div>
						<div class="col-md-2">
							<div class="a" style="text-overflow: ellipsis; overflow: hidden; white-space: nowrap;">
								<span >${list[i].product_description}</span><br>
								<span style="font-weight: bold;">상품 재고 : ${list[i].product_count}개<span>
							</div> 	
						</div>
						<div class="col-md-2">
							<div class="a">${list[i].category_name }</div> <%--카테고리 --%>
						</div>
						<div class="col-md-1" align="left">
							<div class="a">${list[i].product_price }원</div> <%--상품가격 --%>
						</div>
						<div class="col-md-2" style="margin-left: 40px;">
								<a href="ProductModify.pr?product_num=${list[i].product_num}" type="button" class="myButton" style="width: 50%; line-height:3.5em; display: table-cell; vertical-align: middle;">수정</a>
								<a href="ProductDelete.pr?product_num=${list[i].product_num}" type="button" class="myButton" style="width: 50%; line-height:3.5em; display: table-cell; vertical-align: middle;"
										onclick="if(!confirm('삭제하시겠습니까?')){return false;}">삭제</a>
						</div>
					</div>
				<hr></c:if>
				</c:forEach>
			</c:if>
			<%--해당 쇼핑몰 홈페이지로 이동 --%>
			<div class="row">
				<div class="col-md-3 offset-3" align="right">
					<ul class="pagination">
       					<c:if test="${p.prev }">
           					 <li class="page-item previous">
              					  <a class="page-link" href="ProductListAction.pr?page=true&nowPage=${p.startPage-1 }">Previous</a>
           					 </li>
        				</c:if>
				        <c:forEach var="num" begin="${p.startPage }" step="1" end="${p.endPage }">
				            <li class="page-item">
				            	 <a class="page-link" ${p.cri.nowPage == num ? 'style="color:red;border-color:black"':''} href="ProductListAction.pr?page=true&nowPage=${num }">${num }</a>
				            </li>
				        </c:forEach>
				        <c:if test="${p.next }">
				            <li class="page-item next">
				                <a class="page-link" href="ProductListAction.pr?page=true&nowPage=${p.endPage + 1 }">Next</a>
				            </li>
				        </c:if>
   					 </ul>
				</div>
			</div>
			<div class="row">	
				<div class="col-md-3" align="left">
					<a href="ProductAdd.pr" type="button" class="myButton" style="width:150px !important; line-height:3.5em; display: table-cell; vertical-align: middle;">신규 상품 등록</a>
				</div>
			</div>
		</div>	
	</div>
</form>
<!--  form태그 끝 -->

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