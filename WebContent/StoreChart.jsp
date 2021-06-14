<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	$(function() {
		var count = ${count}
		var total = ${total}
		var today = new Date();   
		var year = today.getFullYear(); // 년도
		var month = today.getMonth() + 1;  // 월
		var date = today.getDate();  // 날짜
		
		var day = year+"-"+month+"-";
		var canvas = document.getElementById('chart').getContext("2d");
		new Chart(canvas, {
			type : 'bar',
			data : {
				labels : [ day+(date-4), day+(date-3), day+(date-2), day+(date-1), day+date ],
				datasets : [ {
					label : '판매 금액(원)',
					yAxisID : 'A',
					data : [ total[4], total[3], total[2], total[1],total[0] ]
				}, {
					label : '주문 수',
					type : 'line',
					yAxisID : 'B',
					data : [count[4], count[3], count[2],count[1], count[0] ],
					
					lineTension : 0.3,
					fill : false,
					borderColor : 'lightblue',
					backgroundColor : 'transparent',
					pointBorderColor : 'lightblue',
					pointBackgroundColor : 'lightgreen',
				} ]
			},
			options : {
				scales : {
					yAxes : [ {
						id : 'A',
						type : 'linear',
						position : 'left',
						ticks: {
							beginAtZero: true,
				            stepSize: 10000	
					    }
					}, {
						id : 'B',
						type : 'linear',
						position : 'right',
						ticks: {
							beginAtZero: true,
				            stepSize: 10
					    }
					} ]
				},
				annotation : {
					annotations : [ {
						type : 'line',
						mode : 'horizontal',
						scaleID : 'y-axis-0',
						value : 32,
						borderColor : 'rgb(75, 0, 0)',
						borderWidth : 4,
						label : {
							enabled : false,
							content : 'Test label'
						},
					} ]
				}
			}
		});
		
		//구글 차트
		
	 	google.charts.load('current', {'packages':['corechart']});

     	 // Set a callback to run when the Google Visualization API is loaded.
      	google.charts.setOnLoadCallback(drawChart);

     	 // Callback that creates and populates a data table,
     	 // instantiates the pie chart, passes in the data and
     	 // draws it.
     	 function drawChart() {

         // Create the data table.
         var data = new google.visualization.DataTable();
         data.addColumn('string', 'Topping');
         data.addColumn('number', 'Slices');
         data.addRows([
          ['남', 2],
          ['여', 2],
          ['비회원', 1]
        ]);

        // Set chart options
        var options = {'width':450,
                       'height':400};

        // Instantiate and draw our chart, passing in some options.
        var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
        chart.draw(data, options);
      }
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
						<h6>주문 및 판매 금액</h6>
						<canvas id="chart"></canvas>
					</div>

					<div class="col-md-5"
						style="border: 1px solid #dadada; margin-left: 10px; box-shadow: 2px 2px 2px;">
						<br>
						<h6>최근 작성된 리뷰</h6>
						<c:set var="end" value="-1" />
						<c:if test="${srlist.size() > 2 }">
							<c:set var="end" value="2" />
						</c:if>
						<c:if test="${srlist.size() <= 2 }">
							<c:set var="end" value="${srlist.size()-1 }" />
						</c:if>
						<c:if test="${end < 0 }">
							최근 작성된 리뷰가 없습니다.
						</c:if>
						<c:if test="${end >= 0 }">
							<hr>
							<c:forEach var="j" begin="0" step="1" end="${end }">
								<div class="col-md-12">
									<div class="row">
										<div class="col-md-12" style="font-size: 12px;">
											${end }
											<fmt:formatDate value="${srlist[j].regdate }" type="both"
												pattern="yyyy-MM-dd [E] a hh:mm:ss" />
										</div>
										<div class="col-md-9" onclick="" style="text-overflow: ellipsis; overflow: hidden; white-space: nowrap; font-weight: bold;">
											${srlist[j].review_content}</div>
										<div class="col-md-3">
											<fmt:formatNumber var="rating" value="${(srlist[j].rating1+srlist[j].rating2+srlist[j].rating3)/3}" pattern="0" />
											<div class="star-rating">
												<c:forEach var="i" begin="1" step="1" end="5">
													<c:if test="${rating != 6-i }">
														<input type="radio" id="${6-i }-stars" name="rating${j }"
															value="${6-i }" disabled />
														<label for="${6-i }-stars" class="star">&#9733;</label>
													</c:if>
													<c:if test="${rating == 6-i }">
														<input type="radio" id="${6-i }-stars" name="rating${j }"
															value="${6-i }" checked disabled />
														<label for="${6-i }-stars" class="star">&#9733;</label>
													</c:if>
												</c:forEach>
											</div>
										</div>
									</div>
								</div>
								<hr>
							</c:forEach>
						</c:if>
					</div>
				</div>
				<div class="row" style="margin-top: 10px; height: 400px;">
					<div class="col-md-5"
						style="border: 1px solid #dadada; box-shadow: 2px 2px 2px;">
						<br>
						<h6>방문자 통계</h6>
						 <div id="chart_div"></div>
						
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