$(function() {

	
//	$("input:checkbox[name=product_check]").on("click",function(){
//		
//		var product_price = parseInt($(this).val());
//		
//		var price_total = parseInt($("#price_total").val());
//		
//			if($("input:checkbox[name=product_check]").is(":checked")){
////				if($("#product_check").is(":checked")){
//				
//				//$(this).attr("class","checked_box");
////				if($(".class=checked_box")){
//					
//					product_price = $(this).val();
//					
//					
//					price_total += parseInt(product_price);
//					
//					$("#price_total").val(price_total);
//					
//					//$(this).attr("class","checked_box");
//					
////				}
//			
//			}else{
//				
//				//$(this).removeAttr("class","checked_box");
//				
//					product_price = $(this).val();
//					
//					price_total -= parseInt(price_total);
//						
//					$("#price_total").val(price_total);
//					//$(this).attr("class","unchecked_box");
//			}
//		
//	});
	
	$("input:checkbox[name=product_check]").on("change",function(){	
		$(".check_total").on("click",function(){
				
				var product_price = parseInt($(this).val());
				
				var price_total = parseInt($("#price_total").val());
				
		
							product_price = $(this).val();
							
							
							price_total += parseInt(product_price);
							
							$("#price_total").val(price_total);
							$(this).removeAttr('class');
							$(this).attr('class','checked_box');
		});
		
		$(".checked_box").on("click",function(){
			
			var product_price = parseInt($(this).val());
			
			var price_total = parseInt($("#price_total").val());
			
		
						product_price = $(this).val();
						
						
						price_total -= parseInt(product_price);
						
						$("#price_total").val(price_total);
						
						$(this).removeAttr('class');
						$(this).attr('class','check_total');
		});
});

	
	$("#delete_btn").on("click",function(){
		
		var product_num = $("#product_num").val();
		if(confirm("삭제하시겠습니까?")){
			
			$.ajax({
				
				type:"post",
				async:true,
				url : contextPath + "/BasketDeleteAction",
				data : {product_num : product_num} ,
				success : function () {
					location.reload();
				}
			
			});
		}
		
	 });
	
  });


