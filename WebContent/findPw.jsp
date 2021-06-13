<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
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

</head>

<body>

<body>
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
				<div class="login100-form-title" style="background-image: url(images/bg-01.jpg);">
					<span class="login100-form-title-1">Enter your Name and email<br>below to find your password.</span>
				</div>

				<form class="login100-form validate-form" action="" >
					<div class="wrap-input100 validate-input m-b-26" data-validate="Name is required">
						<span class="label-input100">Name</span> 
						<input class="input100" type="text" id="name" name="name" placeholder="Enter your Name">
						<span class="focus-input100"></span>
					</div>
					
					<div class="wrap-input100 validate-input m-b-18" data-validate="Email is required">
						<span class="label-input100">ID</span> 
						<input class="input100" type="text" id="id" name="id" placeholder="Enter your ID">
						<span class="focus-input100"></span>
					</div>
					
					<div class="col-md-12"></div>

					<br> <br>

					<div class="container-login100-form-btn">
						<button class="login100-form-btn" type="button" onclick="location.href='./login.jsp'">Back</button>
						<div class="col-md-4" >
							<input type="button" id="continue" class="login100-form-btn" value="Continue"/>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>



</body>
</html>