$(function() {
	
	
	$(".edit_btn").on("click",function(){
		$(this).parent().siblings('.state').removeAttr("disabled");

	});
	$(".ok_btn").on("click",function(){
		
		var member_num = $(this).parent().parent().siblings('.member_num').val();
		var member_code = $(this).parent().siblings('.state').children('option:selected').val();
	
		console.log("member_num : "+member_num);
		console.log("member_code : "+member_code);
		$(this).parent().siblings('.state').attr("disabled",true);
		$.ajax({
			
			type : "post",
			async : true,
			url : contextPath + "/MemberStateUpdate.do",
			data : {
				
				member_num : member_num,
				member_code : member_code
			},
			dataType:"text",
			success : function(){
				
			}
			
		});
		
	});
	
});