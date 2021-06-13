$(function() {

	var name = null; 
	var email = null;
	var authNum = $("#authNum").val();
	var authNum2 = null;
	var check = 0;
	var check1 = 0;
	
	$("#find_btn").on("click",function(){
		
		name = $("#name").val();
		email = $("#email").val();
		
		if(name == ""){
			
			alert("이름을 입력해주세요.");
			
		}else if(email == ""){
			
			alert("이메일을 입력해주세요.");
			
		}else{
			
			$.ajax({
				type: "post",
				async: true,
				url: contextPath + "/RegisterCheck",
				data: {
					param: email,
					command: "email"
				},
				dataType: "text",
				success: function(data) {
					if(data == "다른 계정에서 사용하고 있는 메일입니다."){
						check = 1;
					}else{
						alert("등록되지 않은 이메일입니다.");
					}
				},
			});

			if(check==1){
				
				$.ajax({
					
					type : "post",
					async : true,
					url : contextPath + "/FindIDMail",
					data : {
						address : email
					},
					success: function(data) {
						alert("인증번호가 발송 되었습니다.");
						authNum2 = data;
						$("#authNum").attr("disabled",false);
					}
					
				});
			}
		}
		
		
		
	});
	
	$("#authNum").blur(function(){
		authNum = $(this).val();
		if(authNum == authNum2 && authNum !=""){
			$(this).attr("disabled",true);
			$("#continue").removeAttr("hidden");
			$("#authNum_check2").removeAttr("hidden");
			$("#authNum_check").text("");
			email_check2 = 1;
		}else{
			$("#authNum_check").removeAttr("hidden")
		}
	});
	
	
	$("#continue").on("click",function(){
		
		email = $("#email").val();
		
		location.href= './findIdAfter.me?email='+email;
		
	});
	
	

	
}); //#