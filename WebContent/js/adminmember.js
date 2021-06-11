var store_nameReg = /^[가-힣a-zA-Z]+$/;
var accountReg = /^[0-9]{10,11}$/;

var check = 0;

$(function() {
	
	//account
	$("#edit_btn").on("click",function() {
		var edit_btn = $("#edit_btn").val();
		
		$(this).attr("hidden", true);
		$("#edit_btn").removeAttr("disabled");
		$("#edit_btn").focus();
		$(".edit_btn").removeAttr("hidden");
		
		$("#ok_btn").on("click", function() {
			$(".ok_btn").attr("hidden", true);
			$("#ok_btn").removeAttr("hidden");
			$("#ok_btn").attr("disabled", true);
			$("#ok_btn").val(ok_btn);
			$("#member_code_check").text("");
			$("#member_code_check2").text("");
		});
		
		$("#account").blur(function() {
			var new_account = $(this).val();
			if(account == new_account){
				$("#account_check").text("이전의 계좌번호와 동일 합니다.");
				$("#account_check2").text("")
				
			}else{
//				if (accountReg.test(new_account)) {
					$("#account_check2").text("변경가능한 계좌번호 입니다.")
					$("#account_check").text("");
					check = 1;
//				}else{
//					$("#account_check").text("입력하신 계좌번호가 맞는지 한번 더 확인해주세요.")
//					$("#account_check2").text("");
////				}
			}
			$("#account_update").on("click",function() {
				if(check == 1){
					$.ajax({
						type: "post",
						async: true,
						url: contextPath + "/StoreInfoUpdateAction",
						data: {
							account: new_account,
							command: "new_account",
						},
						dataType: "text",
						success: function() {
							
							$(".account").attr("hidden", true);
							$("#account_btn").removeAttr("hidden");
							$("#account").attr("disabled", true);
							$("#account_check").text("");
							$("#account_check2").text("");


						}
						
					});
				}
			});
		});
});
	
	$("#")
});