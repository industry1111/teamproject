$(function() {
	var contextPath = "${pageContext.request.contextPath}";
	var store_nameReg = /^[A-Za-z0-9]{8,20}$/;
	var accountReg = /^[0-9]{10,11}$/;
	var store_c_numReg = /^[가-힣]{2,5}$/;
	var templateReg = /^[가-힣]{2,5}$/; 
	var	profile_imgReg = /^[A-Za-z0-9]{8,20}$/;
	var check = 0;
	
	//store_name
	$("#store_name_btn").on("click",function() {
		var store_name = $("#store_name").val();
		$(this).attr("hidden",true);
		$("#store_name").removeAttr("disabled");
		$("#store_name").focus();
		$(".store_name").removeAttr("hidden");
		$(".store_name_cancle").on("click", function() {
			$(".store_name").attr("hidden", true);
			$("#store_name_btn").removeAttr("hidden");
			$("#store_name").val(store_name);
			$("#store_name").attr("disabled", true);
			$("#store_name_check2").text("");
			$("#store_name_check").text("");
		});
		$("#store_name").blur(function() {
			var store_name2 = $(this).val();
			if(store_name == store_name2){
				$("#store_name_check").text("이전의 스토어명과 동일 합니다.");
				check = 0;
			}else{
				if (store_nameReg.test(store_name2)) {
					$.ajax({
						type: "post",
						async: true,
						url: contextPath + "/StoreInfoUpdate",
						data: {
							param: store_name2,
							command: "store_name",
						},
						dataType: "text",
						success: function(data) {
							if(data == "사용가능한 스토어명입니다."){
								$("#store_name_check2").text(data);
								$("#store_name_check").text("");
								check = 1;
							}else{
								$("#store_name_check").text(data);
								$("#store_name_check2").text("");
								check = 0;
							}
						}
					});
				} else {
					$("#store_name_check").text("특수문자 한글 제외  8~20자 이내로 작성해 주세요");
					$("#store_name_check2").text("");
					check = 0;
				}
			}
		});
		$(".store_name_update").on("click",function() {
			if(check == 1){
				if(window.confirm("변경하시겠습니까?")){
					$("#form").attr("action","StoreInfoUpdateAction.me?command=store_name").submit();
				}
			}else{
				$("#store_name").focus();
			}
		});
	});
	
	//account
	$("#account_btn").on("click",function() {
		var phone = $("#account").val();
		$(this).attr("hidden", true);
		$("#account").removeAttr("disabled");
		$("#account").focus();
		$(".account").removeAttr("hidden");
		$(".account_cancle").on("click", function() {
			$(".account").attr("hidden", true);
			$("#account_btn").removeAttr("hidden");
			$("#account").attr("disabled", true);
			$("#account").val(account);
			$("#account_check").text("");
			$("#account_check2").text("");
		});
		
		$("#account").blur(function() {
			var account2 = $(this).val();
			if(account == account2){
				$("#account_check").text("이전의 계좌번호와 동일 합니다.");
				check = 0;
			}else{
				if (accountReg.test(account2)) {
					$.ajax({
						type: "post",
						async: true,
						url: contextPath + "/StoreInfoUpdate",
						data: {
							param: account2,
							command: "account",
						},
						dataType: "text",
						success: function(data) {
							if(data == "다른 계정에서 사용하고 있는 번호입니다."){ //수정해야함
								$("#account_check").text(data);
								$("#account_check2").text("");
								check = 0;
							}else{
								$("#account_check2").text(data);
								$("#account_check").text("");
								check = 1;
							}
						},
					});
				}else{
					$("#account_check").text("입력하신 계좌번호가 맞는지 한번 더 확인해주세요.")
					$("#account_check2").text("");
					check = 0;
				}
			}
		});
		$(".account_update").on("click",function() {
			if(check == 1){
				if(confirm("변경하시겠습니까?")){
					$("#form").attr("action","StoreInfoUpdateAction.me?command=account").submit();
				}
			}else{
				$("#account").focus();
			}
		});
});
	
	//store_c_num
	$("#store_c_num_btn").on("click",function() {
		var store_c_num = $("#store_c_num").val();
		$(this).attr("hidden", true);
		$("#store_c_num").removeAttr("disabled");
		$("#store_c_num").focus();
		$(".store_c_num").removeAttr("hidden");
		$(".store_c_num_cancle").on("click", function() {
			$(".store_c_num").attr("hidden", true);
			$("#store_c_num_btn").removeAttr("hidden");
			$("#store_c_num").attr("disabled", true);
			$("#store_c_num").val(store_c_num);
			$("#store_c_num_check2").text("");
			$("#store_c_num_check").text("");
		});
		$("#store_c_num").blur(function(){
			var store_c_num2 = $(this).val();
			if(store_c_num == store_c_num2){
				$("#store_c_num_check").text("이전의 카테고리와 동일 합니다.");
				check = 0;
			}else{
				if(store_c_numReg.test(store_c_num2)){
					$("#store_c_num_check2").text("사용가능합니다.");
					$("#store_c_num_check").text("");
					check = 1;
				}else{
					$("#store_c_num_check").text("카테고리명은 2~5자이내로 한글만 가능합니다");
					$("#store_c_num_check2").text("");
					check = 0;
				}
			}
		});
		$(".store_c_num_update").on("click",function() {
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
		var name = $("#template").val();
		$(this).attr("hidden", true);
		$("#template").removeAttr("disabled");
		$("#template").focus();
		$(".template").removeAttr("hidden");
		$(".template_cancle").on("click", function() {
			$(".template").attr("hidden", true);
			$("#template_btn").removeAttr("hidden");
			$("#template").attr("disabled", true);
			$("#template").val(template);
			$("#template_check2").text("");
			$("#template_check").text("");
		});
		$("#template").blur(function(){
			var template2 = $(this).val();
			if(template == template2){
				$("#template_check").text("이전의 템플릿과 동일 합니다.");
				check = 0;
			}else{
				if(templateReg.test(template2)){
					$("#template_check2").text("사용가능합니다.");
					$("#template_check").text("");
					check = 1;
				}else{
					$("#template_check").text("새로운 템플릿을 선택해주세요.");
					$("#template_check2").text("");
					check = 0;
				}
			}
		});
		$(".template_update").on("click",function() {
			if(check == 1){
				if(window.confirm("변경하시겠습니까?")){
					$("#form").attr("action","StoreInfoUpdateAction.me?command=template").submit();
				}
			}else{
				$("#template").focus();
			}
		});	
	});
});
		
		