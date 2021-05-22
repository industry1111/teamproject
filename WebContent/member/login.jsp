<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/member/login.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/member/util.css">
<link rel="icon" type="image/png" href="images/icons/favicon.ico"/>



<head>
	<title>Login</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
	<header>
		<jsp:include page="../header.jsp"/>
	</header>
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
				<div class="login100-form-title" style="background-image: url(images/bg-01.jpg);">
					<span class="login100-form-title-1">
						LOGIN
					</span>
				</div>

				<form class="login100-form validate-form" action="./MemberLoginAction.me">
					<div class="wrap-input100 validate-input m-b-26" data-validate="Username is required">
						<span class="label-input100">UserID</span>
						<input class="input100" type="text" id="id" name="id" placeholder="Enter userid">
						<span class="focus-input100"></span>
					</div>

					<div class="wrap-input100 validate-input m-b-18" data-validate = "Password is required">
						<span class="label-input100">Password</span>
						<input class="input100" type="password" id="pw" name="pw" placeholder="Enter password">
						<span class="focus-input100"></span>
					</div>
					<div class="col-md-12">

					</div>
						
					<br><br>

					<div class="container-login100-form-btn">
						<button class="login100-form-btn" type="submit">
							Login
						</button>
						<div class="col-md-4">
							<a href="./MemberJoin.me" class="login100-form-btn">
								회원가입
							</a>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<footer>
		<jsp:include page="../footer.jsp"/>
	</footer>

</body>
</html>