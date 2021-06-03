$(function(){
	
	
	
	$("#new_check").on("click",function(){
		
		$(".new_select").attr("hidden",false);
		$(".basic_select").attr("hidden",true);
		$("#receiver_name").val('');
		$("#address_name").val('');
		$("#receiver_phone").val('');
		$("#addr1").val('');
		$("#addr2").val('');
		$("#addr3").val('');
		
		
	});
	
	$("#basic").on("click",function(){
		
		$(".basic_select").attr("hidden",false);
		$(".new_select").attr("hidden",true);
		
	});
	
	
	
});//*****