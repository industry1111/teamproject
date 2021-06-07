$(function() {
	
	
	$("#state_update_btn").on("click",function(){
		
		$(this).parent().children(".state").removeAttr("disabled");
		var state = $(this).parent().children(".state").val();
		var orders_code = $(this).parent().children(".orders_code").val();
		
		$("#state").on("click",function(){
			
			var new_state = $(this).val();
			
			$.ajax({
				
				type : "post",
				async : true,
				url : contextPath + "/OrderStateUpdate",
				data : {
					
					state : new_state,
					orders_code : orders_code
				},
				success : function(){
					$(this).parent().children(".state").attr("disabled",true);
				}

				
			}) ;

		});

	});
	
	
	
});