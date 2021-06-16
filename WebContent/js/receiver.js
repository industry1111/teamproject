$(function() {
	
	var basic_num = $("#basic_num").val();
	var basic = $("#basic").val();
	 $("input[id='basic_num']:checkbox").change(function () {
			
		 if($("input:checkbox[id='basic_num']").is(":checked")){
			 basic_num = $(this).val('1');
			 basic = $("#basic").val('1');
			 
		 }else{
			 basic_num = $(this).val('0');
			 basic = $("#basic").val('0');
		 }

		 
	});

	
	$("#close_btn").on("click",function(){
		self.close();  
	});
	
	
});