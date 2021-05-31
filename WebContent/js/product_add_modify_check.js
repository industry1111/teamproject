var ProductNameReg = /^[가-힣]{1,100}$/;
var productDescReg = /^[가-힣](?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&])[A-Za-z\d$@$!%*?&]{10,2000}$/;
var productBrandReg = /^[가-힣](?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&])[A-Za-z\d$@$!%*?&]{2,20}$/;
var productImgReg = /^[가-힣](?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&])[A-Za-z\d$@$!%*?&]{10,2000}$/;
var CountReg = /^[1-9]{1,10}$/;
var PriceReg = /^[1-9]{3,10}$/;
var ProductCateReg;

var product_category_check = 0;
var product_name_check = 0;
var product_description_check = 0;
var product_brand check = 0;
var product_img_check = 0;
var product_count_check = 0;
var product_price_check = 0;


$(function() {
	$("#product_name").blur(function(){
		var name = $(this).val();
		if(!ProductNameReg.test(product_name)){
			$("#product_name_check").text("상품이름은 한글자 이상 작성해 주세요");
			$("#product_name_check2").text("");
			name_check = 0;
		}else{
			$("#product_name_check2").text("");
			$("#product_name_check").text("");
			name_check = 1;
		}
	});
	
	$(function() {
		$("#product_description").blur(function(){
			var name = $(this).val();
			if(!productDescReg.test(product_description)){
				$("#product_description_chek").text("상품설명은 10 글자이상 입니다.");
				$("#product_description_chek2").text("");
				product_description_check = 0;
			}else{
				$("#product_description_chek2").text("");
				$("#pproduct_description_chek").text("");
				product_description_check = 1;
			}
		});
	
	
	$("#phone").blur(function() {
		var phone = $(this).val();
		if (phoneReg.test(phone)) {
			$.ajax({
				type: "post",
				async: true,
				url: contextPath + "/RegisterCheck",
				data: {
					param: phone,
					command: "phone"
				},
				dataType: "text",
				success: function(data) {
					if(data == "다른 계정에서 사용하고 있는 번호입니다."){
						$("#phone_check").text(data);
						$("#phone_check2").text("");
						phone_check = 0;
					}else{
						$("#phone_check2").text(data);
						$("#phone_check").text("");
						phone_check = 1;
					}
				},
			});
		}else{
			$("#phone_check").text("번호가 올바르지 않습니다.")
			$("#phone_check2").text("");
			phone_check = 0;
		}
	});
	$("#join").click(function(){
		if(name_check ==0){
			$("#name").focus();
			return false;
		}else if(name_check ==0){
			$("#name").focus();
			return false;
		}else if(pw_check == 0){
			$("#r_pw").focus();
			return false;
		}else if(pw_confirm_check == 0){
			$("#pw_confirm").focus();
			return false;
		}else if(phone_check == 0){
			$("#phone").focus();
			return false;
		}else if(email_check == 0){
			$("#email").focus();
			return false;
		}else if(email_check2 == 0){
			$("#cf_num").focus();
			return false;
		}
	});
});