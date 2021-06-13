$(function() {
	
	var check = 0;
	var id = null;
	var name = null;
	var email = null;
	var new_pw = null;
	
	$("#continue").on("click",function(){
		
		name = $("#name").val();
		email = $("#id").val();
		
		if(name == ""){
			
			alert("이름을 입력해주세요.");
			
		}else if(id == ""){
			
			alert("아이디를 입력해주세요.");
		}else{
		
			$.ajax({
				type: "post",
				async: true,
				url: contextPath + "/RegisterCheck",
				data: {
					param: id,
					command: "id"
				},
				dataType: "text",
				success: function(data) {
					if(data == "중복된 아이디입니다."){
						check = 1;
					}else{
						alert("등록되지 않은 아이디 입니다.");
					}
				},
			});

			
			if(check == 1){
				
				$.ajax({
					type: "post",
					async: true,
					url: contextPath + "/GetEmail",
					data: {
						param: id,
						command: "id"
					},
					dataType: "text",
					success: function(data) {
						email = data;
						check = 2;
					},
				});
			}	
				
				
			if(check == 2){
			
					$.ajax({
						
						type : "post",
						async : true,
						url : contextPath + "/FindPassWordMail",
						data : {
							address : email
						},
						success: function(data) {
							alert("인증번호가 발송 되었습니다.");
							new_pw = data;
							check = 3;
						}
						
					});
				}
			
			if(check == 3){
				
				$.ajax({
					
					type:"post",
					async:true,
					url : contextPath + "/MemberUpdateAction",
					data : {
						
						pw : new_pw,
						id : id,
						command : "new_pw"
						
					},
					dataType : "text",
					success : function(){}
				});
			}
			
		}
		
		
	});
	

	
});

