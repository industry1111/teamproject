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
				category_code2: 0,
				category_code3: 0,
				brand: 0,
				price1: 0,
				price2: 0
			},
			dataType: "text",
			success: function(data) {
				var data1 = data.split("||");
			
				var obj1 = JSON.parse(data1[0]);
				var obj2 = JSON.parse(data1[1]);
				console.log(obj1);
				console.log(obj2);
				$("#product-list").html("");
				$("#category2").html("");
				$("#category3").html("");
				for (var i=0;i<obj1.length;i++) {
					$("#category2").append("<li class='category2' value=" + obj1[i].category_code + ">" + obj1[i].category_name + "</li>");
				}
				for(var i=0;i<obj2.length;i++){
					$("#product-list").append(obj2[i].product_name);
				}
			}
		});
	});

	$(document).on("click", ".category1.allowed", function() {
		$(this).css('background-color', 'white');
		$(this).css('color', '#627482'); 
		$(this).attr('class', 'category1');
		category_code1 = 0;
	});
	$(document).on("click", ".category2", function() {
		category_code2 = $(this).val();
		$('.category2').css('color', '#627482');
		$('.category2').css('background-color', 'white');
		$('.category2').attr('class', 'category2');
		$(this).css('color', 'white');
		$(this).css('background-color', 'green');
		$(this).attr('class', 'category2 allowed');
		$.ajax({
			type: "get",
			url: contextPath + "/SelectList.do",
			data: {
				category_code1: category_code1,
				category_code2: category_code2,
				category_code3: 0,
				brand: 0,
				price1: 0,
				price2: 0
			},
			dataType: "text", 
			success: function(data) {
				var obj = JSON.parse(data);
				$("#category3").html("");
				for (var i = 0; i < obj.length; i++) {
					$("#category3").append("<li class='category3' value=" + obj[i].category_code + ">" + obj[i].category_name + "</li>");
				}
			}
		});

	});
	$(document).on("click", ".category2.allowed", function() {
		$(this).css('background-color', 'white');
		$(this).css('color', '#627482');
		$(this).attr('class', 'category2');
		category_code2 = 0;
	});
	
	
	$(document).on("click", ".category3", function() {
		category_code3 = $(this).val();
		$('.category3').css('color', '#627482');
		$('.category3').css('background-color', 'white');
		$('.category3').attr('class', 'category3');
		$(this).css('color', 'white');
		$(this).css('background-color', 'green');
		$(this).attr('class', 'category3 allowed');
	});
	$(document).on("click", ".category3.allowed", function() {
		$(this).css('background-color', 'white');
		$(this).css('color', '#627482');
		$(this).attr('class', 'category3');
		category_code3 = 0;
	});
});