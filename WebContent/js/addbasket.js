
$(function(){
	
	$("#addbasket").click(function(){
		var product_num = $("#product_num").val();
		var quantity = $("#var-value").html();
		alert(product_num);
		alert(quantity);
		$.ajax({
			type: "get",
			url: contextPath + "/AddCart.do",
			data: {
				product_num : product_num,
				quantity : quantity
			},
			dataType: "text", 
			success: function(data) {
			}
		});
	});
});