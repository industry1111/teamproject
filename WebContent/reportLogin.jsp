<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="css/login.css">
<link rel="stylesheet" type="text/css" href="css/util.css">
<link rel="icon" type="image/png" href="images/icons/favicon.ico" />
<script src="login.js"></script>
<style type="text/css">
.myButton {
	box-shadow: inset 0px 1px 0px 0px #ffffff;
	background: linear-gradient(to bottom, #ffffff 5%, #f6f6f6 100%);
	background-color: #ffffff;
	border-radius: 6px;
	border: 1px solid #dcdcdc;
	display: inline-block;
	color: #666666;
	font-family: Arial;
	font-size: 15px;
	font-weight: bold;
	position: absolute;
	bottom: 8px;
	right: 16px;
	text-decoration: none;
	text-shadow: 0px 1px 0px #ffffff;
}
</style>

<head>
<title>Login</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
				<div class="login100-form-title"
					style="background-image: url(images/bg-01.jpg);">
					<span class="login100-form-title-1"> LOGIN </span>
				</div>

				<form class="login100-form validate-form" action="./ReportLoginAcion.st">
					<div class="wrap-input100 validate-input m-b-26"
						data-validate="Username is required">
						<span class="label-input100">UserID</span> <input class="input100"
							type="text" id="id" name="id" placeholder="Enter userid">
						<span class="focus-input100"></span>
					</div>
					<input type="hidden" value="<%=request.getParameter("product_num")%>" name="product_num">
					<div class="wrap-input100 validate-input m-b-18"
						data-validate="Password is required">
						<span class="label-input100">Password</span> <input
							class="input100" type="password" id="pw" name="pw"
							placeholder="Enter password"> <span
							class="focus-input100"></span>
					</div>
					<div class="col-md-12"></div>

					<br> <br>

					<div class="container-login100-form-btn">
						<button class="login100-form-btn" type="submit">Login</button>
					</div>
				</form>
				<div class="row">
					<div class="col-md-12" align="right">
						<a href="./findId.me">Forgot ID?</a>&nbsp;&nbsp;&nbsp;
						<a href="./findPw.me">Forgot Password?</a>&nbsp;&nbsp;
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>