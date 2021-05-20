<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<c:set var="center" value="main.jsp"></c:set>
<title>seller</title>
<!-- 템플릿 고르는 팝업창 -->
<script type="text/javascript">
	function popup(){
		var url ="joinSellerTemplete.jsp";
		var name ="joinSellerTempete";
		window.open("joinSellerTemplete.jsp", "joinSellerTempete", "width=1000,height=1000,toolbar=no,status=no,location=no,scrollbars=yes,menubar=no,resizable=yes,left=50,right=50");
		
	}
</script>
</head>

<body>
<!-- 판매자 등록 창 -->
<div id="seller" style="text-align: center">
	<form action="joinSellerProc.jsp" id="regsiter">
		<h1>판매자 등록</h1>
		<p>
			스토어 이름  <input type="text" name="store_name" />
			 <span id="storename_check" class="check"></span>
		</p>
		<p>
			<tr>
				<td valign="top">카테고리 
					<select name="items1">
						<option value="A">A</option>
						<option value="B">B</option>
						<option value="C">C</option>
					</select>
				</td>
			</tr>
		</p>
		<p>
			프로필 이미지 <input type="file" name="fileName"/>
		</p>
		<p>
			<input type="text">
			<input type="button" value="템플릿 선택하기" onclick="popup()">
			
		</p>
		<p>
			계좌 <input type="text" name="store_account"/>
		</p>
		<p class="signin button">
			<input type="submit" id="joinSeller" value="가입하기" />
		</p>
	</form>
	</div>
</div>




</body>
</html>
