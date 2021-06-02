$(function() {
	
	var checkArr = new Array();
	$("input[class='chkbox']:checked").each(function(){
		checkArr.push($(this).attr("baket_num"));
		$("#chk").val(checkArr);
		console.log(checkArr);
	});
	
	
	
	
	$("input:checkbox[name=product_check]").on("click",function(){
		
		var product_price = parseInt($(this).val());
		var price_total = parseInt($("#price_total").val());
		
			if($(this).is(":checked")){
				
					checkArr.push($(this).attr("basket_num"));
					$("#chk").val(checkArr);
					console.log($("#chk").val());
				
					product_price = $(this).val();
					price_total += parseInt(product_price);
					
					$("#price_total").val(price_total);

			}else{
					product_price = $(this).val();
					price_total -= parseInt(product_price);	
					$("#price_total").val(price_total);
					
					checkArr.pop($(this).attr("basket_num"));
					$("#chk").val(checkArr);
					console.log($("#chk").val());
					
			
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
		
	 });//delete_btn
	
	
  });


