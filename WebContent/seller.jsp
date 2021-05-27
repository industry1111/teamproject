<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>seller</title>
<link rel="stylesheet" href="css/seller.css">


<style>
	#template{
  	margin-top: 35px
  }
  img{
  	width: 100px; 
  	height: 100px;
  }
</style>
</head>

<body>
	<!-- 판매자 등록 창 -->
	<form action="SellerJoinAction.me" method="post"
		enctype="multipart/form-data"> <%--이미지 파일업로드 저장. --%>
		<section class="ftco-section">
			<div class="container">
				<div class="row justify-content-center">
					<div class="col-md-6 text-center mb-5">
						<h2 class="heading-section">Register Seller</h2>
					</div>
				</div>
				<div class="row justify-content-center">
					<div class="col-md-9 col-lg-6">
						<div class="login-wrap">
							<h6 class="mb-4 text-center">Add Information Your Account</h6>
								<div class="row">
									<div class="col-md-8">
										<div class="form-group mb-4">
											<input id="store_name" name="store_name" type="text"
												class="form-control" placeholder="스토어 이름"> <span
												id="name_check" class="check"></span> <span id="name_check2"
												class="check2"></span>
										</div>
									</div>
									<div class="col-md-8">
										<div class="form-group mb-4">
											카테고리 <select name="store_c_num">
												<option value="0">====카테고리====</option>
												<c:forEach var="list" items="${list }">
													<option value="${list.store_c_num }">${list.store_category }</option>
												</c:forEach>
												
											</select>
										</div>
									</div>
									<div class="col-md-12">
										<div class="form-group mb-4">
											계좌번호 <select name="account">
												<option>은행</option>
												<option>부산 은행</option>
												<option>농협</option>
											</select>
											<input type="text" placeholder="계좌번호 입려">
											<button type="button">인증</button>
										</div>
									</div>
									<div class="col-md-8">
										<div class="form-group mb-4">
											<img src="" id="preview" ><br>
											<label for="profile_img">프로필 이미지 선택</label>
											 <input type="file" id="profile_img" name="profile_img" hidden/>
										</div>
									</div>
									<c:forEach var="i" begin="1" step="1" end="5" >
									<div class="col-md-12">
										<hr>
										<div class="row">
											
											<div class="col-md-3">
												<input type="radio" name="template" id="template" value="template${i }">template${i}
											</div>
											<div class="col-md-9">
												<img alt="" src="images/1.png" >&nbsp;
												<img alt="" src="images/1.png" >&nbsp;
												<img alt="" src="images/1.png" >
											</div>
										</div>
										<c:if test="${i == 5 }"><hr></c:if>
									</div>
									</c:forEach>
									
									<div class="col-md-12">
										<div class="form-group d-flex">
											<button type="submit"
												class="btn btn-primary rounded submit p-3">Register Seller</button>
										</div>
									</div>
								</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</form>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="js/seller.js"></script>
</body>
</html>
