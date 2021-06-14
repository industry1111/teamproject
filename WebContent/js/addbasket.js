
$(function(){
	$("#addbasket").click(function(){
		var product_num = $("#product_num").val();
		var quantity = $("#quantity").val();
		$.ajax({
			type: "get",
			url: contextPath + "/AddCart.do",
			data: {
				product_num : product_num,
				quantity : quantity
			},
			dataType: "text", 
			success: function(data) {
				console.log(data);
				if(data == 0){
					
					if(confirm("상품을 장바구니에 담으러면 로그인해야합니다.")){
						//로그인 팝업창 띄우기
						window.open(contextPath + "/MemberPopupLogin.me","PopupLogin.jsp","width=500,height=500");						
					}
					
				}else{
					if(confirm("장바구니에"+ quantity +"개 담아졌습니다. 장바구니페이지로 이동하시겠습니까?" )){
						location.href = contextPath + "/basket.bo";
					}
				}
			}
			
		});
	});
});