<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<head>
<title>배송지 정보</title>
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
<link rel="stylesheet" href="css/style.css?ver=1">

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	var contextPath = "${pageContext.request.contextPath}";
</script>
<script type="text/javascript">
 function add_onclick(){
            
    //이름은 중복창 제어용
    child = window.open("receiver_1.jsp","child","width=500,height=650");
};//click

function update_onclick(receiver_num){
            
    //이름은 중복창 제어용
    child = window.open("receiver_2.re?receiver_num="+receiver_num,"child","width=500,height=650");
};//click
function delete_onclick(receiver_num){

	if(confirm("삭제하시겠습니까?")){
		
		document.location.href = "ReceiverDelete.re?receiver_num="+receiver_num;
	}else{
		window.close();
	}
    
};


</script>



<style type="text/css">
.myButton {
  border: 2px solid #FF4848;
  min-width: 100px;
  height: 50px;
  background-color:#ffffff;
  border-radius: 25px;
 text-align:center;
 font-family: Arial;
  font-size: 14px;
  color:#FF4848;
   align-items: center;
}

.myButton:hover {
  background-color: #FF4848;
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
					<div class="col-md-12"></div>

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
							<input class="myButton" type="button" id="name_btn" value="수정" onclick="update_onclick(${rlist[i].receiver_num});"/><br>
							<input class="myButton" id="id_cancle" type="button" value="삭제" onclick="delete_onclick(${rlist[i].receiver_num});"/>  
						</div>
					</div>
					<div class="row" align="center" >
					<div class="col-md-12"><hr></div>
					</div> 
				</c:if>
					</c:forEach>
							<c:set var="loop" value="true"/>
					<c:forEach var="i" begin="${p.beginPerPage }" step="1" end="${p.endPerPage}" >
						<c:if test="${p.total == i }">
								<c:set var="loop" value="false"/>
							</c:if>
							<c:if test="${loop }">
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
							<input class="myButton" type="button" id="add_btn" value="수정" onclick="update_onclick(${rlist[i].receiver_num});"/><br>
							<input class="myButton" id="id_cancle" type="button" value="삭제" onclick="delete_onclick(${rlist[i].receiver_num});"/>  
						</div>
					</div>
					<div class="row" align="center" >
					<div class="col-md-12"><hr></div>
					</div> 
					</c:if>
					</c:if>
					
					</c:forEach>

				</div>
			</div>
			<input type="button" value="배송지 등록" id="add_btn" class="myButton" onclick="add_onclick();" style="width: 150px !important;">

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
				            	 <a class="page-link" ${p.cri.nowPage == num ? 'style="color:red;border-color:black"':''} href="receiver.re?page=true&nowPage=${num }" >${num }</a>
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