<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	var contextPath = "${pageContext.request.contextPath}";
</script>
<script src="js/memberupdate.js"></script>

<head>
<title>현재 유저정보 출력화면</title>

<style type="text/css">
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

.check {
	color: red;
	font-size: 13px;
}

.check2 {
	color: green;
	font-size: 13px;
}
input[type="text"] {
  width: 30%;
  border: 2px solid DarkGray;
  border-radius: 4px;
  margin: 8px 0;
  outline: none;
  padding: 8px;
  box-sizing: border-box;
  transition: 0.3s;
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

</style>
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
								<input type="text" id="id" name="id" value="${id}"
									disabled="disabled"><br> <span id="id_check"
									class="check"></span> <span id="id_check2" class="check2"></span>
							</p>
							<p class="contxt_desc">아이디는 30일에 한 번 변경하실 수 있습니다.</p>
							<input type="hidden" id="date" value="${mdto.date}"> 
							<p>
								<input type="button" id="id_btn" value="수정" class="myButton" />
							</p>
							<p class="id_update" hidden>
								<input id="id_cancle" type="button" value="수정 취소"
									class="myButton" /> <input id="id_update" type="button"
									value="수정 완료" class="myButton" />
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
								<input type="text" id="name" name="name" value="${mdto.name}"
									disabled="disabled" maxlength="5"><br> <span
									id="name_check" class="check"></span> <span id="name_check2"
									class="check2"></span>
							</p>
							<p class="contxt_desc">이름이나 생년월일, 성별 등의 정보가 변경되었다면 본인확인을 통해
								정보를 수정할 수 있습니다</p>
							<p>
								<input type="button" id="name_btn" value="수정" class="myButton" />
							</p>
							<p class="name" hidden>
								<input id="name_cancle" type="button" value="수정 취소"
									class="myButton" /> <input id="name_update" type="button"
									value="수정 완료" class="myButton" />
							</p>
						</div>
					</td>
				</tr>
				<tr>
					<th>
						<div>비밀번호</div>
					</th>
					<td>
						<div class="password" hidden>
							<p>
								현재 비밀번호<br> <input type="password" id="pw" name="pw" /> <span
									id="pw_check" class="check2"></span> <br> <span
									id="pw_check2" class="check"></span>

							</p>
							<p class="contxt_desc">현재 비밀번호를 입력해야 비밀번호를 변경하실 수 있습니다.</p>
							<p>
								변경할 비밀번호<br> <input type="password" id="new_pw"
									name="new_pw" disabled="disabled" /><br> <span
									id="new_pw_check" class="check"></span> <span
									id="new_pw_check2" class="check2"></span>
							</p>
							<p>
								변경할 비밀번호 확인<br> <input type="password" id="new_pw_confirm"
									name="new_pw_confirm" disabled="disabled" /><br> <span
									id="new_pw_confirm_check" class="check"></span> <span
									id="new_pw_confirm_check2" class="check2"></span>
							</p>
							<p>
								<input id="pw_cancle" type="button" value="수정취소"
									class="myButton" /> <input id="pw_update" type="button"
									value="수정완료" class="myButton" />
							</p>
						</div>
						<p>
							<input id="pw_btn" type="button" value="수정" class="myButton" />
						</p>
					</td>
				</tr>
				<tr>
					<th>
						<div>휴대전화</div>
					</th>
					<td>
						<div>
							<p class="contxt_tit">
								<input type="text" id="phone" name="phone" value="${mdto.phone}"
									disabled="disabled" maxlength="11"><br>
								<span id="phone_check" class="check"></span> <span
									id="phone_check2" class="check2"></span>
							</p>
							<p class="contxt_desc">아이디, 비밀번호 찾기 등 본인확인이 필요한 경우 사용할 전화
								입니다.</p>
							<p>
								<input type="button" id="phone_btn" value="수정" class="myButton" />
							</p>
							<p class="phone" hidden>
								<input id="phone_cancle" type="button" value="수정 취소"
									class="myButton" /> <input id="phone_update" type="button"
									value="수정 완료" class="myButton">
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
							<div class="col-md-8">
								<div class="form-group mb-4">
									<input type="text" id="email" name="email"
										value="${mdto.email}" disabled="disabled" style="width: 300px;"><br>
									<span id="email_check" class="check"></span> <span
										id="email_check2" class="check2"></span>
								</div>
							</div>
							<div class="email_check" hidden>
								<div class="col-md-4">
									<input type="button" id="email_cf_btn" value="인증 "
										class="myButton"> <br>
								</div>
								<div class="col-md-7">
									<div class="form-group mb-4">
										<input disabled="disabled" name="cf_num" id="cf_num"
											type="text" required="required" placeholder="Check">
										<span id="cf_num_check2" class="check" hidden>번호가 일치하지
											않습니다.</span>
									</div>
								</div>
								<div class="col-md-1">
									<span id="cf_num_check" class="check2" hidden><svg
											xmlns='http://www.w3.org/2000/svg' width='16' height='16'
											fill='currentColor' class='bi bi-check' viewBox='0 0 16 16'>
											<path
												d='M10.97 4.97a.75.75 0 0 1 1.07 1.05l-3.99 4.99a.75.75 0 0 1-1.08.02L4.324 8.384a.75.75 0 1 1 1.06-1.06l2.094 2.093 3.473-4.425a.267.267 0 0 1 .02-.022z' /></svg></span>
								</div>
								<div class="col-md-4">
									<input style="size: 30%" type="button" id="cf_num_btn"
										value="확인" class="myButton"><br>
								</div>
								</p>
							</div>
							<p class="contxt_desc">블로그의 안내에 대해 전달 받을 이메일 주소 입니다.</p>
							<p>
								<input type="button" id="email_btn" value="수정" class="myButton" />
							</p>
							<p class="email" hidden>

								<input id="email_cancle" type="button" value="수정 취소"
									class="myButton" /> <input id="email_update" type="button"
									value="수정 완료" class="myButton" />
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
						<div class="row">
							<div class="col-md-2">우편번호</div>
							<div class="col-md-9">
								<input type="text" id="addr1" name="addr1" value="${mdto.addr1}"
									disabled="disabled" style="width: 100px;"/>
							</div>
						</div>
						</p>
						<p>
						<div class="row">
							<div class="col-md-2">주소</div>
							<div class="col-md-9">
								<input type="text" id="addr2" name="addr2" value="${mdto.addr2}"
									disabled="disabled" style="width: 300px;"/>
							</div>
						</div>

						</p>
						<p>
						<div class="row">
							<div class="col-md-2">상세 주소</div>
							<div class="col-md-9">
								<input type="text" id="addr3" name="addr3" value="${mdto.addr3}"
									disabled="disabled" style="width: 300px;"/>
							</div>
						</div>
						</p>
						<div class="col-md-7" id="search" hidden>
							<input type="button" onclick="sample6_execDaumPostcode()"
								value="우편번호 찾기" id="post_btn" class="myButton"> <br>
						</div>
						<p>
							<input type="button" id="address_btn" value="수정" class="myButton" />
						</p>
						<p class="addr" hidden>
							<input type="button" id="addr_cancle" value="수정취소"
								class="myButton" /> <input type="button" id="addr_update"
								value="수정완료" class="myButton" />
						</p>
					</td>
				</tr>
			</tbody>
		</table>

	</form>
	<!-- 카카오 우편번호 api -->
	<script
		src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
		function sample6_execDaumPostcode() {
			new daum.Postcode({
				oncomplete : function(data) {
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
					document.getElementById('addr1').value = data.zonecode;
					document.getElementById("addr2").value = address;
					document.getElementById('addr1').setAttribute("disabled",
							true);
					document.getElementById("addr2").setAttribute("disabled",
							true);
					// 커서를 상세주소 필드로 이동한다.
					document.getElementById("addr3").focus();
				}
			}).open();
		}
	</script>
</body>
</html>