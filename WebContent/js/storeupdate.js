var store_nameReg = /^[가-힣a-zA-Z]+$/;
var accountReg = /^[0-9]{10,11}$/;

var check = 0;

$(function() {
	
	//store_name
	$("#store_name_btn").on("click",function() {
		var store_name = $("#store_name").val();
		$(this).attr("hidden",true);
		$("#store_name").removeAttr("disabled");
		$("#store_name").focus();
		$(".store_name").removeAttr("hidden");
		
		$("#store_name_cancle").on("click", function() {
			$(".store_name").attr("hidden", true);
			$("#store_name_btn").removeAttr("hidden");
			$("#store_name").val(store_name);
			$("#store_name").attr("disabled", true);
			$("#store_name_check2").text("");
			$("#store_name_check").text("");
		});
		$("#store_name").blur(function() {
			var new_store_name = $(this).val();
			if(store_name == new_store_name){
				$("#store_name_check").text("이전의 스토어명과 동일 합니다.");
				$("#store_name_check2").text("");
			}else{
				
//				if (store_nameReg.test(new_store_name)) {
					
					$.ajax({
						type: "post",
						async: true,
						url: contextPath + "/StoreInfoUpdateCheck",
						data: {
							store_name: new_store_name,
							command: "new_store_name",
						},
						dataType: "text",
						success: function(data) {
							if(data == 0){
								$("#store_name_check2").text("사용가능합니다.");
								$("#store_name_check").text("");
								check = 1;
							}else{
								$("#store_name_check").text("이미 사용하고 있는 이름입니다.");
								$("#store_name_check2").text("");
								check = 0;
							}
						}
					});
//				} else {
//					$("#store_name_check").text("다시 작성해 주세요.");
//					$("#store_name_check2").text("");
//					check = 0;
//				}
			}
			$("#store_name_update").on("click",function() {
				if(check == 1){
					$.ajax({
						type: "post",
						async: true,
						url: contextPath + "/StoreInfoUpdateAction",
						data: {
							store_name: new_store_name,
							command: "new_store_name",
						},
						dataType: "text",
						success: function() {
							$("#store_name_btn").removeAttr("hidden");
							$(".store_name").attr("hidden",true);
							$("#store_name").attr("disabled",true);
							$("#store_name_check2").text("");
							$("#store_name_check").text("");
							
						}
						
					});
				}
			});
		});
	});
	//account
	$("#account_btn").on("click",function() {
		var account = $("#account").val();
		
		$(this).attr("hidden", true);
		$("#account").removeAttr("disabled");
		$("#account").focus();
		$(".account").removeAttr("hidden");
		
		$("#account_cancle").on("click", function() {
			$(".account").attr("hidden", true);
			$("#account_btn").removeAttr("hidden");
			$("#account").attr("disabled", true);
			$("#account").val(account);
			$("#account_check").text("");
			$("#account_check2").text("");
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
	
	//store_c_num
	$("#store_c_num_btn").on("click",function() {
		var category_num = $("#category_num").val();
		$(this).attr("hidden", true);
		$("#category_num").removeAttr("disabled");
		$("#category_num").focus();
		$(".store_c_num_btn").removeAttr("hidden");
		
		$("#store_c_num_cancle").on("click", function() {
			$(".store_c_num_btn").attr("hidden", true);
			$("#category_num").removeAttr("hidden");
			$("#store_c_num").attr("disabled", true);
			$("#store_c_num").val(category_num);
			$("#store_c_num_check2").text("");
			$("#store_c_num_check").text("");
		});
		
		$("#store_c_num").blur(function(){
			var store_c_num2 = $(this).val();
			if(category_num == store_c_num2){
				$("#store_c_num_check").text("이전의 카테고리와 동일 합니다.");
				check = 0;
			}
		});
		$("#store_c_num_update").on("click",function() {
			if(check == 1){
				if(window.confirm("변경하시겠습니까?")){
					$("#form").attr("action","StoreInfoUpdateAction.me?command=store_c_num").submit();
				}
			}else{
				$("#store_c_num").focus();
			}
		});
	});
	
	//template
	$("#template_btn").on("click",function() {
	
		$(this).attr("hidden", true);
		$("#template").removeAttr("disabled");
		$("#template").focus();
		$(".template").removeAttr("hidden");
		
		$("#template_cancle").on("click", function() {
			$(".template").attr("hidden", true);
			$("#template_btn").removeAttr("hidden");
			$("#template").attr("disabled", true);
			$("#template").val(template);
			$("#template_check2").text("");
			$("#template_check").text("");
		});
		
	
			$("#template_update").on("click",function() {
				var template = $(":input:radio[name=template]:checked").val();
	
						$.ajax({
							type: "post",
							async: true,
							url: contextPath + "/StoreInfoUpdateAction",
							data: {
								template: template,
								command: "new_template",
							},
							dataType: "text",
							success: function() {
								
								$(".template").attr("hidden", true);
								$("#template_btn").removeAttr("hidden");
								$("#template").attr("disabled", true);
								$("#account_check").text("");
								$("#account_check2").text("");
							}
							
						});
				});	
		
			});
	
	$("#")
});/**
 * 
 */