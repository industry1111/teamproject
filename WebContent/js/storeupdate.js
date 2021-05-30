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
		var store_c_num = $("#store_c_num").val();
		$(this).attr("hidden", true);
		$("#store_c_num").removeAttr("disabled");
		$("#store_c_num").focus();
		$(".store_c_num_btn").removeAttr("hidden");
		$("#store_c_num").removeAttr("selected");
		
		$("#store_c_num_cancle").on("click", function() {
			$("#store_c_num_btn").removeAttr("hidden");
			$(".store_c_num_btn").attr("hidden", true);
			$("#store_c_num").attr("disabled", true);
			$("#store_c_num").val(store_c_num);
			$("#store_c_num_check2").text("");
			$("#store_c_num_check").text("");
		});
		
		$("#store_c_num").on("click",function(){
			var new_store_c_num = $(this).val();
			$("#store_c_num_update").on("click",function() {
				$.ajax({
					
					type:"post",
					async:true,
					url : contextPath + "/StoreInfoUpdateAction",
					data: {
						
						store_c_num : new_store_c_num,
						command : "new_store_c_num"
							
					},
					success : function(){
						$("#store_c_num_btn").removeAttr("hidden");
						$(".store_c_num_btn").attr("hidden", true);
						$("#store_c_num").attr("disabled", true);
						$("#store_c_num_check2").text("");
						$("#store_c_num_check").text("");
					}
				});
			});
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
				var new_template = $(":input:radio[name=template]:checked").val();
	
						$.ajax({
							type: "post",
							async: true,
							url: contextPath + "/StoreInfoUpdateAction",
							data: {
								template: new_template,
								command: "new_template",
							},
							dataType: "text",
							success: function() {
								
								$(".template").attr("hidden", true);
								$("#template_btn").removeAttr("hidden");
								$("#template").attr("disabled", true);
//								$("#template_o").attr("src","template/"+new_template+".jpg");
//								$("#template2_o").attr("src","template/"+new_template+"-2.jpg");
								location.reload();
								
							}
							
						});
				});	
		
			});
	
	//프로필 이미지
	$("#img_btn").on("click",function(){
		
		var img = $("#preview").val();
		
		$(".profile_img").removeAttr("hidden");
		$(".img_btn").removeAttr("hidden");
		$("#img_btn").attr("hidden",true);
		
		$("#img_btn_cancle").on("click",function(){
			
			$(".profile_img").attr("hidden",false);
			$(".img_btn").attr("hidden",true);
			$("#img_btn").removeAttr("hidden");
			$("#preview").val(img);
			
		});
		
	
		$("#profile_img").change(function(){
			
			setImageFromFile(this, '#preview');
			
			
			$("#img_btn_update").on("click",function(){
				
				var form = new FormData();
				form.append("profile_img",$("#profile_img")[0].files[0]);
				
				$.ajax({
					
					type:"post",
					aysnc:true,
					url : contextPath + "/ProfileImageUpdateAction",
					data : form,
					
					processData: false,
					contentType: false,
					success : function(){
						
						$(".profile_img").attr("hidden",true);
						$(".img_btn").attr("hidden",true);
						$("#img_btn").removeAttr("hidden");
						
					}

				});
				
				
			});
			
			
			
			
		});
		
		function setImageFromFile(input, expression) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();
				reader.onload = function (e) {
					$(expression).attr('src', e.target.result);
				}
				reader.readAsDataURL(input.files[0]);
			}
		}
	});
	
	
	$("#")
});/**
 * 
 */