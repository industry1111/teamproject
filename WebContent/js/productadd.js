var product_price_Reg = /^([0-9]){1,20}$/;
var product_count_Reg = /^([0-9]){1,20}$/;


var product_category_check = 0;
var product_price_check = 0;
var product_count_check = 0;


	$(function() {
	// 상품가격
	$("#product_price").blur(function(){
		var product_price = $(this).val();
		if(!product_price_Reg.test(product_price)){
			$("#product_price_check").text("상품가격을 숫자로 입력해주세요");
			product_price_check = 0;
		}else{
			$("#product_price_check2").text(" ");
			product_price_check = 1;
		}
		});
	
	
		// 상품 수량
		$("#product_count").blur(function(){
			var product_count = $(this).val();
			if(!product_count_Reg.test(product_count)){
				$("#product_count_check").text("상품수량을 숫자로 입력해주세요");
				product_count_check = 0;
			}else{
				$("#product_count_check2").text(" ");
				product_count_check = 1;
			}
		});	

			// 카테고리 1
			$("#category1").blur(function(){
				var product_category = $(this).val();
				if(product_category == ""){
					$("#product_category_check").text("카테고리를 선택해주세요");
					product_category_check = 0;
				}else{
					$("#product_category_check2").text("선택한 카테고리를 확인해주세요");
					product_category_check = 1;
				}
			});
			// 카테고리 2
			$("#category2").blur(function(){
				var product_category = $(this).val();
				if(product_category == "==2차=="){
					$("#product_category_check").text("카테고리를 선택해주세요");
					product_category_check = 0;
				}else{
					$("#product_category_check2").text("선택한 카테고리를 확인해주세요");
					product_category_check = 1;
				}
			});
			// 카테고리 3
			$("#category3").blur(function(){
				var product_category = $(this).val();
				if(product_category == ""){
					$("#product_category_check").text("카테고리를 선택해주세요");
					product_category_check = 0;
				}else{
					$("#product_category_check2").text("선택한 카테고리를 확인해주세요");
					product_category_check = 1;
				}
			});
	
	$("#ProdcutAdd").click(function(){
		if(product_category_check == 0){
			$("#category1").focus();
			return false;
		}else if(product_category_check == 0){
			$("#category2").focus();
			return false;
		}else if(product_category_check == 0){
			$("#category3").focus();
			return false;	
		}else if(product_price_check == 0){
			$("#product_price").focus();
			return false;
		}else if(product_count_check == 0){
			$("#product_count").focus();
			return false;
		}
	});

	});