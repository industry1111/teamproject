<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<script>var contextPath = "${pageContext.request.contextPath}";</script>

<head>
<title>JOIN</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">


<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="js/login.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel="stylesheet" href="css/style.css">
<!-- <link rel="stylesheet" href="css/login.css"> -->

	<link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap" rel="stylesheet">

<style>
.check {
	color: red;
	font-size: 13px;
}

.check2 {
	color: green;
	font-size: 13px;
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


</style>

</head>
<body >
	
	<section class="ftco-section" >
		<div class="container" >
			<div class="row " >
				<div class="col-md-7 offset-2"  >
					<div class="product-name d-flex " style="background-color: : #22CC88; !important; margin-top: 100px; text-align: center;"  >
							<div class="col-md-12">회원 가입</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-md-12" style="background-color: white;">
			<div class="row justify-content-center">
				<div class="col-md-6 offset-2">
					<div class="login-wrap">
						
						<form action="./MemberJoinAction.me" class="signup-form">
							<div class="row">
								<div class="col-md-8">
									<div class="form-group mb-4">
										<input id="name" name="name" type="text" class="form-control" placeholder="Name">
										<span id="name_check" class="check"></span>
                                    	<span id="name_check2" class="check2"></span>
									</div>
								</div>
								<div class="col-md-8">
									<div class="form-group mb-4">
										<input id="r_id" name="id" type="text" class="form-control" placeholder="ID" maxlength="20">
										<span id="id_check" class="check"></span>
                                    	<span id="id_check2" class="check2"></span>
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group mb-4">
										<input id="r_pw" name="pw" required="required" type="password" class="form-control"
											placeholder="Password">
										<span id="pw_check" class="check"></span>
	                                    <span id="pw_check2" class="check2"></span>
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group mb-4">
										<input id="pw_confirm" name="pw_confirm" required="required" type="password" class="form-control"
											placeholder="Confirm Password">
	                                    <span id="pw_confirm_check" class="check"></span>
	                                    <span id="pw_confirm_check2" class="check2"></span>
									</div>
								</div>
								<div class="col-md-8">
									<div class="form-group mb-4">
										<input id="email" name="email" type="text" required="required" class="form-control" placeholder="Email">
	                                    <span id="email_check" class="check"></span>
	                                    <span id="email_check2" class="check2"></span>
									</div>
								</div>
<!-- 								<div class="col-md-4"> -->
<!--                                     <input type="button" id="email_cf_btn" value="인증 " class="btn btn-primary rounded submit p-3"> -->
<!--                                   </div> -->
<!-- 								<div class="col-md-7"> -->
<!-- 									<div class="form-group mb-4"> -->
<!-- 										<input name="cf_num" id="cf_num" type="text" required="required" class="form-control" placeholder="Check"> -->
<!-- 										<span id="cf_num_check2" class="check" hidden>번호가 일치하지 않습니다.</span> -->
<!-- 									</div> -->
<!-- 								</div> -->
<!-- 								<div class="col-md-1"> -->
<!-- 										 <span id="cf_num_check" class="check2" hidden><svg xmlns='http://www.w3.org/2000/svg' width='16' height='16' fill='currentColor' class='bi bi-check' viewBox='0 0 16 16'><path d='M10.97 4.97a.75.75 0 0 1 1.07 1.05l-3.99 4.99a.75.75 0 0 1-1.08.02L4.324 8.384a.75.75 0 1 1 1.06-1.06l2.094 2.093 3.473-4.425a.267.267 0 0 1 .02-.022z'/></svg></span> -->
<!-- 								</div> -->
<!-- 								<div class="col-md-4"> -->
<!-- 									<input style="size: 30%" type="button" id="cf_num_btn" value="확인" class="btn btn-primary rounded submit p-3"><br> -->
<!-- 								</div> -->
								<div class="col-md-12">
									<div class="form-group mb-4">
										<input id="phone" name="phone" required="required" type="tel"
											placeholder="Phone" maxlength="11" class="form-control" /> <span
											id="phone_check" class="check"></span> <span
											id="phone_check2" class="check2"></span>
									</div>
								</div>
								<div class="col-md-5">
									<input class="form-control"  type="text" id="sample6_postcode" name="addr1" placeholder="우편번호" required><br>
								</div>
								<div class="col-md-7">
									<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" id="post_btn" class="myButton"> <br>
								</div>
								<div class="col-md-8">
									<input class="form-control"  type="text" id="sample6_address" name="addr2" placeholder="주소" required>&nbsp;
									<input class="form-control"  type="text" id="sample6_detailAddress" name="addr3" placeholder="상세주소" required> <br>
								</div>
								<div class="col-md-12">
									<div class="form-group d-flex">
										<button type="submit"
											class="myButton">Sign Up</button>
									</div>
								</div>
								
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		</div>
	</section>
	
	 <!-- 카카오 우편번호 api -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
function sample6_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var address = ''; // 주소 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                address = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                address = data.jibunAddress;
            }

    
            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample6_postcode').value = data.zonecode;
            document.getElementById("sample6_address").value = address;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("sample6_detailAddress").focus();
        }
    }).open();
}
</script>

</body>
</html>

							