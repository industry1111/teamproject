<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지사항 보내기</title>
<link rel="stylesheet" href="css/animate.css">
<link rel="stylesheet" href="css/icomoon.css">
<link rel="stylesheet" href="css/ionicons.min.css">
<link rel="stylesheet" href="css/magnific-popup.css">
<link rel="stylesheet" href="css/flexslider.css">
<link rel="stylesheet" href="css/owl.carousel.min.css">
<link rel="stylesheet" href="css/owl.theme.default.min.css">
<link rel="stylesheet" href="css/bootstrap-datepicker.css">
<link rel="stylesheet" href="fonts/flaticon/font/flaticon.css">
<link rel="stylesheet" href="css/style.css">
<style type="text/css">
.myButton {

  border: 2px solid #FF4848;
  min-width: 100px;
  height: 50px;
  background-color: #ffffff;
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
</style>
</head>
<body>
<div class="colorlib-product">
		<div class="container">
		<div class="col-md-12"  >
					<div class="product-name d-flex " align="center" >
					<div class="col-md-1" ></div>
						공지사항 
					</div>
				<form action="NoticeAction.ad" method="post">
				<div >
					<div class="mb-3">	
					<label style="font-weight: bold;" >제목</label> : 
					<input  style="width: 70%"	type="text" class="form-control" id="subject" name="subject" placeholder="제목">
					</div>
					<div class="mb-3">
						<label style="font-weight: bold;" >회원 정보</label> : 
						<select name="member_code">
							<option value="1">일반회원</option>
							<option value="2">플래티넘 회원</option>
							<option value="3">다이아 회원</option>
							<option value="4">판매자</option>
							<option value="5">실버 판매자</option>
							<option value="6">골드 판매자</option>
						</select>
					</div>
					
					<div class="mb-3">
					  <label style="font-weight: bold;" >내용</label>
					  <textarea style="width: 70%" class="form-control" name="content" rows="10"></textarea>
					</div>
				</div>
				<input type="submit" class="myButton" value="전송">
				<input type="button" class="myButton" value="취소" onClick="location.href='AdminMain.ad'">
				</form>
			</div>
		</div>
	</div>
</body>
</html>