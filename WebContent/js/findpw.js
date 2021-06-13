$(function() {
	
	var check = 0;
	var check1 = 0;
	var check2 = 0;
	var id = null;
	var name = null;
	var email = null;
	var new_pw = null;
	
	$("#continue").on("click",function(){
		
		name = $("#name").val();
		id = $("#id").val();
		
		
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

		}
		
		
		if(check == 1){
			
					$.ajax({
						
						type : "post",
						async : true,
						url : contextPath + "/FindPassWordMail",
						data : {
							id : id
						},
						success: function(data) {
							alert("인증번호가 발송 되었습니다.");
							new_pw = data;
							location.href= contextPath + "/PassWordUpdateAction?id="+id+"&pw="+new_pw;
						}
						
					});
				
			}
		
		
	});
		
});

