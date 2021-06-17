$(function() {
	
	var numCheck = /[0-9]/;
	var count_check = 0;
	var count_price = 0;
	
	$("#product_count").blur(function() {
		
		var count = $(this).val();
		
		if($('#product_count').val() == '' || numCheck.test(count)){
			count_check = 1;
		}else{
			alert("숫자만 작성해 주세요");
		}
		
		
	});
	
	$("#product_price").blur(function() {
		
		var price = $(this).val();
		
		if($('#product_price').val() == '' || numCheck.test(price)){
			price_check = 1;
		}else{
			alert("숫자만 작성해 주세요");
		}
		
		
	});
	

	$("#add_btn").on("click",function(){
		
		if(!$('#category1 > option:selected').val() || !$('#category2 > option:selected').val() || !$('#category3 > option:selected').val() || 
				!$('#brand_name > option:selected').val() || $('#product_name').val() == '' ||  $('#product_description').val() == '' 
			|| $('#product_count').val() == '' ||  $('#product_price').val() == '' ) {
		    
			alert("옵션을 제대로 등록해주세요");
	
		}else{
			$("form").submit();
		}
	
	});
	
		
	
	
	
	
	
	
	
	
	
	
	
	
	
});