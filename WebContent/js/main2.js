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

		$.ajax({
			type: "get",
			url: contextPath + "/SelectList.do",
			data: {
				category_code1: category_code1,
			},
			dataType: "text",
			success: function(data) {
				var obj = JSON.parse(data);
				$("#test").html("");
				for (var i = 0; i < obj.length; i++) {
					$("#test").append("<li class='category2' value=" + obj[i].category_code + ">" + obj[i].category_name + "</li>");
				}
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
	$(".allowed").click(function() {
		$(this).css('background-color', 'white');
		$(this).css('color', '#627482');
		$(this).attr('class', 'category1');
		category_code1 = 0;
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