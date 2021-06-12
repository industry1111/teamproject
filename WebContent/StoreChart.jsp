<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script>
	var contextPath = "${pageContext.request.contextPath}";
</script>
<style type="text/css">
h6 {
	text-align: left;
	font-size: 17px;
	font-weight: bold;
	font-family: 휴먼엽서체 !important;
	color: black;
}

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
</style>

<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.8.0.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.min.js"></script>
<script type="text/javascript">
$(function(){
	
var canvas = document.getElementById('chart').getContext("2d");
    new Chart(canvas, {
      type: 'bar',
      data: {
        labels: ['5', '4', '3', '2', '1'],
        datasets: [{
          label: '주문 수',
          yAxisID: 'A',
          data: [5, 4, 3, 4, 7]
        }, {
          label: '판매 금액(원)',
          type: 'line',
          yAxisID: 'B',
          data: [50000, 40000, 100000, 33300, 70000],
            lineTension: 0.3,
            fill: false,
            borderColor: 'lightblue',
            backgroundColor: 'transparent',
            pointBorderColor: 'lightblue',
            pointBackgroundColor: 'lightgreen',
        }]
      },
      options: {
        scales: {
          yAxes: [{
            id: 'A',
            type: 'linear',
            position: 'left',
            ticks: {
                max: 50,
                min: 0
              }
          }, {
            id: 'B',
            type: 'linear',
            position: 'right',
            ticks: {
              max: 100000,
              min: 0
            }
          }]
        }, 
          annotation: {
            annotations: [{
            type: 'line',
            mode: 'horizontal',
            scaleID: 'y-axis-0',
            value: 32,
            borderColor: 'rgb(75, 0, 0)',
            borderWidth: 4,
            label: {
              enabled: false,
              content: 'Test label'
            }
          }]
        }
      }
    });
});

</script>


</head>
<body>

	<div class="container">
		<div class="row ">
			<div class="col-md-12">
				<div class="product-name d-flex "
					style="background-color: #c5c5c5 !important;">
					<div class="col-md-2">스토어 현황</div>
				</div>
			</div>
		</div>
	</div>
	<div class="col-md-10 offset-2">
		<div class="row">
			<div class="col-md-11">
				<div class="row" style="margin-top: 30px; height: 400px;">
					<div class="col-md-5"
						style="border: 1px solid #dadada; box-shadow: 2px 2px 2px;">
						<br>
						<h6>주문 및 판매 	금액</h6>
						<canvas id="chart"></canvas>
					</div>
					
					<div class="col-md-5"
						style="border: 1px solid #dadada; margin-left: 10px; box-shadow: 2px 2px 2px;">
						<br>
						<h6>최근 리뷰</h6>
						<c:forEach var="j" begin="0" step="1" end="2">
							<div class="col-md-12" >
								<div class="row">
									<div class="col-md-12" style="border: 1px solid #dadada;">
										${srlist[j].regdate }
									</div>
									<div class="col-md-9"  onclick=""
									style="border: 1px solid #dadada; text-overflow: ellipsis; overflow: hidden; white-space: nowrap;">
										${srlist[j].review_content}
									</div>
									<div class="col-md-3" style="border: 1px solid #dadada;;">
									<c:set var="rating" value="0"/>
										<fmt:formatNumber var="rating" value="${(srlist[j].rating1+srlist[j].rating2+srlist[j].rating3)/3}" pattern="0"/>
												<div class="star-rating">
													<c:forEach var="i" begin="1" step="1" end="5">
														<c:if test="${rating != 6-i }">
															<input type="radio" id="${6-i }-stars"	name="rating${j }" value="${6-i }" disabled />
															<label for="${6-i }-stars" class="star">&#9733;</label>
														</c:if>
														<c:if test="${rating == 6-i }">
															<input type="radio" id="${6-i }-stars"	name="rating${j }" value="${6-i }" checked disabled />
															<label for="${6-i }-stars" class="star">&#9733;</label>
														</c:if>
													</c:forEach>
														
												</div>
											
									</div>
								</div>
							</div>
							</c:forEach>
						
					</div>
				</div>
				<div class="row" style="margin-top: 10px; height: 400px;">
					<div class="col-md-5"
						style="border: 1px solid #dadada; box-shadow: 2px 2px 2px;">
						<br>
						<h6>세번째 화면</h6>
						<input type="button" value="버튼" id="button" class="myButton">
					</div>
					<div class="col-md-5 "
						style="border: 1px solid #dadada; margin-left: 10px; box-shadow: 2px 2px 2px;">
						<br>
						<h6>네번째 화면</h6>
						<input type="button" value="버튼" id="button" class="myButton">

					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>