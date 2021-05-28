$(function() {
	
	$("#addr_add_btn").on("click",function(){
		
		if($('#basic_num1').is(':checked')){
		     $('#basic_num').val('1');
		}
		var params = $("#form_addr").serialize();
		$.ajax({
		
			type:"post",
			async:true,
			url : contextPath + "/ReceiverInsertAction.bo",
			data : params,
			success : function() {
				window.close();
			}
			
		});
		
		

	});
	
	
});