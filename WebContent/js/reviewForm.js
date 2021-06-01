$(function() {
	
	
	
	
	$("#write_review_btn").on("click",function(){
		
		$.ajax({
		
			type:"post",
			async:true,
			url : contextPath + "/insertReview",
			data : {
				
				rating1 : $("#rating1").val(),
				rating2 : $("#rating2").val(),
				rating3 : $("#rating3").val(),
				textarea : $("#textarea").val(),
				profile_img : $("#profile_img").val(),
				
				
			},
			dataType:"json",
			success : function() {
				window.close();

			}
			
		});
		

	});
	
	
	
	$("#close_review_btn").on("click",function(){
		window.close();
	});
	
	
});