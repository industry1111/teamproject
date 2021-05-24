var nameReg = /^[가-힣]{2,5}$/;
var idReg = /^[A-Za-z0-9]{6,15}$/;
var pwReg = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&])[A-Za-z\d$@$!%*?&]{8,20}/;
var emailReg = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
var phoneReg = /^01(?:0|1)([0-9]){7,8}$/;


$(function() {
	
	$("#id_btn").on("click",function() {
	
		var id = $("#id").val();
		var date =${date} 
		
		$(this).attr("hidden",true);
		$("#id").removeAttr("disabled");
		$("#id").focus();
		$(".id_update").removeAttr("hidden");
		
		$("#id_cancle").on("click",function(){
			$(".id_update").attr("hidden",true);
			$("#id").val(id);
			$("#id").attr("disabled",true);
			$("#id_btn").removeAttr("hidden");
			$("#id_check2").text("");
			$("#id_check").text("");
		});
		
		$("#id").blur(function() {
			var update_id = $(this).val();
			if(id == update_id){
				$("#id_check").text("이전의 아이디와 동일합니다.");
				$("#id_check2").text("");
				check=0;
			}else{
				
				if(idReg.test(update_id)){
					
					$.ajax({
							type : "post",
							async : "true",
							url : contextPath + "/UpdateCheck",
							data : {
								param : update_id,
								command: "id"
							
							},
							dataType:"text",
							success : 
								function (data) {
									if(data=="0"){
										$("#id_check2").text("사용가능한 아이디 입니다.");
										$("#id_check").text("");
									}else{
										$("#id_check").text("중복된 아이디입니다.");
										$("#id_check2").text("");
									}		
							}
					});	
					
				}else{
					$("#id_check").text("특수문자 한글 제외  8~20자 이내로 작성해 주세요");
					$("#id_check2").text("");
				}
			}
		});
	});
	
	$("#id_update").on("click",function(){
		
	});
	
	
	

});