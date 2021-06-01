$(function() {
	
	var baisc_num = $("#basic_num").val();
	
	$("#basic_num").on("click",function(){
		
		baisc_num = $("#basic_num").val('1');
		
	});
	
	
	$("#addr_add_btn").on("click",function(){
		
		$.ajax({
		
			type:"post",
			async:true,
			url : contextPath + "/ReceiverInsert",
			data : {
				addr_name : $("#addr_name").val(),
				receiver_name : $("#receiver_name").val(),
				addr1 : $("#addr1").val(),
				addr2 : $("#addr2").val(),
				addr3 : $("#addr3").val(),
				receiver_phone : $("#receiver_phone").val(),
				basic_num : $("#basic_num").val()
				
				
			},
			dataTyep:"json",
			success : function() {
				
			}
			
		});
		
		window.close();

	});
	
	$("#addr_update_btn").on("click",function(){
		
		$.ajax({
		
			type:"post",
			async:true,
			url : contextPath + "/ReceiverUpdate",
			data : {
				
				receiver_num : $("#receiver_num").val(),
				addr_name : $("#addr_name").val(),
				receiver_name : $("#receiver_name").val(),
				receiver_addr1 : $("#receiver_addr1").val(),
				receiver_addr2 : $("#receiver_addr2").val(),
				receiver_addr3 : $("#receiver_addr3").val(),
				receiver_phone : $("#receiver_phone").val(),
				basic_num : $("#basic_num").val()
			},
			dataTyep:"json",
			success : function() {
				
			}
			
		});
		window.close();
	
	});
	
	$("#close_btn").on("click",function(){
		window.close();
	});
	
	
});