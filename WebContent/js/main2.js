$(function() {
	var category_code1 = 0;
	var category_code2 = 0;
	var category_code3 = 0;
	var brand = 0;
	var price1 = 0;
	var price2 = 0;
	

	

	$(document).on("click", ".category1", function() {
		
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
					var html = "<div class='col-md-7 offset-2'> <hr>" +
					"<div class='row'>" +
					"<div class='col-md-2'>" +
						"<img src='product_img_upload/"+obj2[i].product_img+"' style='heiht:100px; width:100px;'>" +
					"</div>" +
					"<div class='col-md-4 offest-1'>" + obj2[i].product_name + "<br>" + obj2[i].product_description +"</div>" +
					"<div class='col-md-2'> 상품 가격 : "+obj2[i].product_price+"원 </div>"+
					"<div class='col-md-3'>" +
					"<a href='store.bo?" + obj2[i].store_num + "'>" + 
						"<img src='upload_profile/" + obj2[i].profile_img +"' style='height: 100px; width:100px;'>" +
					"</div>" +
					"</a>" + obj2[i].store_name + "<br>" +
						obj2[i].category_name + 
					"</div>"+
					"</div>";
				
					$("#product-list").append(html);
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
				var data1 = data.split("||");
				var obj1 = JSON.parse(data1[0]);
				var obj2 = JSON.parse(data1[1]);
				
				console.log(obj1);
				$("#product-list").html("");
				$("#category3").html("");
				for (var i = 0; i < obj1.length; i++) {
					$("#category3").append("<li class='category3' value=" + obj1[i].category_code + ">" + obj1[i].category_name + "</li>");
				}
				for(var i=0;i<obj2.length;i++){
					var html = "<div class='col-md-7 offset-2'> <hr>" +
					"<div class='row'>" +
					"<div class='col-md-2'>" +
						"<img src='product_img_upload/"+obj2[i].product_img+"' style='heiht:100px; width:100px;'>" +
					"</div>" +
					"<div class='col-md-4 offest-1'>" + obj2[i].product_name + "<br>" + obj2[i].product_description +"</div>" +
					"<div class='col-md-2'> 상품 가격 : "+obj2[i].product_price+"원 </div>"+
					"<div class='col-md-3'>" +
					"<a href='store.bo?" + obj2[i].store_num + "'>" + 
						"<img src='upload_profile/" + obj2[i].profile_img +"' style='height: 100px; width:100px;'>" +
					"</div>" +
					"</a>" + obj2[i].store_name + "<br>" +
						obj2[i].category_name + 
					"</div>"+
					"</div>";
				
					$("#product-list").append(html);
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
		$.ajax({
			type: "get",
			url: contextPath + "/SelectList.do",
			data: {
				category_code1: category_code1,
				category_code2: category_code2,
				category_code3: category_code3,
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
				$("#product-list").html("");
				$("#category3").html("");
				for (var i = 0; i < obj1.length; i++) {
					$("#category3").append("<li class='category3' value=" + obj1[i].category_code + ">" + obj1[i].category_name + "</li>");
				}
				for(var i=0;i<obj2.length;i++){
					var html = "<div class='col-md-7 offset-2'> <hr>" +
					"<div class='row'>" +
					"<div class='col-md-2'>" +
						"<img src='product_img_upload/"+obj2[i].product_img+"' style='heiht:100px; width:100px;'>" +
					"</div>" +
					"<div class='col-md-4 offest-1'>" + obj2[i].product_name + "<br>" + obj2[i].product_description +"</div>" +
					"<div class='col-md-2'> 상품 가격 : "+obj2[i].product_price+"원 </div>"+
					"<div class='col-md-3'>" +
					"<a href='store.bo?" + obj2[i].store_num + "'>" + 
						"<img src='upload_profile/" + obj2[i].profile_img +"' style='height: 100px; width:100px;'>" +
					"</div>" +
					"</a>" + obj2[i].store_name + "<br>" +
						obj2[i].category_name + 
					"</div>"+
					"</div>";
				
					$("#product-list").append(html);
				}
			}
		});
	});
	$(document).on("click", ".category3.allowed", function() {
		$(this).css('background-color', 'white');
		$(this).css('color', '#627482');
		$(this).attr('class', 'category3');
		category_code3 = 0;
	});
	
	$(document).on("click", ".sort", function() {
		$(".sort").css('color', "gray");
		$(this).css('color', 'black');
		var sort = $(this).val();
		$.ajax({
			type: "get",
			url: contextPath + "/SelectList.do",
			data: {
				category_code1: category_code1,
				category_code2: category_code2,
				category_code3: category_code3,
				brand: 0,
				price1: 0,
				price2: 0,
				sort : sort
				
			},
			dataType: "text",
			success: function(data) {
				var data1 = data.split("||");
			
				var obj1 = JSON.parse(data1[0]);
				var obj2 = JSON.parse(data1[1]);
				
				$("#product-list").html("");
				$("#category3").html("");
				$("#category2").html("");
				$("#category1").html("");
				for (var i=0;i<obj1.length;i++) {
					$("#category2").append("<li class='category2' value=" + obj1[i].category_code + ">" + obj1[i].category_name + "</li>");
				}
				for(var i=0;i<obj2.length;i++){
					
					var html = "<div class='col-md-7 offset-2'> <hr>" +
					"<div class='row'>" +
					"<div class='col-md-2'>" +
						"<img src='product_img_upload/"+obj2[i].product_img+"' style='heiht:100px; width:100px;'>" +
					"</div>" +
					"<div class='col-md-4 offest-1'>" + obj2[i].product_name + "<br>" + obj2[i].product_description +"</div>" +
					"<div class='col-md-2'> 상품 가격 : "+obj2[i].product_price+"원 </div>"+
					"<div class='col-md-3'>" +
					"<a href='store.bo?" + obj2[i].store_num + "'>" + 
						"<img src='upload_profile/" + obj2[i].profile_img +"' style='height: 100px; width:100px;'>" +
					"</div>" +
					"</a>" + obj2[i].store_name + "<br>" +
						obj2[i].category_name + 
					"</div>"+
					"</div>";
				
					$("#product-list").append(html);
				}
			}
		});
	});
});