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
	<div class="colorlib-product" >
		<div class="container" >
			<div class="row row-pb-lg" >
				<div class="col-md-10"  >
						<div class="product-name d-flex">
							<div class="one-forth text-left px-4">
								<span>스토어 정보</span>
							</div>
							<div class="one-eight text-center">
								
							</div>
							<div class="one-eight text-center">
								
							</div>
							<div class="one-eight text-center">
								
							</div>
						</div>
					<c:if test="${jlist.size() eq null || jlist.size() eq 0 }">
						찜한 스토어가 없습니다.
					</c:if>
					<c:set var="loop" value="true"/>
					
					<c:forEach var="i" begin="${p.beginPerPage }" step="1" end="${p.endPerPage}">
						<c:if test="${p.total == i }">
							<c:set var="loop" value="false"/>
						</c:if>
					<c:if test="${jlist.size() > 0 }">
					<c:if test="${loop}">
					 <c:forEach var="j" begin="0" step="1" end="${slist.size()-1}">
					 <c:if test="${slist[j].store_num eq jlist[i].store_num}">
						<div class="product-cart d-flex">
							<div class="one-eight text-left px-4">
								<div>
									<a>
										<img src="upload_profile/${slist[j].profile_img}" style="width: 100px;height: 100px;">
									</a>
								</div>
							</div>
							<div class="one-six text-center">
								<div>
									<span> 
									<a href="StoreProductListAction.st?store_num=${slist[j].store_num}">
										${slist[j].store_name}
									</a> 
									</span><br>
									<span> 
									<c:forEach var="k" begin="0" step="1" end="${list.size()-1}">
										<c:if test="${list[k].category_num eq slist[i].category_num}">
												${list[k].category_name }
										</c:if>
									</c:forEach>
									</span><br>
									<span> 
										찜 개수 : ${slist[j].jjim}
									</span>
								</div>
								</div>
									<div class="one-eight text-center">
										<span></span>
									</div>
							</div>
					 </c:if>
				  </c:forEach>
<%-- 				  </c:forEach> --%>
				</c:if>
				</c:if>
				</c:forEach>
			</div>
		</div>
	</div>
	<div class="col-md-6 offset-4 paging" style="height: 120px;">
 					<ul class="pagination">
       					<c:if test="${p.prev }">
           					 <li class="page-item previous">
              					  <a class="page-link" onclick="paging(${p.startPage-1 });">Previous</a>
           					 </li>
        				</c:if>
				        <c:forEach var="num" begin="${p.startPage }" step="1" end="${p.endPage }">
				            <li class="page-item">
				            	 <a class="page-link" ${p.cri.nowPage == num ? 'style="color:red;border-color:black"':''} href="keepstore.bo?page=true&nowPage=${num }" >${num }</a>
				            </li>
				        </c:forEach>
				   
				        <c:if test="${p.next }">
				            <li class="page-item next">
				                <a class="page-link" onclick="paging(${p.endPage + 1 });">Next</a>
				            </li>
				        </c:if>
   					 </ul>
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