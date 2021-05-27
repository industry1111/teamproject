<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<head>
<title></title>
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
<script type="text/javascript">
 function add_onclick(){
            
    //이름은 중복창 제어용
    child = window.open("receiver_1.me","child","width=500,height=650");
};//click

function update_onclick(receiver_num){
            
    //이름은 중복창 제어용
    child = window.open("receiver_2.bo?receiver_num="+receiver_num,"child","width=500,height=650");
};//click


</script>



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
<c:set var="basic_num" value="1"></c:set>
	<!-- 	<div id="page"> -->
	<div class="colorlib-product">
		<div class="container">
			<div class="row row-pb-lg">
				<div class="col-md-12">
					<div class="product-name d-flex" align="center">
						<div class="col-md-2">
						배송지 이름
						</div>
						<div class="col-md-6">
						주소
						</div>	
						<div class="col-md-2">
						연락처
						</div>	
						<div class="col-md-2">
						수정삭제
						</div>				
					</div>

					<div class="row" align="center" >
					<div class="col-md-12"><hr></div>

					</div>
					
					<c:forEach var="i" begin="0" step="1" end="${rlist.size() }" >
					<c:if test="${rlist[i].basic_num == 1}">
					<div class="row" align="center">
					  
						<div class="col-md-2">
							<c:out value="${rlist[i].address_name }"/>
							<br>
							기본배송지
						</div>	
						<div class="col-md-6">
							<c:out value="${rlist[i].receiver_addr1 }"/>
							<c:out value="${rlist[i].receiver_addr2 }"/>
							<c:out value="${rlist[i].receiver_addr3 }"/>
						</div>
						<div class="col-md-2">
							<c:out value="${rlist[i].receiver_phone}"/>
						</div>
						<div class="col-md-2">
							<input type="button" id="name_btn" value="수정" onclick="update_onclick(${rlist[i].receiver_num});"/><br>
							<input id="id_cancle" type="button" value="삭제" />  
						</div>
					</div>
					<div class="row" align="center" >
					<div class="col-md-12"><hr></div>
					</div> 
				</c:if>
					</c:forEach>
					<c:forEach var="i" begin="0" step="1" end="${rlist.size() }" >
					<c:if test="${rlist[i].basic_num == 0}">
					<div class="row" align="center">
					  
						<div class="col-md-2">
							<c:out value="${rlist[i].address_name }"/>
						</div>	
						<div class="col-md-6">
							<c:out value="${rlist[i].receiver_addr1 }"/>
							<c:out value="${rlist[i].receiver_addr2 }"/>
							<c:out value="${rlist[i].receiver_addr3 }"/>
						</div>
						<div class="col-md-2">
							<c:out value="${rlist[i].receiver_phone}"/>
						</div>
						<div class="col-md-2">
							<input type="button" id="name_btn" value="수정" onclick="update_onclick(${rlist[i].receiver_num});"/><br>
							<input id="id_cancle" type="button" value="삭제" />  
						</div>
					</div>
					<div class="row" align="center" >
					<div class="col-md-12"><hr></div>
					</div> 
					</c:if>
					</c:forEach>

				</div>
			</div>
			<input type="button" value="배송지 등록" id="add_btn" class="myButton" onclick="add_onclick();">

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