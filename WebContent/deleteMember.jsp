<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>탈퇴화면</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	var contextPath = "${pageContext.request.contextPath}";
</script>
<script src="js/deleteMember.js"></script>
<style type="text/css">

.check {
	color: red;
	font-size: 13px;
}

.check2 {
	color: green;
	font-size: 13px;
}
input[type="password"] {
  width: 70%;
  border: none;
  background: #F6F6F6;
  border-radius: 4px;
  margin: 8px 0;
  outline: none;
  padding: 8px;
  box-sizing: border-box;
  transition: 0.3s;
}

input[type="password"]:focus {
  border-color: dodgerBlue;
  box-shadow: 0 0 8px 0 dodgerBlue;
}

.inputWithIcon input[type="password"] {
  padding-left: 40px;
}

.inputWithIcon {
  position: relative;
}

</style>
</head>
<body>
	
	<div class="container" >
			<div class="row " >
				<div class="col-md-12"  >
					<div class="product-name d-flex " style="background-color: #c5c5c5 !important;" >
							<div class="col-md-2">회원 탈퇴</div>
					</div>
				</div>
			</div>
		</div>
	<table style="margin-left: auto; margin-right: auto; margin-top: 200px">
		<tr>
			<td>
				<div>
					<p>
						<input type="password" id="pw" name="pw"/> 
						<span id="pw2_check" class="check2" style="border: 0;"></span><br>
						<span id="pw2_check2" class="check"></span>
					</p>
					<p class="contxt_desc">비밀번호를 입력해야 회원탈퇴가 가능합니다.</p>
					<input type="button" id="pw_btn" value="회원탈퇴" class="myButton">
				</div>
			</td>
		</tr>
	</table>
	

</body>
</html>