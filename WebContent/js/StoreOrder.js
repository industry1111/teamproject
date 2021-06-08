$(function() {
	
	
	$(".state_update_btn").on("click",function(){
		
		$(this).parent().children(".state").removeAttr("disabled");

	});
	$(".update_btn").on("click",function(){
		
		//var new_state = $(this).val();
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