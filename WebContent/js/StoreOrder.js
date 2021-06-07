$(function() {
	
	
	$(".state_update_btn").on("click",function(){
		
		$(this).parent().children(".state").removeAttr("disabled");
		var state = $(this).parent().children(".state").val();
		var order_detail_num = $(this).parent().children(".order_detail_num").val();
		console.log(order_detail_num);
		
		$(".state").on("click",function(){
			
			//var new_state = $(this).val();
			var new_state = $(this).children('option:selected').val();
			console.log(new_state);
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
					
					$(this).parent().children(".state").attr("disabled", true);

				}
				
			 });

			});
	
		});
	
});