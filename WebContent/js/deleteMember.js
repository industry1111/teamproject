	$(function(){
		
		var check=0;
		$("#pw").blur(function(){
			var pw = $(this).val();
				$.ajax({
					type : "post",
					async : true,
					url : contextPath + "/UpdateCheck",
					data : {
						param : pw,
						command : "pw",
						},
							dataType : "text",
							success : function(data) {
								if (data == "1") {
									$("#pw2_check").html("<svg xmlns='http://www.w3.org/2000/svg' width='16' height='16' fill='currentColor' class='bi bi-check' viewBox='0 0 16 16'><path d='M10.97 4.97a.75.75 0 0 1 1.07 1.05l-3.99 4.99a.75.75 0 0 1-1.08.02L4.324 8.384a.75.75 0 1 1 1.06-1.06l2.094 2.093 3.473-4.425a.267.267 0 0 1 .02-.022z'/></svg>");
									$("#pw2_check2").text("비밀번호가 맞습니다.");
									$("#pw_btn").removeAttr("disabled");
									$("#pw").attr("disabled", true);
									check=1;
								} else {
									$("#pw2_check2").text("");
									$("#pw2_check").text("비밀번호가 맞지않습니다.");
								}
							}
						});
					});
			
		$("#pw_btn").click(function() {
			if(check==1){
			if (confirm("탈퇴하시겠습니까?")) {
				$(location).attr('href',contextPath+"/MemberDeleteAction")
			} else {
				$("#pw_btn").attr("disabled", true);
				$("#pw").removeAttr("disabled");
				$("#pw").val("");
				$("#pw2_check2").text("");
				$("#pw2_check").text("");
				}
			}
		});
		
	});