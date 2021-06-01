var productNameReg = /^[가-힣a-zA-Z0-9]{1,100}$/;
var productDescReg = /^[가-힣a-zA-Z0-9]{1,2000}$/;
var productBrandReg = /^[가-힣a-zA-Z0-9]{1,20}$/;
var productImgReg = /^[가-힣a-zA-Z0-9]{1,2000}$/;
var CountReg = /^[0-9]{1,10}$/;
var PriceReg = /^[0-9]{3,10}$/;
var ProductCateReg = /^[가-힣a-zA-Z0-9]{1,2000}$/;

var product_category_check = 0;
var product_name_check = 0;
var product_description_check = 0;
var product_brand_check = 0;
var product_img_check = 0;
var product_count_check = 0;
var product_price_check = 0;


$(function() {
	$("#product_name").blur(function(){
		var name = $(this).val();
		if(!productNameReg.test(product_name)){
			$("#product_name_check").text("상품이름은 한글자 이상 작성해 주세요");
			$("#product_name_check2").text("");
			product_name_check = 0;
		}else{
			$("#product_name_check2").text("");
			$("#product_name_check").text("");
			product_name_check = 1;
		}
	});
	
		$("#product_description").blur(function(){
			var name = $(this).val();
			if(!productDescReg.test(product_description)){
				$("#product_description_chek").text("상품설명은 10 글자이상 입니다.");
				$("#product_description_chek2").text("");
				product_description_check = 0;
			}else{
				$("#product_description_chek2").text("");
				$("#product_description_chek").text("");
				product_description_check = 1;
			}
		});
	
		$("#product_img").blur(function(){
			var name = $(this).val();
			if(!productImgReg.test(product_description)){
				$("#product_img_check").text("상품사진을 첨부해주세요.");
				$("#product_img_check2").text("");
				product_img_check = 0;
			}else{
				$("#product_img_check2").text("");
				$("#product_img_check").text("");
				product_img_check = 1;
				}
			});
		$("#product_brand").blur(function(){
			var name = $(this).val();
			if(!productBrandReg.test(product_description)){
				$("#product_brand_check").text("브랜드이름은 2글자 이상입니다.");
				$("#product_brand_check2").text("");
				product_brand_check = 0;
			}else{
				$("#product_brand check2").text("");
				$("#product_brand check").text("");
				product_brand_check = 1;
				}
			});			
		$("#product_category").blur(function(){
			var name = $(this).val();
			if(!ProductCateReg.test(product_description)){
				$("#product_category_check").text("브랜드이름은 2글자 이상입니다.");
				$("#product_category_check2").text("");
				product_category_check = 0;
			}else{
				$("#product_category_check2").text("");
				$("#product_category_check").text("");
				product_category_check = 1;
				}
			});		
			$("#product_count").blur(function(){
				var name = $(this).val();
				if(!CountReg.test(product_name)){
					$("#product_count_check").text("상품수량은 1개 이상입니다.");
					$("#product_count_check2").text("");
					name_check = 0;
				}else{
					$("#product_count_check2").text("");
					$("#product_count_check").text("");
					name_check = 1;
				}
			});
				$("#product_price").blur(function(){
					var name = $(this).val();
					if(!PriceReg.test(product_name)){
						$("#product_price_check").text("상품금액은 100원 이상입니다.");
						$("#product_price_check2").text("");
						name_check = 0;
					}else{
						$("#product_price_check2").text("");
						$("#product_price_check").text("");
						name_check = 1;
					}
				});		
		
	$("#Product_Add").click(function(){
		if(product_name_check ==0){
			$("#product_name").focus();
			return false;
		}else if(product_category_check ==0){
			$("#product_category").focus();
			return false;
		}else if(product_description_check == 0){
			$("#product_decription").focus();
			return false;
		}else if(product_img_check == 0){
			$("#product_img").focus();
			return false;
		}else if(product_brand_check == 0){
			$("#product_brand").focus();
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
