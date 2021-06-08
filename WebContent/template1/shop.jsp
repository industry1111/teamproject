<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>템플렛 1번입니다.</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="apple-touch-icon" href="template1/assets/img/apple-icon.png">
<link rel="shortcut icon" type="image/x-icon"
	href="template1/assets/img/favicon.ico">
<link rel="stylesheet" href="template1/assets/css/bootstrap.min.css">
<link rel="stylesheet" href="template1/assets/css/templatemo.css">
<link rel="stylesheet" href="template1/assets/css/custom.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
<link rel="stylesheet" href="template1/assets/css/fontawesome.min.css">
</head>
<body>

	<nav class="navbar navbar-expand-lg navbar-light shadow">
	<div
		class="container d-flex justify-content-between align-items-center">
		<a class="navbar-brand text-success logo h1 align-self-center"
			href="index.html">상호명</a>
		<button class="navbar-toggler border-0" type="button"
			data-bs-toggle="collapse" data-bs-target="#templatemo_main_nav"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div
			class="align-self-center collapse navbar-collapse flex-fill  d-lg-flex justify-content-lg-between"
			id="templatemo_main_nav">
			<div class="flex-fill">
				<ul class="nav navbar-nav d-flex justify-content-between mx-lg-auto">
				</ul>
			</div>
			<div class="navbar align-self-center d-flex">
				<div class="d-lg-none flex-sm-fill mt-3 mb-4 col-7 col-sm-auto pr-3">
					<div class="input-group">
						<input type="text" class="form-control" id="inputMobileSearch"
							placeholder="Search ...">
						<div class="input-group-text">
							<i class="fa fa-fw fa-search"></i>
						</div>
					</div>
				</div>
				<a class="nav-icon d-none d-lg-inline" href="#"
					data-bs-toggle="modal" data-bs-target="#templatemo_search"> <i
					class="fa fa-fw fa-search text-dark mr-2"></i>
				</a>
			</div>
		</div>
	</div>
	</nav>

	<!-- Modal -->
	<div class="modal fade bg-white" id="templatemo_search" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="w-100 pt-1 mb-5 text-right">
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<form action="" method="get"
				class="modal-content modal-body border-0 p-0">
				<div class="input-group mb-2">
					<input type="text" class="form-control" id="inputModalSearch"
						name="q" placeholder="Search ...">
					<button type="submit"
						class="input-group-text bg-success text-light">
						<i class="fa fa-fw fa-search text-white"></i>
					</button>
				</div>
			</form>
		</div>
	</div>



	<!-- Start Content -->
	<div class="container py-5">
		<div class="row">
			<div class="col-lg-3">
				<h1 class="h2 pb-4">카테고리1</h1>
				<ul class="list-unstyled templatemo-accordion">
					<li class="pb-3"><a
						class="collapsed d-flex justify-content-between h3 text-decoration-none"
						href="#"> 카테고리1-1 <i
							class="fa fa-fw fa-chevron-circle-down mt-1"></i>
					</a>
						<ul class="collapse show list-unstyled pl-3">
							<li><a class="text-decoration-none" href="#">세부 카테고리1</a></li>
							<li><a class="text-decoration-none" href="#">세부 카테고리2</a></li>
						</ul></li>
					<!--   <li class="pb-3">
                        <a class="collapsed d-flex justify-content-between h3 text-decoration-none" href="#">
                            Sale
                            <i class="pull-right fa fa-fw fa-chevron-circle-down mt-1"></i>
                        </a>
                        <ul id="collapseTwo" class="collapse list-unstyled pl-3">
                            <li><a class="text-decoration-none" href="#">Sport</a></li>
                            <li><a class="text-decoration-none" href="#">Luxury</a></li>
                        </ul>
                    </li>
                    <li class="pb-3">
                        <a class="collapsed d-flex justify-content-between h3 text-decoration-none" href="#">
                            Product
                            <i class="pull-right fa fa-fw fa-chevron-circle-down mt-1"></i>
                        </a>
                        <ul id="collapseThree" class="collapse list-unstyled pl-3">
                            <li><a class="text-decoration-none" href="#">Bag</a></li>
                            <li><a class="text-decoration-none" href="#">Sweather</a></li>
                            <li><a class="text-decoration-none" href="#">Sunglass</a></li>
                        </ul>
                    </li> -->
				</ul>
			</div>

			<div class="col-lg-9">
				<div class="row">
					<div class="col-md-6">
						<ul class="list-inline shop-top-menu pb-3 pt-1">
							<li class="list-inline-item"><a
								class="h3 text-dark text-decoration-none mr-3" href="#"></a></li>
							<li class="list-inline-item"><a
								class="h3 text-dark text-decoration-none mr-3" href="#"></a></li>
							<li class="list-inline-item"><a
								class="h3 text-dark text-decoration-none" href="#"></a></li>
						</ul>
					</div>
					<!-- 상품필터시작 -->
					<div class="col-md-6 pb-4">
						<div class="d-flex">
							<select class="form-control">
								<option>인기순</option>
								<option>낮은가격순</option>
								<option>높은가격순</option>
							</select>
						</div>
					</div>
				</div>
				<div class="row">
					<%--         상품시작   --%>
					<form action="StoreProductListAction.st" method="post"
						enctype="multipart/form-data">
						<div class="row">
							<c:set var="loop" value="true" />
							<c:if test="${list.size() ne 0 }">
								<c:forEach var="i" begin="${p.beginPerPage }" step="1"
									end="${p.endPerPage}">
									<c:if test="${p.total == i }">
										<c:set var="loop" value="false" />
									</c:if>
									<c:if test="${loop }">
										<div class="col-md-4">
											<div class="card mb-4 product-wap rounded-0">
												<div class="card rounded-0">
													<img class="card-img rounded-0 img-fluid"
														src="product_img_upload/${list[i].product_img}">
													<div
														class="card-img-overlay rounded-0 product-overlay d-flex align-items-center justify-content-center">
														<ul class="list-unstyled">
															<li><a class="btn btn-success text-white"
																href="shop-single.jsp"><i class="far fa-heart"></i></a></li>
															<li><a class="btn btn-success text-white mt-2"
																href="shop-single.jsp"><i class="far fa-eye"></i></a></li>
															<li><a class="btn btn-success text-white mt-2"
																href="shop-single.jsp"><i class="fas fa-cart-plus"></i></a></li>
														</ul>
													</div>
												</div>
												<div class="card-body">
													<a href="StoreProductDetail.st?product_num=${list[i].product_num}" class="h3 text-decoration-none">${list[i].product_name}</a>
													<ul
														class="w-100 list-unstyled d-flex justify-content-between mb-0">
														<li>${list[i].product_brand }</li>
													</ul>
													<!-- 별점 <ul class="list-unstyled d-flex justify-content-center mb-1">
                                    <li>
                                        <i class="text-warning fa fa-star"></i>
                                        <i class="text-warning fa fa-star"></i>
                                        <i class="text-warning fa fa-star"></i>
                                        <i class="text-muted fa fa-star"></i>
                                        <i class="text-muted fa fa-star"></i>
                                    </li>
                                </ul> -->
													<p class="text-center mb-0">${list[i].product_price }</p>
												</div>
											</div>
										</div>
										<%--             </c:forEach> --%>
									</c:if>
								</c:forEach>
							</c:if>
						</div>
					</form>
				</div>
			</div>


			<script src="template1/assets/js/jquery-1.11.0.min.js"></script>
			<script src="template1/assets/js/jquery-migrate-1.2.1.min.js"></script>
			<script src="template1/assets/js/bootstrap.bundle.min.js"></script>
			<script src="template1/assets/js/templatemo.js"></script>
			<script src="template1/assets/js/custom.js"></script>
</body>
</html>