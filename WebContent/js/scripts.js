$(function() {
	$(window).scroll(function() {
		var scrolltop = $(window).scrollTop();
		if (scrolltop > 50) {
			$(".cart").css("top", scrolltop);
			$(".scroll_btn").removeAttr("hidden");
		} else {
			$(".cart").css("top", 0);
			$(".scroll_btn").attr("hidden", true);
		}
	});
	
	$(".up_btn").click(function(){
		var scrolltop = $(window).scrollTop();
		$(window).scrollTop(scrolltop-400);		
	});
	$(".down_btn").click(function(){
		var scrolltop = $(window).scrollTop();
		$(window).scrollTop(scrolltop+400);		
	});

});