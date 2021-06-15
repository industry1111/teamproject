$(function(){
	var today = new Date();   
	var year = today.getFullYear(); // 년도
	var month ='' + (today.getMonth() + 1);  // 월
	var date ='' +  today.getDate();  // 날짜
	if (month.length < 2) month = '0' + month; 
	if (date.length < 2) date = '0' + date; 
	
	
	
	
	
	$(".reply").click(function(){
		$(this).parent().parent().next().removeAttr("hidden");
		$(this).attr("hidden",true);		
	});
	$(".replybtn").click(function(){
		var reply_contents = $(this).prev().val();
		var day ="판매자/"+year+"-"+month+"-"+date;
		$(this).parents(".reply_div").attr("hidden",true);
		$(this).parents(".reply_div").next().removeAttr("hidden");
		$(this).parents(".reply_div").next().find(".a").html(day);
		$(this).parents(".reply_div").next().find(".b").html(reply_contents);
	});
	
});

