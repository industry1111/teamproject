$(function() {
	var category_code1 = 0;
	var category_code2 = 0;
	var category_code3 = 0;

	$(".category1").change(function() {
		category_code1 = $(this).val();
		
		$.ajax({
			type: "get",
			url: contextPath + "/ProductCategorySelect.do",
			data: {
				category_code1: category_code1,
				category_code2: 0,
				category_code3: 0,

			},
			dataType: "text",
			success: function(data) {
			
				var obj = JSON.parse(data);
				console.log(obj);
		
				$("#category2").html("<option class='category2' value=0>==2차==</option>");
				$("#category3").html("<option class='category3' value=0>==3차==</option>");
				for (var i=0;i<obj.length;i++) {
					$("#category2").append("<option class='category2' value=" + obj[i].category_code + ">" + obj[i].category_name + "</option>");
				}
		
			}
		});
	});

	
//	$(document).on("change", ".category2", function() {
//		category_code2 = $(this).val();
	$(".category2").change(function() {
			category_code2 = $(this).val();
		$.ajax({
			type: "get",
			url: contextPath + "/ProductCategorySelect.do",
			data: {
				category_code1: category_code1,
				category_code2: category_code2,
				category_code3: 0,

			},
			dataType: "text", 
			success: function(data) {
//				var data1 = data.split("||");
//				var obj1 = JSON.parse(data[0]);
				var obj = JSON.parse(data);
				console.log(obj);
				$("#category3").html("<option class='category3' value=0>==3차==</option>");
				for (var i = 0; i < obj.length; i++) {
					$("#category3").append("<option  class='category3' value=" + obj[i].category_name + ">" + obj[i].category_name + "</option>");
				
				}
			}
		});

	});

	

});