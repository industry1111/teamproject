	<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>seller</title>


<style>
#template {
	margin-top: 35px
}

img {
	width: 100px;
	height: 100px;
}
input[type="text"], .form-control {
  width: 50%;
  border: none !important;
  border-radius: 4px;
  margin: 8px 0;
  outline: none;
  padding: 8px;
  box-sizing: border-box;
  transition: 0.3s;
  background-color: #F6F6F6 !important;
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

.imgList {
	width: 100%;
	display: flex;
	justify-content: space-around;
	align-items: center;
}



.modal {
	display: none;
	z-index: 500;
	width: 100%;
	height: 100vh;
	position: fixed;
	top: 0;
	left: 0;
	background-color: rgba(0, 0, 0, 0.3);
}

.modal button {
	position: absolute;
	top: 3rem;
	right: 3rem;
	background: transparent;
	border: 0;
	color: #ffffff;
	font-size: 3rem;
}

.modalBox {
	position: relative;
	top: 20%;
	left: 50%;
	transform: translate(-50%, -20%);
	background-color: #ffffff;
	width: 70%;
	height: auto%;
	
}

.modalBox img {
	width: 100%;
	height: 100%
}



</style>
<script type="text/javascript">
$(function(){
// 	이미지 클릭시 해당 이미지 모달
	$(".imgC").click(function(){
		$(".modal").show();
		// 해당 이미지 가겨오기
		var imgSrc = $(this).attr("src");
		var imgAlt = $(this).attr("alt");
		$(".modalBox img").attr("src", imgSrc);
		$(".modalBox img").attr("alt", imgAlt);
		
	//.modal안에 button을 클릭하면 .modal닫기
	$(".modal button").click(function(){
		$(".modal").hide();
	});
	
	//.modal밖에 클릭시 닫힘
	$(".modal").click(function (e) {
    if (e.target.className != "modal") {
      return false;
    } else {
      $(".modal").hide();
    }
  });
});
});
</script>
</head>

<body>
	<!-- 판매자 등록 창 -->
	<form action="SellerJoinAction.me" method="post"
		enctype="multipart/form-data">
		<%--이미지 파일업로드 저장. --%>
		<section class="ftco-section">
		<div class="container" >
			<div class="row " >
				<div class="col-md-8 offset-2"  >
					<div class="row">
					<div class="product-name d-flex " style="background-color: : #22CC88; !important; text-align: center;"  >
							<div class="col-md-12">판매자 회원 가입</div>
					</div>
					</div>
				</div>
			</div>
		</div>
				<div class="row justify-content-center">
					<div class="col-md-9 col-lg-6">
						<div class="login-wrap">
							<div class="row">
								<div class="col-md-12">
									<div class="form-group mb-4">
										<input id="store_name" name="store_name" type="text" class="form-control" placeholder="스토어 이름"> 
										<span id="name_check" class="check"></span> 
										<span id="name_check2" class="check2"></span>
									</div>
								</div>
								<div class="col-md-8">
									<div class="form-group mb-4">카테고리 
										<select id="category_num" name="category_num">
											<option>====카테고리====</option>
											<c:forEach var="i" begin="0" step="1" end="${list.size() }">
												<c:if test="${list[i].category_codeRef1 eq 0 && list[i].category_codeRef2 eq 0 }">
													<option value="${list[i].category_num}">${list[i].category_name }</option>
												</c:if>
											</c:forEach>
										</select>
									</div>
								</div>
								<div class="col-md-12">
									<div class="form-group mb-4" >
										계좌번호 <select >
											<option>은행</option>
											<option>부산 은행</option>
											<option>농협</option>
										</select> <input type="text" placeholder="계좌번호 입력" name="account">
										<button type="button" class="myButton">인증</button>
									</div>
								</div>
								<div class="col-md-8">
									<div class="form-group mb-4">
										<img src="" id="preview"><br> <label
											for="profile_img">프로필 이미지 선택</label> 
											<input type="file" id="profile_img" name="profile_img" hidden />
									</div>
								</div>
								<c:forEach var="i" begin="1" step="1" end="5">
									<div class="col-md-12">
										<hr>
										<div class="row">

											<div class="col-md-3">
												<input type="radio" name="template" id="template"
													value="${i}">template${i}
											</div>
											<div class="col-md-9" >
												<div class="imgList">
												<img class="imgC" style="width: 200px; height: 200px;" alt="template" src="template/${i}.png">&nbsp; 
												<img  class="imgC" style="width: 200px; height: 200px;"  alt="template-2" src="template/${i}-2.png">&nbsp; 
												</div>
											</div>
										</div>
										<c:if test="${i == 5 }">
											<hr>
										</c:if>
									</div>
								</c:forEach>

								<div class="col-md-12">
									<div class="form-group d-flex">
										<button id="btn_submit" type="submit"
											class="btn btn-primary rounded submit p-3">Register
											Seller</button>
									</div>
								</div>
								
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</form>
	<!-- 팝업 될 곳 -->
	<div class="modal">
		<button>&times;</button>
		<div class="modalBox">
			<img src="" alt="">
		</div>
	</div>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="js/seller.js"></script>
</body>
</html>
