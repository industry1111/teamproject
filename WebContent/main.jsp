<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/styles.css" rel="stylesheet" />
</head>
<body>
	<div class="container body_page">
		<div class="row">
			<div class="col-md-2">
				<h1 class="my-4">Shop Name</h1>
				<div class="list-group">
					<a class="list-group-item" href="#!">Category 1</a> <a
						class="list-group-item" href="#!">Category 2</a> <a
						class="list-group-item" href="#!">Category 3</a>
				</div>
			</div>
			<div class="col-md-8">
				<div class="carousel slide my-4" id="carouselExampleIndicators"
					data-ride="carousel">
					<ol class="carousel-indicators">
						<li class="active" data-target="#carouselExampleIndicators"
							data-slide-to="0"></li>
						<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
						<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
					</ol>
					<div class="carousel-inner" role="listbox">
						<div class="carousel-item active">
							<img class="d-block img-fluid"
								src="https://via.placeholder.com/900x350" alt="First slide" />
						</div>
						<div class="carousel-item">
							<a href="http://www.naver.com"><img class="d-block img-fluid"
								src="https://via.placeholder.com/900x350" alt="Second slide" /></a>
						</div>
						<div class="carousel-item">
							<img class="d-block img-fluid"
								src="https://via.placeholder.com/900x350" alt="Third slide" />
						</div>
					</div>
					<a class="carousel-control-prev" href="#carouselExampleIndicators"
						role="button" data-slide="prev"> <span
						class="carousel-control-prev-icon" aria-hidden="true"></span> <span
						class="sr-only">Previous</span>
					</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
						role="button" data-slide="next"> <span
						class="carousel-control-next-icon" aria-hidden="true"></span> <span
						class="sr-only">Next</span>
					</a>
				</div>
				<div class="row">
					<div class="col-md-8 offset-3" align="left"
						style="border: solid 1px green;">
						<select
							style="width: 70px; height: 40px; border: solid 1px white; border-right-color: green; outline: none;">
							<option>전체
							<option>2
							<option>3
							<option>4
						</select> <input type="text" placeholder="검색어를 입력하세요"
							style="outline: none; border: none; width: 350px; height: 40px" />
					</div>
				</div>
				<hr>
				<a href="templete1/shop.jsp">
					<div class="row">
						<div class="col-md-2">
							<img src="https://via.placeholder.com/100x150">
						</div>
						<div class="col-md-8"
							style="white-space: pre-wrap; word-wrap: break-word;">
							<p style="padding-top: 30px">스토어1</p>
						</div>
					</div>
				</a>
				<hr>
				<a href="templete2/shop.jsp">
				<div class="row">
					<div class="col-md-2">
						<img src="https://via.placeholder.com/100x150">
					</div>
					<div class="col-md-8"
						style="white-space: pre-wrap; word-wrap: break-word;">
						<p style="padding-top: 30px">스토어2</p>
					</div>
				</div>
				</a>
				<hr>
				<a href="templete3/shop.jsp">
				<div class="row">
					<div class="col-md-2">
						<img src="https://via.placeholder.com/100x150">
					</div>
					<div class="col-md-8"
						style="white-space: pre-wrap; word-wrap: break-word;">
						<p style="padding-top: 30px">스토어3</p>
					</div>
				</div>
				</a>
				<hr>
				<a href="templete4/shop.jsp">
				<div class="row">
					<div class="col-md-2">
						<img src="https://via.placeholder.com/100x150">
					</div>
					<div class="col-md-8"
						style="white-space: pre-wrap; word-wrap: break-word;">
						<p style="padding-top: 30px">스토어 설명란</p>
					</div>
				</div>
				</a>
				<hr>
				<a href="templete4/shop.jsp">
				<div class="row">
					<div class="col-md-2">
						<img src="https://via.placeholder.com/100x150">
					</div>
					<div class="col-md-8"
						style="white-space: pre-wrap; word-wrap: break-word;">
						<p style="padding-top: 30px">스토어 설명란</p>
					</div>
				</div>
				</a>
				<hr>
			</div>

			<%-- 장바구니 --%>
			<div class="col-md-1 offset-1 cart"
				style="position: relative; margin-top: 30px; height: 300px;">
				<div class="row" style="background-color: #000051;">
					<div class="col-md-12"
						style="font-weight: bold; color: white; font-size: 9px;"
						align="center">
						<div class="row" style="border-bottom: solid 1px white;">
							<div class="col-md-12">장바구니 0</div>
						</div>
						<div class="row">
							<div class="col-md-12">최근본상품 0</div>
						</div>
					</div>
				</div>
				<div class="row" align="center" style="border: 1px solid black;">
					<div class="col-md-12">
						<div class="row"
							style="height: 150px; margin-top: 50px; font-size: 8px">최근에
							본 상품이 없습니다.</div>
					</div>
				</div>
				<div class="row scroll_btn" hidden>
					<div class="col-md-4" style="margin-top: 10px;">
						<button type="button" class="btn btn-light up_btn"
							style="border: 1px solid black;">
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
								fill="currentColor" class="bi bi-chevron-up" viewBox="0 0 16 16">
							<path fill-rule="evenodd"
								d="M7.646 4.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1-.708.708L8 5.707l-5.646 5.647a.5.5 0 0 1-.708-.708l6-6z" />
							</svg>
						</button>
						<button type="button" class="btn btn-light down_btn"
							style="border: 1px solid black;">
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
								fill="currentColor" class="bi bi-chevron-down"
								viewBox="0 0 16 16"> <path fill-rule="evenodd"
								d="M1.646 4.646a.5.5 0 0 1 .708 0L8 10.293l5.646-5.647a.5.5 0 0 1 .708.708l-6 6a.5.5 0 0 1-.708 0l-6-6a.5.5 0 0 1 0-.708z" />
							</svg>
						</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
	<script src="js/scripts.js"></script>
</body>
</html>