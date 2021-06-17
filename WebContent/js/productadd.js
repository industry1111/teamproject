$(function() {

	var product_price_Reg = /^([0-9]){1,20}$/;
	var product_count_Reg = /^([0-9]){1,20}$/;
	var product_name_Reg = /^[A-Za-z0-9가-힣]{2,40}$/;

	var product_category_check1 = 0;
	var product_category_check2 = 0;
	var product_category_check3 = 0;
	var product_price_check = 0;
	var product_count_check = 0;
	var product_brand_check = 0;
	var product_name_check = 0;

	// 상품가격
	$("#product_price").blur(function() {
		var product_price = $(this).val();
		if (!product_price_Reg.test(product_price)) {
			$("#product_price_check").text("숫자만 입력 가능합니다.");
			if (product_price == "") {
				$("#product_price_check").text("가격을 입력해 주세요");
			}
			product_price_check = 0;
		} else {
			$("#product_price_check").text("");
			product_price_check = 1;
		}
	});

	// 상품 수량
	$("#product_count").blur(function() {
		var product_count = $(this).val();
		if (product_count == 0) {
			$("#product_count_check").text("재고 수량은 0보다 커야 합니다.");
		} else if (!product_count_Reg.test(product_count)) {
			$("#product_count_check").text("숫자만 입력 가능합니다.");
			product_count_check = 0;
		} else {
			$("#product_count_check").text("");
			product_count_check = 1;
		}
	});

	// 카테고리 1
	$("#category1").change(function() {
		var product_category = $(this).val();
		if (product_category == 0) {
			$("#product_category_check").text("카테고리를 제대로 선택해주세요");
			product_category_check1 = 0;
		} else {
			$("#product_category_check").text("");
			$("#product_category_check").text("2차 카테고리를 선택해주세요");
			product_category_check1 = 1;
		}
	});
	// 카테고리 2
	$("#category2").change(function() {
		var product_category = $(this).val();
		if (product_category == 0) {
			$("#product_category_check").text("2차 카테고리를 선택해주세요");
			product_category_check2 = 0;
		} else {
			$("#product_category_check").text("3차 카테고리를 선택해주세요");
			product_category_check2 = 1;
		}
	});
	// 카테고리 3
	$("#category3").change(function() {
		var product_category = $(this).val();
		if (product_category == 0) {
			$("#product_category_check").text("카테고리를 선택해주세요");
			product_category_check3 = 0;
		} else {
			$("#product_category_check").text("");
			product_category_check3 = 1;
		}
	});
	$("#brand_name").change(function() {
		var brand_name = $(this).val();
		if (brand_name == 0) {
			$("#brand_check").text("브랜드를 선택해주세요");
			product_brand_check = 0;
		} else {
			$("#brand_check").text("");
			product_brand_check = 1;
		}
	});

	$("#product_name").blur(function() {
		var product_name = $(this).val();
		if (!product_name_Reg.test(product_name)) {
			$("#product_name_check").text("상품명은 3~40자 이내로 작성해 주세요.");
			product_name_check = 0;
		} else {
			$("#product_name_check").text("");
			product_name_check = 1
		}
	});

	$("#add_btn").click(function() {
		if (product_category_check1 == 0) {
			alert("카테고리를 제대로 선택 해주세요");
			$("#category1").focus();
			return false;
		} else if (product_category_check2 == 0) {
			alert("카테고리를 제대로 선택 해주세요");
			$("#category2").focus();
			return false;
		} else if (product_category_check3 == 0) {
			alert("카테고리를 제대로 선택 해주세요");
			$("#category3").focus();
			return false;
		} else if (product_name_check == 0) {
			alert("상품명을 제대로 작성해 주세요");
			$("#product_name").focus();
			return false;
		} else if (product_brand_check == 0) {
			alert("브랜드를 제대로 선택해 주세요");
			$("#brand_name").focus();
			return false;
		} else if (product_price_check == 0) {
			alert("상품가격을 제대로 입력해 주세요");
			$("#product_price").focus();
			return false;
		} else if (product_count_check == 0) {
			alert("재고 수량을 제대로 입력해 주세요");
			$("#product_count").focus();
			return false;
		} else if ($("#product_img").val() == "") {
			alert("상품 이미지를 선택해 주세요");
		} else {
			$("#newProduct").submit();
		}
	});

});
