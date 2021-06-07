$(function() {
	
	var checkArr = new Array();
	$("input[class='chkbox']:checked").each(function(){
		checkArr.push($(this).attr("baket_num"));
		$("#chk").val(checkArr);
		console.log(checkArr);
	});
	
	
	
	
	$("input:checkbox[name=product_check]").on("click",function(){
		
		var product_price = parseInt($(this).val());
		//var price_total = parseInt($("#price_total").val());
		var price_total = $(this).parent().siblings("div[name=t_price]").children().children().text();
		console.log(price_total);
		
			if($(this).is(":checked")){
				
					checkArr.push($(this).attr("basket_num"));
					$("#chk").val(checkArr);
				
					//product_price = $(this).val();
					price_total += parseInt(product_price);
					
					$("#price_total").val(price_total);

			}else{
					//product_price = $(this).val();
					price_total -= parseInt(product_price);	
					$("#price_total").val(price_total);
					
					checkArr.pop($(this).attr("basket_num"));
					$("#chk").val(checkArr);
					
			}
		
	});


	$("a[name=delete_btn]").on("click",function(){
		
		var basket_num = $(this).children().val();
		if(confirm("삭제하시겠습니까?")){
			
			$.ajax({
				
				type:"post",
				async:true,
				url : contextPath + "/BasketDeleteAction",
				data : {basket_num : basket_num} ,
				success : function () {
					location.reload();
				}
			
			});
		}
		
	 });//delete_btn
	
	$(".plus_btn").on("click",function(){
		
		var quantity = $(this).parent().parent().siblings("div[name=parent]").children().val();
		var new_quantity = parseInt(quantity)+1;
		$(this).parent().parent().siblings("div[name=parent]").children().val(new_quantity);
		var basket_num = $(this).parent().parent().parent().siblings("div[name=parent1]").children().children().children().val();
		var product_price = $(this).parent().parent().parent().siblings("div[name=product_price]").children().children().text();
		var new_total_price = parseInt(product_price)*parseInt(new_quantity);
		$(this).parent().parent().parent().siblings("div[name=t_price]").children().children().text(new_total_price);
		
		$.ajax({
			
			type:"post",
			async:true,
			url : contextPath + "/BasketQuantityUpdate",
			data : {
				new_quantity : new_quantity,
				basket_num : basket_num,
				command : "plus"
				},
			success : function () {
	
			}
		
		});
		
		
	});
	
	$(".minus_btn").on("click",function(){
		
		var quantity = $(this).parent().parent().siblings("div[name=parent]").children().val();
		var new_quantity = parseInt(quantity)-1;
		$(this).parent().parent().siblings("div[name=parent]").children().val(new_quantity);
		var basket_num = $(this).parent().parent().parent().siblings("div[name=parent1]").children().children().children().val();
		var product_price = $(this).parent().parent().parent().siblings("div[name=product_price]").children().children().text();
		var new_total_price = parseInt(product_price)*parseInt(new_quantity);
		$(this).parent().parent().parent().siblings("div[name=t_price]").children().children().text(new_total_price);

		$.ajax({
			
			type:"post",
			async:true,
			url : contextPath + "/BasketQuantityUpdate",
			data : {
				new_quantity : new_quantity,
				basket_num : basket_num,
				command : "minus"
				},
			success : function () {
				
			}
		
		});
	});

});
