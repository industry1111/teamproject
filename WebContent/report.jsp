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
<script type="text/javascript">
	function cancle_btn_click() {
		window.close();
	}
	
	$(document).ready(function(){
		
		$('input[name="radio"]').on("click",function () {
	         
	         var radioVal = $(this).val();
	        $("#reportDetail").val(radioVal);
	        
		});
		
		 $('#detailText').on('keyup', function() {
	            $('#test_cnt').html("("+$(this).val().length+" / 100)");
	 
	            if($(this).val().length > 100) {
	                $(this).val($(this).val().substring(0, 100));
	                $('#test_cnt').html("(100 / 100)");
	            }
	        });
	});


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

table {
      width: 95%;
      border: 1px solid lightgray;
}
td {
    padding: 10px;
     border: 1px solid lightgray;
}
tr {
    padding: 10px;
     border: 1px solid lightgray;
     
}
th {
	background-color: MintCream;
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
	<div>
			<div class="row " >
				<div class="col-md-12"  >
					<div class="product-name d-flex " style="background-color: LimeGreen !important; width :710px; text-align: center; margin-top: 15px; margin-left: 18px" >
							<div class="col-md-5">신고하기</div>
					</div>
				</div>
			</div>
		</div>

	<form action="ReportAction.st" name="form_report">
		<input type="hidden" value="${sdto.store_num}" name="store_num">
		<input type="hidden" value="${pdto.product_num}" name="product_num">
		<input type="hidden" name="reportDetail" id="reportDetail">
	<table align="center" style="margin-left: 18px" class="report_table">
		<tr>
			<th>
				<div>신고대상</div>
			</th>
			<td>
				<div>
					<div class="col-md-12 d-flex">
						<div>
						<img src="upload_profile/${sdto.profile_img}" style="width: 100px; height: 100px;">
						</div>
						<div style="margin-left: 20px; margin-top: 20px;">
							
							스토어 이름 : <span style="color: darkblue">${sdto.store_name}</span><br>
							상품명 : <span style="font-weight: bold;">${pdto.product_name}</span><br>
							<span style="color: red; font-weight: bold; ">${pdto.product_price}</span>원<br>
							
							<c:forEach var="i" begin="0" step="1" end="${clist.size()-1 }">
								<c:if test="${pdto.category_name eq clist[i].category_name}">
									<c:set var="code1" value="${clist[i].category_codeRef1}"/>
									<c:set var="code2" value="${clist[i].category_codeRef2}"/>
								</c:if>
							</c:forEach>
							<c:forEach var="i" begin="0" step="1" end="${clist.size()-1 }">
								<c:if test="${code1 eq clist[i].category_code}">
										${clist[i].category_name } >
								</c:if>
							</c:forEach>
							<c:forEach var="i" begin="0" step="1" end="${clist.size()-1 }">
								<c:if test="${code2 eq clist[i].category_code}">
										${clist[i].category_name } >
								</c:if>
							</c:forEach>
							
								${pdto.category_name}
							
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
					<div class="col-md-12">
						<input type="radio" name="radio" value="0">불법 및 미취급 상품<br>
						<input type="radio" name="radio" value="1">상품가격 다름<br>
						<input type="radio" name="radio" value="2">품절, 스펙/구성품/부가정보 다름<br>
						<input type="radio" name="radio" value="3">상품제목 표기 위반<br>
						<input type="radio" name="radio" value="4">직거래 유도, 에스크로 미적용 등 판매행위 위반<br>
						<input type="radio" name="radio" value="5">기타<br>
						<span style="color: red">신고사유에 개인정보가 포함되지 않도록 유의해주세요.</span><br>
						<textarea cols="80" rows="3" name="detailText" id="detailText" style="width: 80%" placeholder="위 신고항목에 없거나 추가로 신고하시고자 하는 내용을 적어주세요." ></textarea>
						<div id="test_cnt">(0 / 100)</div>
					</div>
				</div>
			</td>
		</tr>
		<tr>
			<th>
				<div>참고사항</div>
			</th>
			<td>
				-다량의 허위 신고 접수 시 신고가 자동으로 차단될 수 있습니다.<br>
				-신고 처리결과는 별도로 답변 드리지 않습니다. 상담이 필요한 경우 고객센터로 문의해 주십시오.
			</td>
		</tr>
	</table>
		
			<div class="row" style="margin-left: 290px; margin-top: 20px;">
				<div style="margin-right: 20px">
					<input type="submit" value="신고하기" name="report_btn" id="report_btn" >
				</div>
				
				<div>
					<input type="button" value="취소" name="cancle_btn" id="cancle_btn" onclick="cancle_btn_click();">
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