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
				var data = data.split("||");
				var obj = JSON.parse(data[0]);
				
		
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
				var data = data.split("||");
				var obj1 = JSON.parse(data[0]); //category
				console.log(obj1);
				var obj2 = JSON.parse(data[1]); //brand
				
				$("#category3").html("<option class='category3' value=0>==3차==</option>");
				$("#brand_name").html("<option class='brand_name' value=0>==브랜드명==</option>");
				
				for (var i = 0; i < obj1.length; i++) {
					$("#category3").append("<option  class='category3' value=" + obj1[i].category_name + ">" + obj1[i].category_name + "</option>");					
				}
				
				for (var i = 0; i < obj2.length; i++) {				
					$("#brand_name").append("<option class='brand_name' value="+ obj2[i].brand_name + ">" + obj2[i].brand_name+"</option>");
				}
				
			}
		});

	});

	

});