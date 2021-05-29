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
</head>
<body>
	
	<table style="margin-left: auto; margin-right: auto; margin-top: 300px">
		<tr>
			<p style="font-size: 30; color: gray;">회원탈퇴</p>
			<td>
				<div>
					<p>
						<input type="password" id="pw" name="pw"/> 
						<span id="pw2_check" class="check2"></span><br>
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