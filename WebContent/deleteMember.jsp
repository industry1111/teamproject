<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>탈퇴화면</title>
</head>
<body>
	<script>
		$("#pw2")
				.blur(
						function() {
							var pw2 = $(this).val();
							$
									.ajax({
										type : "post",
										async : true,
										url : contextPath + "/UpdateCheck",
										data : {
											param : pw2,
											command : "pw",
											member_num : member_num
										},
										dataType : "text",
										success : function(data) {
											if (data == "비밀번호 동일") {
												$("#pw2_check")
														.html(
																"<svg xmlns='http://www.w3.org/2000/svg' width='16' height='16' fill='currentColor' class='bi bi-check' viewBox='0 0 16 16'><path d='M10.97 4.97a.75.75 0 0 1 1.07 1.05l-3.99 4.99a.75.75 0 0 1-1.08.02L4.324 8.384a.75.75 0 1 1 1.06-1.06l2.094 2.093 3.473-4.425a.267.267 0 0 1 .02-.022z'/></svg>");
												$("#pw2_check2").text("");
												$("#pw2_btn").removeAttr(
														"disabled");
												$("#pw2")
														.attr("disabled", true);
											} else {
												$("#pw2_check2").text(data);
												$("#pw2_check").text("");
											}
										}
									});
						});
		$("#pw2_btn").click(function() {
			if (confirm("탈퇴하시겠습니까?")) {
				$("#form").attr("action", "MemberDeleteAction").submit();
			} else {
				$("#pw2_btn").attr("disabled", true);
				$("#pw2").removeAttr("disabled");
				$("#pw2").val("");
				$("#pw2_check2").text("");
				$("#pw2_check").text("");
			}
		});
		<script type="text/javascript">
		// 비밀번호 미입력시 경고창
		function checkValue() {
			if (!document.deleteForm.password.value) {
				alert("비밀번호를 입력하지 않았습니다.");
				return false;
			}
		}
	</script>
</head>
<body>

	<table style="margin-left: auto; margin-right: auto; margin-top: 300px">
		<tr>
			<p style="font-size: 30; color: gray;">회원탈퇴</p>
			<td>
				<div>
					<p>
						<input type="password" id="pw2" name="pw2" /> <span
							id="pw2_check" class="check2"></span> <br> <span
							id="pw2_check2" class="check"></span>
					</p>
					<p class="contxt_desc">비밀번호를 입력해야 회원탈퇴가 가능합니다.</p>
					<input type="button" id="pw2_btn" value="회원탈퇴" disabled="disabled">
				</div>
			</td>
		</tr>
	</table>

</body>
</html>