$(function() {
	
	
	$(".state_update_btn").on("click",function(){
		
		$(this).parent().children(".state").removeAttr("disabled");

	});
	$(".update_btn").on("click",function(){
		
		//var new_state = $(this).val();
		var new_state = $(this).parent().children().children('option:selected').val();
		var order_detail_num = $(this).parent().children(".order_detail_num").val();
		var product_num = $(this).siblings(".product_num").val();
		var quantity = $(this).parent().children(".quantity").val();
		
		$(this).parent().children(".state").attr("disabled",true);
		$.ajax({
			
			type : "post",
			async : true,
			url : contextPath + "/OrderStateUpdate",
			data : {
				
				state : new_state,
				order_detail_num : order_detail_num,
				product_num : product_num,
				quantity : quantity
			},
			dataType:"text",
			success : function(){
				
			}
			
		});
		
	});
	
	$("#stateList").change(function(){
		
		var stateList = $("#stateList option:selected").val();
		console.log(stateList);
		location.href="StoreOrder.or?stateList="+stateList;
		
		
	});
	
});