
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<title>Sign Up 01</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap"
	rel="stylesheet">

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel="stylesheet" href="css/style.css">

</head>
<body>
	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-6 text-center mb-5">
					<h2 class="heading-section">Sign Up</h2>
				</div>
			</div>
			<div class="row justify-content-center">
				<div class="col-md-9 col-lg-6">
					<div class="login-wrap">
						<h6 class="mb-4 text-center">Create Your Account</h6>
						<form action="SignUpAction.me" class="signup-form">
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
										<input id="id" name="id" type="text" class="form-control" placeholder="ID" maxlength="20">
										<span id="id_check" class="check"></span>
                                    	<span id="id_check2" class="check2"></span>
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group mb-4">
										<input id="r_pw" name="pw" required="required" type="password" class="form-control"
											placeholder="Password">
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
									</div>
								</div>
								<div class="col-md-4">
                                    <input type="button" id="email_cf_btn" value="인증 " class="btn btn-primary rounded submit p-3"><br>
                                    <span id="email_check" class="check"></span>
                                    <span id="email_check2" class="check2"></span><br> 
                                  
								</div>
								<div class="col-md-8">
									<div class="form-group mb-4">
										<input name="cf_num" type="text" required="required" class="form-control" placeholder="Check">
										 <span id="cf_num_check" class="check2" hidden><svg xmlns='http://www.w3.org/2000/svg' width='16' height='16' fill='currentColor' class='bi bi-check' viewBox='0 0 16 16'><path d='M10.97 4.97a.75.75 0 0 1 1.07 1.05l-3.99 4.99a.75.75 0 0 1-1.08.02L4.324 8.384a.75.75 0 1 1 1.06-1.06l2.094 2.093 3.473-4.425a.267.267 0 0 1 .02-.022z'/></svg></span>
                                     	<span id="cf_num_check2" class="check" hidden>번호가 일치하지 않습니다.</span>
									</div>
								</div>
								<div class="col-md-4">
									<input type="button" id="cf_num_btn" value="확인" class="btn btn-primary rounded submit p-3"><br>
								</div>
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
									<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" id="post_btn" class="btn btn-primary rounded submit p-3"> <br>
								</div>
								<div class="col-md-8">
									<input class="form-control"  type="text" id="sample6_address" name="addr2" placeholder="주소" required>&nbsp;
									<input class="form-control"  type="text" id="sample6_detailAddress" name="addr3" placeholder="상세주소" required> <br>
								</div>
								<div class="col-md-12">
									<div class="form-group d-flex">
										<button type="submit"
											class="btn btn-primary rounded submit p-3">Sign Up</button>
									</div>
								</div>
								
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>

	<script src="js/jquery.min.js"></script>
	<script src="js/popper.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/main.js"></script>
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
<!-- 카카오 우편번호 api -->

</body>
</html>

							