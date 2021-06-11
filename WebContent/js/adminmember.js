$(function() {
	
	
	$(".edit_btn").on("click",function(){
		console.log("dd");
		$(this).parent().siblings('.state').removeAttr("disabled");

	});
	$(".ok_btn").on("click",function(){
		
		
		var new_state = $(this).parent().children().children('option:selected').val();
		var order_detail_num = $(this).parent().children(".order_detail_num").val();
		console.log(order_detail_num);
		console.log(new_state);
		$(this).parent().children(".state").attr("disabled",true);
		$.ajax({
			
			type : "post",
			async : true,
			url : contextPath + "/OrderStateUpdate",
			data : {
				
				state : new_state,
				order_detail_num : order_detail_num
			},
			dataType:"text",
			success : function(){
				
			}
			
		});
		
	});
	
});