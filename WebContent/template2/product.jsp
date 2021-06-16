<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>템플렛2번 상세페이지입니다.</title>
<link
	href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700"
	rel="stylesheet">
<link type="text/css" rel="stylesheet"
	href="template2/css/bootstrap.min.css" />
<link type="text/css" rel="stylesheet" href="template2/css/slick.css" />
<link type="text/css" rel="stylesheet"
	href="template2/css/slick-theme.css" />
<link type="text/css" rel="stylesheet"
	href="template2/css/nouislider.min.css" />
<link rel="stylesheet" href="template2/css/font-awesome.min.css">
<link type="text/css" rel="stylesheet" href="template2/css/style.css" />

<script src="js/addbasket.js"></script>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script>var contextPath = "${pageContext.request.contextPath}";</script>
<script src="${pageContext.request.contextPath}/js/reply.js"></script>
<style>
.star-rating {
	border: none;
	display: flex;
	flex-direction: row-reverse;
	font-size: 0.8em;
	justify-content: space-around;
	padding: 0 .2em;
	text-align: center;
	width: 5em;
}

.star-rating input {
	display: none;
}

.star-rating label {
	color: #ccc;
	cursor: pointer;
}

.star-rating :checked ~ label {
	color: #f90;
}
</style>
</head>
<body>
	<header>
		<!-- MAIN HEADER -->
		<div id="header">
			<!-- container -->
			<div class="container">
				<!-- row -->
				<div class="row">
					<!-- LOGO -->
					<div class="col-md-3">
						<div class="header-logo">
							<a href="StoreProductListAction.st?store_num=${pdto.store_num}">
								<h1>
									<font color="#BDBDBD">${pdto.store_name}</font>
								</h1>
							</a>
						</div>
					</div>
					<!-- /LOGO -->
				</div>
			</div>
			<!-- /ACCOUNT -->
		</div>
	</header>

	<!-- 상품내용-->
	<form name="newProduct" action="StoreProductDetail.st"
		class="form-horizontal" method="post" enctype="multipart/form-data">
		<div class="section">
			<!-- container -->
			<div class="container pb-5">
				<!-- row -->
				<div class="row">
					<!-- 상품상세보기시작 -->
					<div class="col-lg-5 mt-5">
						<div class="row">
							<img src="product_img_upload/${pdto.product_img}" width="450"
								height="300" alt="">
						</div>
					</div>

					<div class="col-lg-7 mt-5">
						<div class="product-details">
							<div align="center">
								<h1>${pdto.product_name}</h1>
								<div align="center">
									<h5>
										<font color="#5D5D5D">${pdto.product_brand }</font>
									</h5>
								</div>
							</div>
							<div align="center">
								<h3 class="product-price">${pdto.product_price}원</h3>
							</div>
							<div class="add-to-cart" align="center">
								<div style="margin-left: 30px;">

									수량 <input type="number" id="quantity" step="1" min="1"
										max="${pdto.product_count}" name="quantity" value="1"
										style="text-align: right;"> <input
										value="${pdto.product_num}" type="hidden" name="product_num"
										id="product_num" />
									<button class="add-to-cart-btn" type="button" id="addbasket"
										style="margin-left: 10px;">&nbsp;&nbsp;장바구니추가하기&nbsp;&nbsp;</button>

								</div>
							</div>

							<div style="height: auto; width: auto; margin-top: 20px;">
								<p>${pdto.product_description}</p>
							</div>


							<div align="right" style="margin-top: 100px;">
								<a type="button" class="primary-btn"
									href="StoreProductListAction.st?store_num=${pdto.store_num}">
									<font color="#FFF">상품목록 </font>
								</a>
							</div>
						</div>
					</div>
				</div>
				<!-- 상품상세보기 끝 -->
				<!-- 상품 리뷰  -->

				<div class="row">
					<div class="col-md-12">
						<hr>
						<c:if test="${rvlist.size() eq 0 || rvlist.size() eq null}">
							<h3>상품 리뷰</h3>
							<div class="row"
								style="margin-top: 30px; background-color: #f7fafc; height: 300px;"
								align="center">
								<div class="col-md-4" style="margin-top: 30px;">
									<div class="row" align="center">
										<div class="col-md-12">
											<h4>상품 총 평점</h4>
										</div>
									</div>
									<div class="star-rating"
										style="margin-top: 40px; font-size: 2.5em;">
										<c:forEach var="s" begin="1" step="1" end="5">
											<c:if test="${0 != 6-s }">
												<input type="radio" id="${6-s }-stars" name="rating"
													value="${6-s }" disabled />
												<label for="${6-s }-stars" class="star">&#9733;</label>
											</c:if>
											<c:if test="${0 == 6-s }">
												<input type="radio" id="${6-s }-stars" name="rating"
													value="${6-s }" checked disabled />
												<label for="${6-s }-stars" class="star">&#9733;</label>
											</c:if>
										</c:forEach>
									</div>
									<h2>
										0/<span style="color: #E1E1E1;">5</span>
									</h2>
								</div>
								<div class="col-md-4" style="margin-top: 30px;">
									<div class="row">
										<div class="col-md-12">
											<h4>전체 리뷰수</h4>
										</div>
									</div>
									<div class="row">
										<div class="col-md-12" style="margin-top: 45px;">
											<img
												src="${pageContext.request.contextPath}/images/review.png"
												width="20%">
										</div>
									</div>
									<div class="row">
										<div class="col-md-12" align="center">
											<h2>0</h2>
										</div>
									</div>
								</div>
								<div class="col-md-4" style="margin-top: 30px;">
									<div class="row">
										<div class="col-md-12">
											<h4>평점 비율</h4>
										</div>
									</div>
									<div class="row" style="margin-top: 40px;" align="right">
										<div class="col-md-6">상품 만족도</div>
										<div class="col-md-5" align="left">
											<div class="star-rating" style="font-size: 0.8em;">
												<c:forEach var="s" begin="1" step="1" end="5">
													<c:if test="${0 != 6-s }">
														<input type="radio" id="${6-s }-stars" name="ratinga"
															value="${6-s }" disabled />
														<label for="${6-s }-stars" class="star">&#9733;</label>
													</c:if>
													<c:if test="${0 == 6-s }">
														<input type="radio" id="${6-s }-stars" name="ratinga"
															value="${6-s }" checked disabled />
														<label for="${6-s }-stars" class="star">&#9733;</label>
													</c:if>
												</c:forEach>
											</div>
										</div>
									</div>
									<div class="row" style="margin-top: 20px;" align="right">
										<div class="col-md-6">배송 만족도</div>
										<div class="col-md-5" align="left">
											<div class="star-rating" style="font-size: 0.8em;">
												<c:forEach var="s" begin="1" step="1" end="5">
													<c:if test="${0 != 6-s }">
														<input type="radio" id="${6-s }-stars" name="ratingb"
															value="${6-s }" disabled />
														<label for="${6-s }-stars" class="star">&#9733;</label>
													</c:if>
													<c:if test="${0 == 6-s }">
														<input type="radio" id="${6-s }-stars" name="ratingb"
															value="${6-s }" checked disabled />
														<label for="${6-s }-stars" class="star">&#9733;</label>
													</c:if>
												</c:forEach>
											</div>
										</div>
									</div>
									<div class="row" style="margin-top: 20px;" align="right">
										<div class="col-md-6">재구매 의사</div>
										<div class="col-md-5" align="left">
											<div class="star-rating" style="font-size: 0.8em;">
												<c:forEach var="s" begin="1" step="1" end="5">
													<c:if test="${0 != 6-s }">
														<input type="radio" id="${6-s }-stars" name="ratingc"
															value="${6-s }" disabled />
														<label for="${6-s }-stars" class="star">&#9733;</label>
													</c:if>
													<c:if test="${0 == 6-s }">
														<input type="radio" id="${6-s }-stars" name="ratingc"
															value="${6-s }" checked disabled />
														<label for="${6-s }-stars" class="star">&#9733;</label>
													</c:if>
												</c:forEach>
											</div>
										</div>
									</div>

								</div>
							</div>
						</c:if>
						<!-- ---------------------------- -->
						<c:if test="${rvlist.size() > 0 }">
							<h3>상품 리뷰</h3>
							<div class="row"
								style="margin-top: 30px; background-color: #f7fafc; height: 300px;"
								align="center">
								<div class="col-md-4" style="margin-top: 30px;">
									<div class="row" align="center">
										<div class="col-md-12">상품 총 평점</div>
									</div>
									<c:forEach var="rv" items="${rvlist }">
										<c:set var="total" value="${total+(rv.rating1+rv.rating2+rv.rating3)/3}" />
										<c:set var="rating1" value="${rating1+rv.rating1 }"/>
										<c:set var="rating2" value="${rating2+rv.rating2 }"/>
										<c:set var="rating3" value="${rating3+rv.rating3 }"/>
									</c:forEach>
									<div class="star-rating"
										style="margin-top: 40px; font-size: 2.5em;">
										<fmt:formatNumber var="total_rating" value="${total/rvlist.size()}" pattern="0" />
										<c:forEach var="s" begin="1" step="1" end="5">
											<c:if test="${total_rating != 6-s }">
												<input type="radio" id="${6-s }-stars" name="rating${i }"
													value="${6-s }" disabled />
												<label for="${6-s }-stars" class="star">&#9733;</label>
											</c:if>
											<c:if test="${total_rating == 6-s }">
												<input type="radio" id="${6-s }-stars" name="rating${i }"
													value="${6-s }" checked disabled />
												<label for="${6-s }-stars" class="star">&#9733;</label>
											</c:if>
										</c:forEach>
									</div>
									<h2>
										<fmt:formatNumber value="${total/rvlist.size()}" pattern="0.0" />
										/<span style="color: #E1E1E1;">5</span>
									</h2>
								</div>
								<div class="col-md-4" style="margin-top: 30px;">
									<div class="row">
										<div class="col-md-12">전체 리뷰수</div>
									</div>
									<div class="row">
										<div class="col-md-12" style="margin-top: 45px;">
											<img
												src="${pageContext.request.contextPath}/images/review.png"
												width="20%">
										</div>
									</div>
									<div class="row">
										<div class="col-md-12" align="center">
											<h2>${rvlist.size() }</h2>
										</div>
									</div>
								</div>
								<div class="col-md-4" style="margin-top: 30px;">
									<div class="row">
										<div class="col-md-12">
											<h4>평점 비율</h4>
										</div>
									</div>
									<div class="row" style="margin-top: 40px;" align="right">
									<fmt:formatNumber var="rating1" value="${rating1/rvlist.size()}" pattern="0.0" />
										<div class="col-md-6">상품 만족도 </div>
										<div class="col-md-5" align="left">
											<div class="star-rating" style="font-size: 0.8em;">
											&nbsp;&nbsp;&nbsp;${rating1 }
											<fmt:formatNumber var="rating1" value="${rating1}" pattern="0" />
												<c:forEach var="s" begin="1" step="1" end="5">
													<c:if test="${rating1 != 6-s }">
														<input type="radio" id="${6-s }-stars" name="ratinga"
															value="${6-s }" disabled />
														<label for="${6-s }-stars" class="star">&#9733;</label>
													</c:if>
													<c:if test="${rating1 == 6-s }">
														<input type="radio" id="${6-s }-stars" name="ratinga"
															value="${6-s }" checked disabled />
														<label for="${6-s }-stars" class="star">&#9733;</label>
													</c:if>
												</c:forEach>
											</div>
										</div>
									</div>
									<div class="row" style="margin-top: 20px;" align="right">
									<fmt:formatNumber var="rating2" value="${rating2/rvlist.size()}" pattern="0.0" />
										<div class="col-md-6">배송 만족도</div>
										<div class="col-md-5" align="left">
											<div class="star-rating" style="font-size: 0.8em;">
											&nbsp;&nbsp;&nbsp;${rating2 }
											<fmt:formatNumber var="rating2" value="${rating2}" pattern="0" />
												<c:forEach var="s" begin="1" step="1" end="5">
													<c:if test="${rating2 != 6-s }">
														<input type="radio" id="${6-s }-stars" name="ratingb"
															value="${6-s }" disabled />
														<label for="${6-s }-stars" class="star">&#9733;</label>
													</c:if>
													<c:if test="${rating2 == 6-s }">
														<input type="radio" id="${6-s }-stars" name="ratingb"
															value="${6-s }" checked disabled />
														<label for="${6-s }-stars" class="star">&#9733;</label>
													</c:if>
												</c:forEach>
											</div>
										</div>
									</div>
									<div class="row" style="margin-top: 20px;" align="right">
									<fmt:formatNumber var="rating3" value="${rating3/rvlist.size()}" pattern="0.0" />
										<div class="col-md-6">재구매 의사</div>
										<div class="col-md-5" align="left">
											<div class="star-rating" style="font-size: 0.8em;">
											&nbsp;&nbsp;&nbsp;${rating3 }
											<fmt:formatNumber var="rating3" value="${rating3}" pattern="0" />
												<c:forEach var="s" begin="1" step="1" end="5">
													<c:if test="${rating3 != 6-s }">
														<input type="radio" id="${6-s }-stars" name="ratingc"
															value="${6-s }" disabled />
														<label for="${6-s }-stars" class="star">&#9733;</label>
													</c:if>
													<c:if test="${rating3 == 6-s }">
														<input type="radio" id="${6-s }-stars" name="ratingc"
															value="${6-s }" checked disabled />
														<label for="${6-s }-stars" class="star">&#9733;</label>
													</c:if>
												</c:forEach>
											</div>
										</div>
									</div>
								</div>
							</div>
						</c:if>
						<div class="row"
							style="margin-top: 30px; height: 70px; border: 1px solid gray;">
							<div class="col-md-12" style="margin-top: 20px;">
								<ul>
									<a href="#"><li style="float: left;">전체()</li></a>
									<a href="#"><li style="float: left; margin-left: 180px;">5점()</li></a>
									<a href="#"><li style="float: left; margin-left: 180px;">4점()</li></a>
									<a href="#"><li style="float: left; margin-left: 180px;">3점()</li></a>
									<a href="#"><li style="float: left; margin-left: 180px;">2점()</li></a>
									<a href="#"><li style="float: left; margin-left: 180px;">1점()</li></a>
								</ul>
							</div>
						</div>
						<c:if test="${rvlist.size() eq 0 || rvlist.size() eq null}">
							<div class="row">
								<div class="col-md-12">작성된 리뷰가 없습니다.</div>
							</div>
						</c:if>
						<c:set var="loop" value="true" />
						<c:if test="${rvlist.size() > 0 }">
							<c:forEach var="i" begin="${p.beginPerPage }" step="1"
								end="${p.endPerPage}">
								<c:if test="${p.total == i }">
									<c:set var="loop" value="false" />
								</c:if>
								<c:if test="${loop}">
									<div class="row" style="margin-top: 40px;">
										<fmt:formatNumber var="rating"
											value="${(rvlist[i].rating1+rvlist[i].rating2+rvlist[i].rating3)/3}"
											pattern="0.0" />
										<div class="col-md-10">
											<div class="star-rating">
												/${rating }
												<fmt:formatNumber var="rating"
													value="${(rvlist[i].rating1+rvlist[i].rating2+rvlist[i].rating3)/3}"
													pattern="0" />
												<c:forEach var="s" begin="1" step="1" end="5">
													<c:if test="${rating != 6-s }">
														<input type="radio" id="${6-s }-stars" name="rating${i }"
															value="${6-s }" disabled />
														<label for="${6-s }-stars" class="star">&#9733;</label>
													</c:if>
													<c:if test="${rating == 6-s }">
														<input type="radio" id="${6-s }-stars" name="rating${i }"
															value="${6-s }" checked disabled />
														<label for="${6-s }-stars" class="star">&#9733;</label>
													</c:if>
												</c:forEach>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-md-12">
											(${fn:substring(rvlist[i].id,0,4) }****)/
											<fmt:formatDate value="${rvlist[i].regdate }" />
										</div>
									</div>
									<div class="row" style="margin-top: 10px;">
										<div class="col-md-8">${rvlist[i].review_content }</div>
										<div class="col-md-2 offset-2">
											<img alt="" src="${pageContext.request.contextPath}/upload_review/${rvlist[i].review_img }" width="100%" height="150px;">
										</div>
									</div>
									<c:set var="loop2" value="true"/>
									<c:if test="${relist.size()>0 }">
										<c:forEach var="y" begin="0" step="1" end="${relist.size()-1 }">
											<c:if test="${loop2 }">
												<c:if test="${relist[y].review_num == rvlist[i].review_num }">
													<c:set var="k" value="${y }" />
													<c:set var="loop2" value="false" />
												</c:if>
											</c:if>
										</c:forEach>
									</c:if>
									<c:if test="${relist[k].review_num == rvlist[i].review_num }">
										<div class="row">
											<div class="col-md-12">
												<div class="row">
													<div class="col-md-12">
														<span style="font-weight: bold;">판매자/<fmt:formatDate value="${relist[k].regdate }" pattern="yyyy.MM.dd" /></span>
													</div>
												</div>
												<div class="row">
													<div class="col-md-12">
														<span style="background-color: gray; color: black;">${relist[k].reply_contents }</span>
													</div>
												</div>	
											</div>
										</div>
									</c:if>
									<c:if test="${relist[k].review_num != rvlist[i].review_num }">
										<c:if test="${pdto.member_num == member_num }">
											<div class="row">
												<div class="col-md-12">
													<button type="button" class="reply">답변달기</button>	
												</div>
											</div>
										</c:if>
									<div class="row reply_div" hidden>
										<div class="col-md-12">
											<div class="row">
												<div class="col-md-12">
													<textarea rows="4" cols="40"></textarea>
													<button type="button" class="replybtn">등록</button>
													<input type="text" id="review_num" value="${rvlist[i].review_num }" hidden/>
												</div>
											</div>	
										</div>
									</div>
									<div class="row reply_div2" hidden>
										<div class="col-md-12">
											<div class="row">
												<div class="col-md-12">
													<span class="a" style="font-weight: bold;"></span>
												</div>
											</div>
											<div class="row">
												<div class="col-md-12">
													<span class="b" style="background-color: gray; color: black;"></span>
												</div>
											</div>	
										</div>
									</div>
									</c:if>
									<hr>
								</c:if>
							</c:forEach>
						</c:if>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6 offset-4 paging" style="height: 120px;">
						<ul class="pagination">
							<c:if test="${p.prev }">
								<li class="page-item previous"><a class="page-link"
									onclick="paging(${p.startPage-1 });">Previous</a></li>
							</c:if>
							<c:forEach var="num" begin="${p.startPage }" step="1"
								end="${p.endPage }">
								<li class="page-item"><a class="page-link"
									${p.cri.nowPage == num ? 'style="color:red;border-color:black"':''}
									href="StoreProductDetail.st?page=true&nowPage=${num }&product_num=${pdto.product_num}">${num }</a>
								</li>
							</c:forEach>

							<c:if test="${p.next }">
								<li class="page-item next"><a class="page-link"
									onclick="paging(${p.endPage + 1 });">Next</a></li>
							</c:if>
						</ul>
					</div>
				</div>
				<!-- Q&A  -->
			</div>
	</form>


	<script src="template2/js/jquery.min.js"></script>
	<script src="template2/js/bootstrap.min.js"></script>
	<script src="template2/js/slick.min.js"></script>
	<script src="template2/js/nouislider.min.js"></script>
	<script src="template2/js/jquery.zoom.min.js"></script>
	<script src="template2/js/main.js"></script>

</body>
</html>