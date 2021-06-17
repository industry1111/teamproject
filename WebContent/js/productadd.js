$(function() {


	$("#add_btn").on("click",function(){
		
		if(!$('#category1 > option:selected').val() || !$('#category2 > option:selected').val() || !$('#category3 > option:selected').val() || 
				!$('#brand_name > option:selected').val() || $('#product_name').val() == '' ||  $('#product_description').val() == '' 
			|| $('#product_count').val() == '' ||  $('#product_price').val() == '' || $("#product_img").val() == '' ) {
		    
			alert("옵션을 제대로 등록해주세요");
	
		}else{
			$("form").submit();
		}
	
	});
	
		
	
	
	
	
	
	
	
	
	
	
	
	
	
});