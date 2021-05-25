
var nameReg = /^[가-힣]{2,5}$/;
var idReg = /^[A-Za-z0-9]{6,15}$/;
var pwReg = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&])[A-Za-z\d$@$!%*?&]{8,20}/;
var emailReg = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[a-zA-Z_-]+){1,2}$/;
var phoneReg = /^01(?:0|1)([0-9]){7,8}$/;
var check = 0;

$(function() {
	
	var member_num = $("#member_num").val();
	
	$("#id_btn").on("click", function() {
		var id = $("#id").val();
		$(this).attr("hidden", true);
		$("#id").removeAttr("disabled");
		$("#id").focus();
		$(".id_update").removeAttr("hidden");

		$("#id_cancle").on("click", function() {
			$(".id_update").attr("hidden", true);
			$("#id").val(id);
			$("#id").attr("disabled", true);
			$("#id_btn").removeAttr("hidden");
			$("#id_check2").text("");
			$("#id_check").text("");
		});

		$("#id").blur(function() {
			var update_id = $(this).val();
			if (id == update_id) {
				$("#id_check").text("이전의 아이디와 동일합니다.");
				$("#id_check2").text("");
				check = 0;
			} else {

				if (idReg.test(update_id)) {

					$.ajax({
						type : "post",
						async : "true",
						url : contextPath + "/UpdateCheck",
						data : {
							param : update_id,
							command : "id"

						},
						dataType : "text",
						success : function(data) {
							if (data == 0) {
								$("#id_check2").text("사용가능한 아이디 입니다.");
								$("#id_check").text("");
								check=1;
							} else {
								$("#id_check").text("중복된 아이디입니다.");
								$("#id_check2").text("");
							}
						}
					});

				} else {
					$("#id_check").text("특수문자 한글 제외  8~20자 이내로 작성해 주세요");
					$("#id_check2").text("");
				}
			}
				$("#id_update").on("click", function() {
					$.ajax({
						type:"post",
						async:"true",
						url : contextPath + "/MemberUpdateAction",
						data : {
							
								id : update_id,
								member_id : member_id,
								command : "update_id"
						},
						dataType : "text",
						success : function(){
							$("#id").attr("disabled",true);
							$(".id_update").attr(hidden);
							$("#id_btn").removeAttr(hidden);
						}
					});
					
				});
		});
				
});

	$("#phone_btn").on("click", function() {
		var phone = $("#phone").val();
		$(this).attr("hidden", true);
		$("#phone").removeAttr("disabled");
		$("#phone").focus();
		$(".phone").removeAttr("hidden");

		$("#phone").blur(function() {
			var new_phone = $(this).val();
			if (phone == new_phone) {
				$("#phone_check").text("이전의 번호와 동일합니다.");
				$("#phone_check2").text("");
			}else{
				
				if(phoneReg.test(new_phone)){
				
					$.ajax({
						
						type : "post",
						async : true,
						url : contextPath + "/UpdateCheck",
						data : {
							
							param : new_phone,
							command : "phone"
						},
						dataType:"text",
						success : function(data){
							if(data==1){
								$("#phone_check").text("사용중인 번호입니다.");
								$("#phone_check2").text("");
							}else{
								$("#phone_check2").text("사용가능한 번호입니다.");
								$("#phone_check").text("");
								check = 1;
							}
						}
						
					});

				}else{
					$("#phone_check").text("번호를 올바르게 작성해주세요.");
					$("#phone_check2").text("");
				}
				
				
					$("#phone_update").on("click",function(){
						if(check==1){
							
							$.ajax({
								
								type:"post",
								async:true,
								url:contextPath + "/MemberUpdateAction",
								data:{
									phone : new_phone,
									member_num : member_num,
									command : "new_phone"
								},
								dataType:"text",
								success : function(){
									
										$("#phone_check2").text("");
										$("#phone_check").text("");
										$(".phone").attr("hidden",true);
										$("#phone_btn").attr("hidden",false);
										$("#phone").attr("disabled",true);
									
								}
							});
						}
					});
			}
			
			
		});

		$("#phone_cancle").on("click", function(){
			$(".phone").attr("hidden", true);
			$("#phone").val(phone);
			$("#phone").attr("disabled", true);
			$("#phone_btn").removeAttr("hidden");
			$("#phone_check2").text("");
			$("#phone_check").text("");
		});

	});

	$("#pw_btn").on("click",function() {

		$(".password").removeAttr("hidden");

		$("#pw_cancle").on("click", function() {
			$("#pw").val("");
			$(".password").attr("hidden", true);
			$(".pw_btn").removeAttr("hidden");
			$("#pw_check2").text("");
			$("#pw_check").text("");
			$("#new_pw").attr("disabled", true);
			$("#new_pw_confirm").attr("disabled", true);
			$("#pw").removeAttr("disabled");

		});

		$("#pw").blur(function() {
				var pw = $(this).val();
				var member_num = $("#member_num").val();
					$.ajax({
														
						type : "post",
						async : "true",
						url : contextPath+ "/UpdateCheck",
						data : {
								param : pw,
								command : "pw",
								member_num : member_num
								},
						dataType : "text",
						success : function(data) {
							if (data == 1) {
								$("#pw_check").text("비밀번호가 확인되었습니다.");
								$("#pw_check2").text("");
								$("#new_pw").removeAttr("disabled");
								$("#new_pw").focus();
								
								$("#pw").attr("disabled",true);
							} else {
								$("#pw_check2").text("비밀번호를 다시 입력해주세요.");
								$("#pw_check").text("");
							}
						}
					});

					$("#new_pw").blur(function() {
							var new_pw = $(this).val();
							if (pw == new_pw) {
									$("#new_pw_check").text("이전의 비밀번호와 동일합니다.");
									$("#new_pw_check2").text("");
									$("#new_pw").focus();
							} else {
									if (pwReg.test(new_pw)) {
										$("#new_pw_check2").text("사용가능한 비밀번호 입니다.");
										$("#new_pw_check").text("");
										$("#new_pw_confirm").removeAttr("disabled");
										$("#new_pw_confirm").focus();
									} else {
										$("#new_pw_check").text("대소문자,특수문자,숫자를 조합해 8-20자 사이로 작성해주세요.");
										$("#new_pw_check2").text("");
									}
							}

					});

					$("#new_pw_confirm").blur(function() {

							var new_pw_confirm = $(this).val();
							var new_pw = $("#new_pw").val();
							if (new_pw_confirm == new_pw) {
									$("#new_pw_confirm_check2").text("비밀번호가 일치합니다.");
									$("#new_pw_confirm_check").text("");
									check = 1;
							} else {
								$("#new_pw_confirm_check").text("비밀번호가 일치하지 않습니다.");
								$("#new_pw_confirm_check2").text("");
							}
							
							$("#pw_update").on("click",function(){
								
								if(check==1){
									$.ajax({
										
										type:"post",
										async:true,
										url : contextPath + "/MemberUpdateAction",
										data : {
											
											pw : new_pw_confirm,
											member_num : member_num,
											command : "new_pw"
											
										},
										dataType : "text",
										success : function(){
											
											$(".password").attr("hidden",true);
											$("#pw_btn").removeAttr("hidden");
											$("#pw").attr("disabled",false);
											$("#new_pw").val("");
											$("#new_pw_confirm").val("");
											$("#new_pw_check2").text("");
											$("#new_pw_confirm_check2").text("");
											$("#new_pw").attr("disabled",true);
											$("#new_pw_confirm").attr("disabled",true);
										}
										
									});
									
								}

							});

					});
					
					
					

				});

			});

	$("#email_btn").on("click", function() {

		var email = $("#email").val();
		$(".email").removeAttr("hidden");
		$("#email_btn").attr("hidden", true);
		$("#email").attr("disabled", false);
		$("#email").focus();

		$("#email").blur(function() {
			var new_email = $(this).val();
			if (email == new_email) {
				$("#email_check").text("이전의 이메일과 동일합니다.");
				$("#email_check2").text("");
			}else{
				if (emailReg.test(new_email)) {
					$.ajax({

						type : "post",
						async : true,
						url : contextPath + "/UpdateCheck",
						data : {
							param : new_email,
							command : "email"
						},
						dataType : "text",
						success : function(data) {
							if(data == 1) {
								$("#email_check").text("사용중인 이메일 입니다.");
								$("#email_check2").text("");
								
							}else{
								$("#email_check2").text("사용가능한 이메일 입니다.");
								$("#email_check").text("");
							}
						}

					});
				}else{
					$("#email_check").text("이메일을 올바르게 작성해주세요.");
					$("#email_check2").text("");
				}
			}

		});

		$("#email_cancle").on("click", function() {

			$(".email").attr("hidden", true);
			$("#email_btn").removeAttr("hidden");
			$("#email").attr("disabled", true);
			$("#email").val(email);
			$("#email_check").text("");
			$("#email_check2").text("");

		});

	});
	
	$("#address_btn").on("click", function(){
		
		var addr1 = $("#addr1").val();
		var addr2 = $("#addr2").val();
		var addr3 = $("#addr3").val();
		
		$(".addr").removeAttr("hidden");
		$("#search").removeAttr("hidden");
		$("#address_btn").attr("hidden",true);
		$("#addr1").val("");
		$("#addr2").val("");
		$("#addr3").val("");
		$("#addr1").attr("disabled",false);
		$("#addr2").attr("disabled",false);
		$("#addr3").attr("disabled",false);
		
		
		$("#addr_cancle").on("click",function(){
			
			$("#address_btn").attr("hidden",false);
			$(".addr").attr("hidden",true);
			$("#search").attr("hidden",true);
			$("#addr1").val(addr1);
			$("#addr2").val(addr2);
			$("#addr3").val(addr3);
			$("#addr1").attr("disabled",true);
			$("#addr2").attr("disabled",true);
			$("#addr3").attr("disabled",true);
			
			
		});
		
		$("#addr_update").on("click",function(){
			$("")
		});
		
		
	});
	
	$("#name_btn").on("click",function(){
		
		var name = $("#name").val();
		$(".name").removeAttr("hidden");
		$("#name_btn").attr("hidden",true);
		$("#name").attr("disabled",false);
		
		$("#name").blur(function(){
			
			var new_name = $(this).val();
			
			if(name == new_name){
				$("#name_check").text("이전 이름과 같습니다.");
				$("#name_check2").text("");
			}else{
				if(nameReg.test(new_name)){
					
					$("#name_check2").text("사용 가능한 이름입니다.");
					$("#name_check").text("");
						check=1;
				}else{
					$("#name_check").text("다시 작성해주세요.");
					$("#name_check2").text("");
				}
			}

			
			$("#name_update").on("click",function(){
				if(check==1){
					$.ajax({
						
						type:"post",
						asysn:true,
						url:contextPath + "/MemberUpdateAction",
						data:{
							name : new_name,
							member_num : member_num,
							command : "new_name"
						},
						dataType : "text",
						success:function(){
							
							$("#name_check").text("");
							$("#name_check2").text("");
							$(".name").attr("hidden",true);
							$("#name").attr("disabled",true);
							$("#name_btn").removeAttr("hidden");	
						}
						
					});
				}
			});
		});
		

			$("#name_cancle").on("click",function(){
					
					$(".name").attr("hidden");
					$("#name_btn").removeAttr("hidden");
					
			});
		
		
	});


});