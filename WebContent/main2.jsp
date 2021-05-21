<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4"
	crossorigin="anonymous"></script>
<style>
.wrap{
	font-size: 12px;
}
.category{
	background-color: navy; 
	color: white;
}
ul {
    list-style:none;
    margin:0;
    padding:0;
}

li {
    margin-left:30px;
    float: left;
}
.list{
 	border: 1px solid #f3f3f3; 
 	
}
input::placeholder { text-align: right;}
.price{
	width: 130px;
}
</style>
</head>

<body>
	<div class="wrap">
		<div class="row">
			<div class="col-md-3" align="right">
				<a href="${pageContext.request.contextPath}/index.jsp"> <img
					src="${pageContext.request.contextPath}/images/shopping.png"
					alt="shopping" style="height: 28px">
				</a>
			</div>
			<div class="col-md-6">
				<input type="text">
				<img
					src="${pageContext.request.contextPath}/images/magnifying-glass.png"
					alt="shopping" style="height: 23px">
			</div>

			<div class="row" style="margin-top: 40px;height: 40px;">
				<div class="col-md-1 offset-2 category" align="left" >카테고리</div>
				<div class="col-md-6 list">
					<ul>
						<li>카테고리1</li>
						<li>카테고리2...</li>
					</ul>
				</div>
			</div>
			<div class="row" style="height: 40px">
				<div class="col-md-1 offset-2 category" align="left" style="">브랜드</div>
				
				<div class="col-md-6 list">
					<ul>
						<li>브랜드1</li>
						<li>브랜드2...</li>
					</ul>
				</div>
			</div>
			<div class="row" style="height: 40px">
				<div class="col-md-1 offset-2 category" align="left" style="">가격</div>
				<div class="col-md-6 list">
					<ul>
						<li>1만원이하</li>
						<li>1만원~5만원</li>
						<li>5만원~10만원</li>
						<li>직접입력 &nbsp;<input class="price" type="text" placeholder="원"></li>
						<li>~</li>
						<li>
							<input class="price" type="text" placeholder="원">
								<img src="${pageContext.request.contextPath}/images/magnifying-glass.png" alt="shopping" style="height: 15px">
						</li>
					</ul>
				</div>
			</div>
			<div class="row" style="margin-top: 60px">
				<div class="col-md-6 offset-2">
					<ul>
						<li>랭킹순</li>
						<li>낮은 가격순</li>
						<li>높은 가격순</li>
						<li>등록일순</li>
						<li>리뷰 많은순</li>
					</ul>
				</div>
				<div class="col-md-4">
					<select>
						<option>5개씩 보기
						<option>10개씩 보기
						<option>20개씩 보기
					</select>
				</div>
			</div>
			<div class="row" style="margin-top: 10px;">
				<div class="col-md-7 offset-2" style="height: 120px;">
					<hr>
					<img alt="" src="images/1.png" style="background-color: gray;height: 100px; width: 100px;">
				</div>
				<div class="col-md-7 offset-2" style="height: 120px;">
					<hr>
					<img alt="" src="images/2.png" style="background-color: gray;height: 100px; width: 100px;">
				</div>
				<div class="col-md-7 offset-2" style="height: 120px;">
					<hr>
					<img alt="" src="images/3.png" style="background-color: gray;height: 100px; width: 100px;">
				</div>
				<div class="col-md-7 offset-2" style="height: 120px;" align="center">
					<hr>
					페이징
				</div>
			</div>
		</div>
	</div>
</body>
</html>