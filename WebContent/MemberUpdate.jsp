<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<script src="js/memberupdate.js"></script>
<script>var contextPath = "${pageContext.request.contextPath}";</script>
<head>
<title>현재 유저정보 출력화면</title>
<jsp:useBean id="mdto" class="com.member.memberDTO"/>
<jsp:setProperty property="*" name="mdto"/>
<style type="text/css">

.myButton {
	box-shadow:inset 0px 1px 0px 0px #ffffff;
	background:linear-gradient(to bottom, #ffffff 5%, #f6f6f6 100%);
	background-color:#ffffff;
	border-radius:6px;
	border:1px solid #dcdcdc;
	display:inline-block;
	cursor:pointer;
	color:#666666;
	font-family:Arial;
	font-size:15px;
	font-weight:bold;
	padding:6px 24px;
	text-decoration:none;
	text-shadow:0px 1px 0px #ffffff;
}
.myButton:hover {
	background:linear-gradient(to bottom, #f6f6f6 5%, #ffffff 100%);
	background-color:#f6f6f6;
}
.myButton:active {
	position:relative;
	top:1px;
}

.check{
	color: red;
	font-size: 3px;
}
.check2{
	color: green;
	font-size: 3px;
}
</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>

	<p style="font-size: 20; color: gray;">회원정보 수정</p>
	<form method="post" id="form">
		<table border="0" class="tbl_model">
			<tbody>
				<tr>
					<th width="30%">
						<div>사용자 아이디</div>
					</th>
					<td>
						<div>
							<p class="contxt_tit">
								<input type="text" id="id" name="id" value="${id}" disabled="disabled"><br>
								<span id="id_check" class="check"></span>
                                <span id="id_check2" class="check2"></span>
							</p>
							<p class="contxt_desc">아이디는 30일에 한 번 변경하실 수 있습니다.</p>
							<input type="hidden" name="date" value="${date}" >
							<p>
								<input type="button" id="id_btn" value="수정" class="myButton"/>
							</p>
							<p class="id_update" hidden>
								<input id="id_cancle" type="button" value="수정 취소" class="myButton"/> <input
									id="id_update" type="button" value="수정 완료" class="myButton"/>
							</p>
						</div>
					</td>
				</tr>
				<tr>
					<th>
						<div>사용자 이름</div>
					</th>
					<td>
						<div>
							<p class="contxt_tit">
								<input type="text" id="name" name="name" value="${name}" disabled="disabled" maxlength="5"><br>
								<span id="name_check" class="check"></span>
                                <span id="name_check2" class="check2"></span>
							</p>
							<p class="contxt_desc">이름이나 생년월일, 성별 등의 정보가 변경되었다면 본인확인을 통해
								정보를 수정할 수 있습니다</p>
							<p>
								<input type="button" id="name_btn" value="수정" class="myButton"/>
							</p>
							<p class="name" hidden>
								<input class="name_cancle" type="button" value="수정 취소" class="myButton"/> <input
									class="name_update" type="button" value="수정 완료" class="myButton"/>
							</p>
						</div>
					</td>
				</tr>
				<tr>
					<th>
						<div>비밀번호</div>
					</th>
					<td>
						<div class="pass_div" >
							<p>
								현재 비밀번호<br> <input type="password" id="pw" name="pw" />
							    <span id="pw_check" class="check2"></span>
								<br>
								<span id="pw_check2" class="check"></span>
                       
							</p>
							<p class="contxt_desc">현재 비밀번호를 입력해야 비밀번호를 변경하실 수 있습니다.</p>
							<p>
								변경할 비밀번호<br> <input type="password" id="new_pw" name="new_pw" disabled="disabled"/><br>
								<span id="new_pw_check" class="check"></span>
                                <span id="new_pw_check2" class="check2"></span>
							</p>
							<p>
								변경할 비밀번호 확인<br> <input type="password" id="new_pw_confirm" name="new_pw_confirm" disabled="disabled" /><br>
								<span id="new_pw_confirm_check" class="check"></span>
                                <span id="new_pw_confirm_check2" class="check2"></span>
							</p>
							<p>
								<input type="button" value="수정" class="myButton"/> 
							</p>

						</div>
					</td>
				</tr>
				<tr>
					<th>
						<div>휴대전화</div>
					</th>
					<td>
						<div>
							<p class="contxt_tit">
								<input type="text" id="phone" name="phone" value="${mdto.phone }" disabled="disabled"
									style="border: 0" maxlength="11"><br>
								<span id="phone_check" class="check"></span>
                                <span id="phone_check2" class="check2"></span>
							</p>
							<p class="contxt_desc">아이디, 비밀번호 찾기 등 본인확인이 필요한 경우 사용할 전화
								입니다.</p>
							<p>
								<input type="button" id="phone_btn" value="수정" class="myButton"/>
							</p>
							<p class="phone" hidden>
								<input class="phone_cancle" type="button" value="수정 취소" class="myButton"/> <input
									class="phone_update" type="button" value="수정 완료" class="myButton"/>
							</p>
						</div>
					</td>
				</tr>
				<tr>
					<th>
						<div>이메일</div>
					</th>
					<td>
						<div>
							<p class="contxt_tit">
								<input type="text" id="email" name="email" value="${mdto.email }" disabled="disabled"
									style="border: 0"><br>
								<span id="email_check" class="check"></span>
                                <span id="email_check2" class="check2"></span>	
							</p>
							<p class="contxt_desc">블로그의 안내에 대해 전달 받을 이메일
								주소 입니다.</p>
							<p>
								<input type="button" id="email_btn" value="수정" class="myButton" />
							</p>
							<p class="email" hidden>
								<input class="email_cancle" type="button" value="수정 취소" class="myButton"/> <input
									class="email_update" type="button" value="수정 완료" class="myButton"/>
							</p>
						</div>
					</td>
				</tr>
				<tr>
					<th>
						<div>주소</div>
					</th>
					<td>
						<p>
						<div>
							우편번호&nbsp;<input type="text" id="addr1" name="addr1" value="${mdto.addr1}" disabled="disabled"/>
						</div>
						<div>
							주소		<input type="text" id="addr1" name="addr1" value="${mdto.addr2}" disabled="disabled" style="border: 0"/>
						</div>
						<div>
							상세주소&nbsp;<input type="text" id="addr1" name="addr1" value="${mdto.addr3}" disabled="disabled"/>
						</div>
						</p>
					<p>
						<input type="button" id="address_btn" value="수정" class="myButton" />
					</p>
					</td>
				</tr>
			</tbody>
		</table>
		<input type="hidden" name="member_num" value="${mdto.member_num}">
	</form>
</body>
</html>