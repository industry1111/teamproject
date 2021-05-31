$(function() {

	
	$("input:checkbox[name=product_check]").on("click",function(){
		
		var product_price = parseInt($(this).val());
		
		var price_total = parseInt($("#price_total").val());
		
			if($("input:checkbox[name=product_check]").is(":checked")){
//				if($("#product_check").is(":checked")){

				 product_price = $(this).val();
			
				
					price_total += parseInt(product_price);
	
					$("#price_total").val(price_total);
			
			}else if(!$("input:checkbox[name=product_check]").is(":checked")){
					product_price = $(this).val();
					
					price_total -= parseInt(price_total);
						
					$("#price_total").val(price_total);
			}
		
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


