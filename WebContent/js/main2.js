$(function() {
	var category_code1 = 0;
	var category_code2 = 0;
	var category_code3 = 0;
	var brand = 0;
	var price1 = 0;
	var price2 = 0;

	$(".sort").click(function() {
		$(".sort").css('color', "gray");
		$(this).css('color', '#627482');
	});
	$(".category1").click(function() {
		category_code1 = $(this).val();
		$('.category1').css('color', '#627482');
		$('.category1').css('background-color', 'white');
		$('.category1').attr('class', 'category1');
		$(this).css('color', 'white');
		$(this).css('background-color', 'green');
		$(this).attr('class', 'category1 allowed');

		$(".allowed").click(function() {
			$(this).css('background-color', 'white');
			$(this).css('color', '#627482');
			$(this).attr('class', 'category1');
			category_code1 = 0;
		});
		$.ajax({
			type: "get",
			url: contextPath + "/SelectList.do",
			data: {
				category_code1:category_code1,
				category_code2:category_code2,
				category_code3:category_code3, 
				brand:brand,
				price1:price1, 
				price2:price2
			},
			dataType: JSON,
			success: function(data) {
				alert(data);
			}
		});
	});









	$(".category2").click(function() {
		category_code2 = $(this).val();
		$('.category2').css('color', '#627482');
		$('.category2').css('background-color', 'white');
		$('.category2').attr('class', 'category2');
		$(this).css('color', 'white');
		$(this).css('background-color', 'green');
		$(this).attr('class', 'category2 allowed');

		$(".allowed").click(function() {
			$(this).css('background-color', 'white');
			$(this).css('color', '#627482');
			$(this).attr('class', 'category2');
			category_code2 = 0;
		});
	});
	$(".category3").click(function() {
		alert(category_code1);
		alert(category_code2);
	});
	$(".sort").click(function() {
		$(".sort").css('color', "gray");
		$(this).css('color', '#627482');
	});
});