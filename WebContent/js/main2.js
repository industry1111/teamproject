$(function() {
	var category_code1 = 0;
	var category_code2 = 0;
	var category_code3 = 0;
	var brand = null;
	var price = null;
	var price1 = null;
	var price2 = null;
	var sort = null;
	var numPerPage = 10;
	
	
	function formatDate(date) { 
		
		var d = new Date(date), 
		month = '' + (d.getMonth() + 1), 
		day = '' + d.getDate(), 
		year = d.getFullYear(); 
		if (month.length < 2) month = '0' + month; 
		if (day.length < 2) day = '0' + day; 
		return [year, month, day].join('-'); 
	}
	
	function productlist(){
		$.ajax({
			type: "get",
			url: contextPath + "/SelectList.do",
			data: {
				category_code1: category_code1,
				category_code2: category_code2,
				category_code3: category_code3,
				brand: brand,
				price1: price1,
				price2: price2,
				price : price,
				sort : sort,
				numPerPage : numPerPage
			},
			dataType: "text", 
			success: function(data) {
				var data1 = data.split("||");
				var obj1 = JSON.parse(data1[0]);
				var obj2 = JSON.parse(data1[1]);
				var obj3 = JSON.parse(data1[2]);
				var p= JSON.parse(data1[3]);
				$(".pagination").html("");
				$("#product-list").html("");
				for(var i=p[0].beginPerPage;i<=p[0].endPerPage;i++){
					if(p[0].total == i){
						break;
					}
					var regdate = formatDate(obj2[i].regdate);
					
					var html = "<div class='col-md-7 offset-2'> <hr>" +
					"<div class='row'>" +
					"<div class='col-md-2'>" +
						"<img src='product_img_upload/"+obj2[i].product_img+"' style='height:150px; width:150px;'>" +
					"</div>" +
					"<div class='col-md-6'>" + obj2[i].product_name + "<br>" + obj2[i].product_description + "<br><br>";
					
					
					for (var j=0;j<obj3.length;j++) {
						if(obj2[i].category_coderef1 == obj3[j].category_code){
					
							html+= obj3[j].category_name  + ">";
						}
						
						if(obj2[i].category_coderef2 == obj3[j].category_code){
							html+= obj3[j].category_name  + ">";
						}
						
						if(obj2[i].category_code1 == obj3[j].category_code){
							html+= obj3[j].category_name +"<br>";
						}
					}

					
					html +=	"상품 가격 : "+obj2[i].product_price+"원 " +
					"<br>"+
					"리뷰수 : &nbsp; 구매건수 : &nbsp;"+
					"등록일 : "+ regdate+ "&nbsp;"+
					"<a id='jjim' >"+
					"<svg xmlns='http://www.w3.org/2000/svg' width='16' height='16' fill='currentColor' class='bi bi-suit-heart' viewBox='0 0 16 16'>"+
	  				"<path d='m8 6.236-.894-1.789c-.222-.443-.607-1.08-1.152-1.595C5.418 2.345 4.776 2 4 2 2.324 2 1 3.326 1 4.92c0 1.211.554 2.066 1.868 3.37.337.334.721.695 1.146 1.093C5.122 10.423 6.5 11.717 8 13.447c1.5-1.73 2.878-3.024 3.986-4.064.425-.398.81-.76 1.146-1.093C14.446 6.986 15 6.131 15 4.92 15 3.326 13.676 2 12 2c-.777 0-1.418.345-1.954.852-.545.515-.93 1.152-1.152 1.595L8 6.236zm.392 8.292a.513.513 0 0 1-.784 0c-1.601-1.902-3.05-3.262-4.243-4.381C1.3 8.208 0 6.989 0 4.92 0 2.755 1.79 1 4 1c1.6 0 2.719 1.05 3.404 2.008.26.365.458.716.596.992a7.55 7.55 0 0 1 .596-.992C9.281 2.049 10.4 1 12 1c2.21 0 4 1.755 4 3.92 0 2.069-1.3 3.288-3.365 5.227-1.193 1.12-2.642 2.48-4.243 4.38z'/>"+
					"</svg>찜하기&nbsp;·"+
					"</a>"+
					"<a id='report' >"+	
					"<svg xmlns='http://www.w3.org/2000/svg' width='16' height='16' fill='currentColor' class='bi bi-emoji-angry' viewBox='0 0 16 16'>"+
  					"<path d='M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z'/>"+
 					"<path d='M4.285 12.433a.5.5 0 0 0 .683-.183A3.498 3.498 0 0 1 8 10.5c1.295 0 2.426.703 3.032 1.75a.5.5 0 0 0 .866-.5A4.498 4.498 0 0 0 8 9.5a4.5 4.5 0 0 0-3.898 2.25.5.5 0 0 0 .183.683zm6.991-8.38a.5.5 0 1 1 .448.894l-1.009.504c.176.27.285.64.285 1.049 0 .828-.448 1.5-1 1.5s-1-.672-1-1.5c0-.247.04-.48.11-.686a.502.502 0 0 1 .166-.761l2-1zm-6.552 0a.5.5 0 0 0-.448.894l1.009.504A1.94 1.94 0 0 0 5 6.5C5 7.328 5.448 8 6 8s1-.672 1-1.5c0-.247-.04-.48-.11-.686a.502.502 0 0 0-.166-.761l-2-1z'/>"+
					"</svg>신고하기"+
					"</a>"+
					"</div>"+
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
				html = "";
					if(p[0].prev == "true"){
						html = "<li class='page-item previous'>" +
						"<a class='page-link' onclick='paging("+(parseInt(p[0].startPage)-1) +");'>Previous</a> </li>";
					}
					for(var i=p[0].startPage;i<=p[0].endPage;i++){
						html += "<li class='page-item'>" ;
						if(p[0].nowPage == i){
						html +=	"<a class='page-link' style='color:red;border-color:black'onclick='paging("+i+");'>";
						}else{
						html +=	"<a class='page-link' onclick='paging("+i+");'>";
						}
						html += i + "</a>"
						+ "</li>";
					}
					if(p[0].next == "true"){
						html += "<li class='page-item next'>" +
						"<a class='page-link' onclick='paging("+(parseInt(p[0].endPage)+1)+")'>Next</a> </li>";
					}
					$(".pagination").append(html);
			}
		});
	}
	

	$(document).on("click", ".category1", function() {
		category_code1 = $(this).val();
		$('.category1').css('color', '#627482');
		$('.category1').css('background-color', 'white');
		$('.category1.allowed').attr('class', 'category1');
		$(this).css('color', 'white');
		$(this).css('background-color', '#c5c5c5');
		$(this).attr('class', 'category1 allowed');
		$.ajax({
			type: "get",
			url: contextPath + "/SelectList.do",
			data: {
				category_code1: category_code1,
				category_code2: 0,
				category_code3: 0,
				brand: brand,
				price1: price1,
				price2: price2,
				price : price,
				sort : sort,
				numPerPage : numPerPage
			},
			dataType: "text",
			success: function(data) {
				var data1 = data.split("||");
				
				var obj1 = JSON.parse(data1[0]);
				var obj2 = JSON.parse(data1[1]);
				var obj3 = JSON.parse(data1[2]);
				var p= JSON.parse(data1[3]);
				$("#product-list").html("");
				$("#category2").html("");
				$("#category3").html("");
				$(".pagination").html("");
				for (var i=0;i<obj1.length;i++) {
					$("#category2").append("<li class='category2' value=" + obj1[i].category_code + ">" + obj1[i].category_name + "</li>");
				}
				for(var i=p[0].beginPerPage;i<=p[0].endPerPage;i++){
					if(p[0].total == i){
						break;
					}
					var regdate = formatDate(obj2[i].regdate);
					
					var html = "<div class='col-md-7 offset-2'> <hr>" +
					"<div class='row'>" +
					"<div class='col-md-2'>" +
						"<img src='product_img_upload/"+obj2[i].product_img+"' style='height:150px; width:150px;'>" +
					"</div>" +
					"<div class='col-md-6'>" + obj2[i].product_name + "<br>" + obj2[i].product_description + "<br><br>";
					
					
					for (var j=0;j<obj3.length;j++) {
						if(obj2[i].category_coderef1 == obj3[j].category_code){
					
							html+= obj3[j].category_name  + ">";
						}
						
						if(obj2[i].category_coderef2 == obj3[j].category_code){
							html+= obj3[j].category_name  + ">";
						}
						
						if(obj2[i].category_code1 == obj3[j].category_code){
							html+= obj3[j].category_name +"<br>";
						}
					}

					
					html +=	"상품 가격 : "+obj2[i].product_price+"원 " +
					"<br>"+
					"리뷰수 : &nbsp; 구매건수 : &nbsp;"+
					"등록일 : "+ regdate+ "&nbsp;"+
					"<a id='jjim' >"+
					"<svg xmlns='http://www.w3.org/2000/svg' width='16' height='16' fill='currentColor' class='bi bi-suit-heart' viewBox='0 0 16 16'>"+
	  				"<path d='m8 6.236-.894-1.789c-.222-.443-.607-1.08-1.152-1.595C5.418 2.345 4.776 2 4 2 2.324 2 1 3.326 1 4.92c0 1.211.554 2.066 1.868 3.37.337.334.721.695 1.146 1.093C5.122 10.423 6.5 11.717 8 13.447c1.5-1.73 2.878-3.024 3.986-4.064.425-.398.81-.76 1.146-1.093C14.446 6.986 15 6.131 15 4.92 15 3.326 13.676 2 12 2c-.777 0-1.418.345-1.954.852-.545.515-.93 1.152-1.152 1.595L8 6.236zm.392 8.292a.513.513 0 0 1-.784 0c-1.601-1.902-3.05-3.262-4.243-4.381C1.3 8.208 0 6.989 0 4.92 0 2.755 1.79 1 4 1c1.6 0 2.719 1.05 3.404 2.008.26.365.458.716.596.992a7.55 7.55 0 0 1 .596-.992C9.281 2.049 10.4 1 12 1c2.21 0 4 1.755 4 3.92 0 2.069-1.3 3.288-3.365 5.227-1.193 1.12-2.642 2.48-4.243 4.38z'/>"+
					"</svg>찜하기&nbsp;·"+
					"</a>"+
					"<a id='report' >"+	
					"<svg xmlns='http://www.w3.org/2000/svg' width='16' height='16' fill='currentColor' class='bi bi-emoji-angry' viewBox='0 0 16 16'>"+
  					"<path d='M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z'/>"+
 					"<path d='M4.285 12.433a.5.5 0 0 0 .683-.183A3.498 3.498 0 0 1 8 10.5c1.295 0 2.426.703 3.032 1.75a.5.5 0 0 0 .866-.5A4.498 4.498 0 0 0 8 9.5a4.5 4.5 0 0 0-3.898 2.25.5.5 0 0 0 .183.683zm6.991-8.38a.5.5 0 1 1 .448.894l-1.009.504c.176.27.285.64.285 1.049 0 .828-.448 1.5-1 1.5s-1-.672-1-1.5c0-.247.04-.48.11-.686a.502.502 0 0 1 .166-.761l2-1zm-6.552 0a.5.5 0 0 0-.448.894l1.009.504A1.94 1.94 0 0 0 5 6.5C5 7.328 5.448 8 6 8s1-.672 1-1.5c0-.247-.04-.48-.11-.686a.502.502 0 0 0-.166-.761l-2-1z'/>"+
					"</svg>신고하기"+
					"</a>"+
					"</div>"+
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
					
					html = "";
					if(p[0].prev == "true"){
						html = "<li class='page-item previous'>" +
						"<a class='page-link' onclick='paging("+(parseInt(p[0].startPage)-1) +");'>Previous</a> </li>";
					}
					for(var i=p[0].startPage;i<=p[0].endPage;i++){
						html += "<li class='page-item'>" ;
						if(p[0].nowPage == i){
						html +=	"<a class='page-link' style='color:red;border-color:black'onclick='paging("+i+");'>";
						}else{
						html +=	"<a class='page-link' onclick='paging("+i+");'>";
						}
						html += i + "</a>"
						+ "</li>";
					}
					if(p[0].next == "true"){
						html += "<li class='page-item next'>" +
						"<a class='page-link' onclick='paging("+(parseInt(p[0].endPage)+1)+")'>Next</a> </li>";
					}
					$(".pagination").append(html);
			}
		});
	});
	
	
	$(document).on("click", ".category1.allowed", function() {
		$(this).css('background-color', 'white');
		$(this).css('color', '#627482'); 
		$(this).attr('class', 'category1');
		category_code1 = 0;
		category_code2 = 0;
		category_code3 = 0;
		$.ajax({
			type: "get",
			url: contextPath + "/SelectList.do",
			data: {
				category_code1: category_code1,
				category_code2: category_code2,
				category_code3: category_code3,
				brand: brand,
				price1: price1,
				price2: price2,
				price : price,
				sort : sort,
				numPerPage: numPerPage
			},
			dataType: "text",
			success: function(data) {
				var data1 = data.split("||");
				var obj1 = JSON.parse(data1[0]);
				var obj2 = JSON.parse(data1[1]);
				var obj3 = JSON.parse(data1[2]);
				var p= JSON.parse(data1[3]);
				$("#product-list").html("");
				$("#category2").html("");
				$("#category3").html("");
				$(".pagination").html("");
				var html ="";
				for (var i=0;i<obj1.length;i++) {
					if(i < 10){
						html +="<li class='category2' value=" + obj1[i].category_code + ">" + obj1[i].category_name + "</li>";
					}
					if(i >= 10){
						html += "<li class='category2 hide' hidden value=" + obj1[i].category_code + ">" + obj1[i].category_name + "</li>";
					}
				}
				html += "<li class='mbtn'>"
						+"<svg xmlns='http://www.w3.org/2000/svg' width='16' height='16' fill='currentColor' class='bi bi-caret-down' viewBox='0 0 16 16'>"
						+"<path d='M3.204 5h9.592L8 10.481 3.204 5zm-.753.659 4.796 5.48a1 1 0 0 0 1.506 0l4.796-5.48c.566-.647.106-1.659-.753-1.659H3.204a1 1 0 0 0-.753 1.659z'/>"
						+"</svg>";
				html += "<li class='dbtn' hidden>"
						+"<svg xmlns='http://www.w3.org/2000/svg' width='16' height='16' fill='currentColor' class='bi bi-caret-down' viewBox='0 0 16 16'>"
						+"<path d='M3.204 11h9.592L8 5.519 3.204 11zm-.753-.659 4.796-5.48a1 1 0 0 1 1.506 0l4.796 5.48c.566.647.106 1.659-.753 1.659H3.204a1 1 0 0 1-.753-1.659z'/>"
						+"</svg>";
				$("#category2").append(html);
				
				for(var i=p[0].beginPerPage;i<=p[0].endPerPage;i++){
					if(p[0].total == i){
						break;
					}
					var regdate = formatDate(obj2[i].regdate);
					
					html = "<div class='col-md-7 offset-2'> <hr>" +
					"<div class='row'>" +
					"<div class='col-md-2'>" +
						"<img src='product_img_upload/"+obj2[i].product_img+"' style='height:150px; width:150px;'>" +
					"</div>" +
					"<div class='col-md-6'>" + obj2[i].product_name + "<br>" + obj2[i].product_description + "<br><br>";
					
					
					for (var j=0;j<obj3.length;j++) {
						if(obj2[i].category_coderef1 == obj3[j].category_code){
					
							html+= obj3[j].category_name  + ">";
						}
						
						if(obj2[i].category_coderef2 == obj3[j].category_code){
							html+= obj3[j].category_name  + ">";
						}
						
						if(obj2[i].category_code1 == obj3[j].category_code){
							html+= obj3[j].category_name +"<br>";
						}
					}

					
					html +=	"상품 가격 : "+obj2[i].product_price+"원 " +
					"<br>"+
					"리뷰수 : &nbsp; 구매건수 : &nbsp;"+
					"등록일 : "+ regdate+ "&nbsp;"+
					"<a id='jjim' >"+
					"<svg xmlns='http://www.w3.org/2000/svg' width='16' height='16' fill='currentColor' class='bi bi-suit-heart' viewBox='0 0 16 16'>"+
	  				"<path d='m8 6.236-.894-1.789c-.222-.443-.607-1.08-1.152-1.595C5.418 2.345 4.776 2 4 2 2.324 2 1 3.326 1 4.92c0 1.211.554 2.066 1.868 3.37.337.334.721.695 1.146 1.093C5.122 10.423 6.5 11.717 8 13.447c1.5-1.73 2.878-3.024 3.986-4.064.425-.398.81-.76 1.146-1.093C14.446 6.986 15 6.131 15 4.92 15 3.326 13.676 2 12 2c-.777 0-1.418.345-1.954.852-.545.515-.93 1.152-1.152 1.595L8 6.236zm.392 8.292a.513.513 0 0 1-.784 0c-1.601-1.902-3.05-3.262-4.243-4.381C1.3 8.208 0 6.989 0 4.92 0 2.755 1.79 1 4 1c1.6 0 2.719 1.05 3.404 2.008.26.365.458.716.596.992a7.55 7.55 0 0 1 .596-.992C9.281 2.049 10.4 1 12 1c2.21 0 4 1.755 4 3.92 0 2.069-1.3 3.288-3.365 5.227-1.193 1.12-2.642 2.48-4.243 4.38z'/>"+
					"</svg>찜하기&nbsp;·"+
					"</a>"+
					"<a id='report' >"+	
					"<svg xmlns='http://www.w3.org/2000/svg' width='16' height='16' fill='currentColor' class='bi bi-emoji-angry' viewBox='0 0 16 16'>"+
  					"<path d='M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z'/>"+
 					"<path d='M4.285 12.433a.5.5 0 0 0 .683-.183A3.498 3.498 0 0 1 8 10.5c1.295 0 2.426.703 3.032 1.75a.5.5 0 0 0 .866-.5A4.498 4.498 0 0 0 8 9.5a4.5 4.5 0 0 0-3.898 2.25.5.5 0 0 0 .183.683zm6.991-8.38a.5.5 0 1 1 .448.894l-1.009.504c.176.27.285.64.285 1.049 0 .828-.448 1.5-1 1.5s-1-.672-1-1.5c0-.247.04-.48.11-.686a.502.502 0 0 1 .166-.761l2-1zm-6.552 0a.5.5 0 0 0-.448.894l1.009.504A1.94 1.94 0 0 0 5 6.5C5 7.328 5.448 8 6 8s1-.672 1-1.5c0-.247-.04-.48-.11-.686a.502.502 0 0 0-.166-.761l-2-1z'/>"+
					"</svg>신고하기"+
					"</a>"+
					"</div>"+
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
					
					html = "";
					if(p[0].prev == "true"){
						html = "<li class='page-item previous'>" +
						"<a class='page-link' onclick='paging("+(parseInt(p[0].startPage)-1) +");'>Previous</a> </li>";
					}
					for(var i=p[0].startPage;i<=p[0].endPage;i++){
						html += "<li class='page-item'>" ;
						if(p[0].nowPage == i){
						html +=	"<a class='page-link' style='color:red;border-color:black'onclick='paging("+i+");'>";
						}else{
						html +=	"<a class='page-link' onclick='paging("+i+");'>";
						}
						html += i + "</a>"
						+ "</li>";
					}
					if(p[0].next == "true"){
						html += "<li class='page-item next'>" +
						"<a class='page-link' onclick='paging("+(parseInt(p[0].endPage)+1)+")'>Next</a> </li>";
					}
					$(".pagination").append(html);
			}
		});
	});
	
	$(document).on("click", ".category2", function() {
		category_code2 = $(this).val();
		$('.category2').css('color', '#627482');
		$('.category2').css('background-color', 'white');
		
		$(this).css('color', 'white');
		$(this).css('background-color', '#c5c5c5');
		if($('.category2.allowed').hasClass("hide") === true){
			$('.category2.allowed').attr('class', 'category2 hide');
		}else{
			$('.category2.allowed').attr('class', 'category2');	
		}
		if($(this).hasClass("hide") === true) {
			$(this).attr('class', 'category2 allowed hide');
		}else{
			$(this).attr('class', 'category2 allowed');
		}
		
		$.ajax({
			type: "get",
			url: contextPath + "/SelectList.do",
			data: {
				category_code1: category_code1,
				category_code2: category_code2,
				category_code3: 0,
				brand: brand,
				price1: price1,
				price2: price2,
				price : price,
				sort : sort,
				numPerPage: numPerPage
			},
			dataType: "text", 
			success: function(data) {
				var data1 = data.split("||");
				var obj1 = JSON.parse(data1[0]);
				var obj2 = JSON.parse(data1[1]);
				var obj3 = JSON.parse(data1[2]);
				var p= JSON.parse(data1[3]);
				$(".pagination").html("");
				$("#product-list").html("");
				$("#category3").html("");
				for (var i = 0; i < obj1.length; i++) {
					$("#category3").append("<li class='category3' value=" + obj1[i].category_code + ">" + obj1[i].category_name + "</li>");
				}
				
				for(var i=p[0].beginPerPage;i<=p[0].endPerPage;i++){
					if(p[0].total == i){
						break;
					}
					var regdate = formatDate(obj2[i].regdate);
					
					var html = "<div class='col-md-7 offset-2'> <hr>" +
					"<div class='row'>" +
					"<div class='col-md-2'>" +
						"<img src='product_img_upload/"+obj2[i].product_img+"' style='height:150px; width:150px;'>" +
					"</div>" +
					"<div class='col-md-6'>" + obj2[i].product_name + "<br>" + obj2[i].product_description + "<br><br>";
					
					
					for (var j=0;j<obj3.length;j++) {
						if(obj2[i].category_coderef1 == obj3[j].category_code){
					
							html+= obj3[j].category_name  + ">";
						}
						
						if(obj2[i].category_coderef2 == obj3[j].category_code){
							html+= obj3[j].category_name  + ">";
						}
						
						if(obj2[i].category_code1 == obj3[j].category_code){
							html+= obj3[j].category_name +"<br>";
						}
					}

					
					html +=	"상품 가격 : "+obj2[i].product_price+"원 " +
					"<br>"+
					"리뷰수 : &nbsp; 구매건수 : &nbsp;"+
					"등록일 : "+ regdate+ "&nbsp;"+
					"<a id='jjim' >"+
					"<svg xmlns='http://www.w3.org/2000/svg' width='16' height='16' fill='currentColor' class='bi bi-suit-heart' viewBox='0 0 16 16'>"+
	  				"<path d='m8 6.236-.894-1.789c-.222-.443-.607-1.08-1.152-1.595C5.418 2.345 4.776 2 4 2 2.324 2 1 3.326 1 4.92c0 1.211.554 2.066 1.868 3.37.337.334.721.695 1.146 1.093C5.122 10.423 6.5 11.717 8 13.447c1.5-1.73 2.878-3.024 3.986-4.064.425-.398.81-.76 1.146-1.093C14.446 6.986 15 6.131 15 4.92 15 3.326 13.676 2 12 2c-.777 0-1.418.345-1.954.852-.545.515-.93 1.152-1.152 1.595L8 6.236zm.392 8.292a.513.513 0 0 1-.784 0c-1.601-1.902-3.05-3.262-4.243-4.381C1.3 8.208 0 6.989 0 4.92 0 2.755 1.79 1 4 1c1.6 0 2.719 1.05 3.404 2.008.26.365.458.716.596.992a7.55 7.55 0 0 1 .596-.992C9.281 2.049 10.4 1 12 1c2.21 0 4 1.755 4 3.92 0 2.069-1.3 3.288-3.365 5.227-1.193 1.12-2.642 2.48-4.243 4.38z'/>"+
					"</svg>찜하기&nbsp;·"+
					"</a>"+
					"<a id='report' >"+	
					"<svg xmlns='http://www.w3.org/2000/svg' width='16' height='16' fill='currentColor' class='bi bi-emoji-angry' viewBox='0 0 16 16'>"+
  					"<path d='M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z'/>"+
 					"<path d='M4.285 12.433a.5.5 0 0 0 .683-.183A3.498 3.498 0 0 1 8 10.5c1.295 0 2.426.703 3.032 1.75a.5.5 0 0 0 .866-.5A4.498 4.498 0 0 0 8 9.5a4.5 4.5 0 0 0-3.898 2.25.5.5 0 0 0 .183.683zm6.991-8.38a.5.5 0 1 1 .448.894l-1.009.504c.176.27.285.64.285 1.049 0 .828-.448 1.5-1 1.5s-1-.672-1-1.5c0-.247.04-.48.11-.686a.502.502 0 0 1 .166-.761l2-1zm-6.552 0a.5.5 0 0 0-.448.894l1.009.504A1.94 1.94 0 0 0 5 6.5C5 7.328 5.448 8 6 8s1-.672 1-1.5c0-.247-.04-.48-.11-.686a.502.502 0 0 0-.166-.761l-2-1z'/>"+
					"</svg>신고하기"+
					"</a>"+
					"</div>"+
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
				html = "";
					if(p[0].prev == "true"){
						html = "<li class='page-item previous'>" +
						"<a class='page-link' onclick='paging("+(parseInt(p[0].startPage)-1) +");'>Previous</a> </li>";
					}
					for(var i=p[0].startPage;i<=p[0].endPage;i++){
						html += "<li class='page-item'>" ;
						if(p[0].nowPage == i){
						html +=	"<a class='page-link' style='color:red;border-color:black'onclick='paging("+i+");'>";
						}else{
						html +=	"<a class='page-link' onclick='paging("+i+");'>";
						}
						html += i + "</a>"
						+ "</li>";
					}
					if(p[0].next == "true"){
						html += "<li class='page-item next'>" +
						"<a class='page-link' onclick='paging("+(parseInt(p[0].endPage)+1)+")'>Next</a> </li>";
					}
					$(".pagination").append(html);
			}
		});

	});
	$(document).on("click", ".category2.allowed", function() {
		$(this).css('background-color', 'white');
		$(this).css('color', '#627482');
		
		if($(this).hasClass("hide") === true) {
			$(this).attr('class','category2 hide');
		}else{
			$(this).attr('class','category2');
		}
		
		category_code2 = 0;
		category_code3 = 0;
		productlist();
	});
	
	
	$(document).on("click", ".category3", function() {
		category_code3 = $(this).val();
		$('.category3').css('color', '#627482');
		$('.category3').css('background-color', 'white');
		$(this).css('color', 'white');
		$(this).css('background-color', '#c5c5c5');
		if($('.category3.allowed').hasClass("hide") === true){
			$('.category3.allowed').attr('class', 'category3 hide');
		}else{
			$('.category3.allowed').attr('class', 'category3');	
		}
		if($(this).hasClass("hide") === true) {
			$(this).attr('class', 'category3 allowed hide');
		}else{
			$(this).attr('class', 'category3 allowed');
		}
		productlist();
	});
	$(document).on("click", ".category3.allowed", function() {
		$(this).css('background-color', 'white');
		$(this).css('color', '#627482');
		
		if($(this).hasClass("hide") === true) {
			$(this).attr('class','category3 hide');
		}else{
			$(this).attr('class','category3');
		}
		category_code3 = 0;
		productlist();
	});
	
	
	$(document).on("click", ".price", function() {
		
		price = $(this).val();
		price1 =  $("#price1").val();
		price2 =  $("#price2").val();
		$('.price').css('color', '#627482');
		$('.price').css('background-color', 'white');
		$('.price.allowed').attr('class', 'price');
		$(this).css('color', 'white');
		$(this).css('background-color', '#c5c5c5');
		$(this).attr('class', 'price allowed');
		
		productlist();
	});
	
	$(document).on("click", ".price.allowed", function() {
		$(this).css('background-color', 'white');
		$(this).css('color', '#627482');
		$(this).attr('class', 'price');
		price = null;
		price1 = null;
		price2 = null;
		
		productlist();
	});
	
	
	$(document).on("click", ".sort", function() {
		
		$(".sort").css('color', "gray");
		$(this).css('color', 'black');

		sort = $(this).val();
		
		productlist();
	});
	
		//autocomplete
	$("#searchBox").autocomplete({
            source : function( request, response ) {
                 $.ajax({
                        type: 'get',
                        url: contextPath+"/searchBox",
                        dataType: "text",
                        data: {"searchBox":$("#searchBox").val()},
                        success: function(data) {
                        	var obj = JSON.parse(data);
                        	console.log(new Set(obj.name));
                            response(
                                $.map(obj, function(item) {    //json[i] 번째 에 있는게 item 임.
                                    return {
                                        label: item.name,   //UI 에서 보여지는 글자, 실제 검색어랑 비교 대상
                                        value: item.name,    //그냥 사용자 설정값?
                                    }
                                })
                            );
                        }
                   });
                },    // source 는 자동 완성 대상
            focus : function(event, ui) {    //포커스 가면
                return false;//한글 에러 잡기용도로 사용됨
            },
            minLength: 1,// 최소 글자수
            autoFocus: true, //첫번째 항목 자동 포커스 기본값 false
            close : function(event){    //자동완성창 닫아질때 호출
                console.log(event);
            }
        });
		paging = function(nowpage){
		$.ajax({
			type: "get",
			url: contextPath + "/SelectList.do",
			data: {
				category_code1: category_code1,
				category_code2: category_code2,
				category_code3: category_code3,
				brand: brand,
				price1: price1,
				price2: price2,
				price : price,
				sort : sort,
				page:true,
				nowPage: nowpage,
				numPerPage: numPerPage
			},
			dataType: "text",
			success: function(data) {
				var data1 = data.split("||");
				
				var obj1 = JSON.parse(data1[0]);
				var obj2 = JSON.parse(data1[1]);
				var obj3 = JSON.parse(data1[2]);
				var p= JSON.parse(data1[3]);
				$("#product-list").html("");
				$(".pagination").html("");
 				for(var i=p[0].beginPerPage;i<=p[0].endPerPage;i++){
					if(p[0].total == i){
						break;
					}
					var regdate = formatDate(obj2[i].regdate);
					
					var html = "<div class='col-md-7 offset-2'> <hr>" +
					"<div class='row'>" +
					"<div class='col-md-2'>" +
						"<img src='product_img_upload/"+obj2[i].product_img+"' style='height:150px; width:150px;'>" +
					"</div>" +
					"<div class='col-md-6'>" + obj2[i].product_name + "<br>" + obj2[i].product_description + "<br><br>";
					
					
					for (var j=0;j<obj3.length;j++) {
						if(obj2[i].category_coderef1 == obj3[j].category_code){
					
							html+= obj3[j].category_name  + ">";
						}
						
						if(obj2[i].category_coderef2 == obj3[j].category_code){
							html+= obj3[j].category_name  + ">";
						}
						
						if(obj2[i].category_code1 == obj3[j].category_code){
							html+= obj3[j].category_name +"<br>";
						}
					}

					
					html +=	"상품 가격 : "+obj2[i].product_price+"원 " +
					"<br>"+
					"리뷰수 : &nbsp; 구매건수 : &nbsp;"+
					"등록일 : "+ regdate+ "&nbsp;"+
					"<a id='jjim' >"+
					"<svg xmlns='http://www.w3.org/2000/svg' width='16' height='16' fill='currentColor' class='bi bi-suit-heart' viewBox='0 0 16 16'>"+
	  				"<path d='m8 6.236-.894-1.789c-.222-.443-.607-1.08-1.152-1.595C5.418 2.345 4.776 2 4 2 2.324 2 1 3.326 1 4.92c0 1.211.554 2.066 1.868 3.37.337.334.721.695 1.146 1.093C5.122 10.423 6.5 11.717 8 13.447c1.5-1.73 2.878-3.024 3.986-4.064.425-.398.81-.76 1.146-1.093C14.446 6.986 15 6.131 15 4.92 15 3.326 13.676 2 12 2c-.777 0-1.418.345-1.954.852-.545.515-.93 1.152-1.152 1.595L8 6.236zm.392 8.292a.513.513 0 0 1-.784 0c-1.601-1.902-3.05-3.262-4.243-4.381C1.3 8.208 0 6.989 0 4.92 0 2.755 1.79 1 4 1c1.6 0 2.719 1.05 3.404 2.008.26.365.458.716.596.992a7.55 7.55 0 0 1 .596-.992C9.281 2.049 10.4 1 12 1c2.21 0 4 1.755 4 3.92 0 2.069-1.3 3.288-3.365 5.227-1.193 1.12-2.642 2.48-4.243 4.38z'/>"+
					"</svg>찜하기&nbsp;·"+
					"</a>"+
					"<a id='report' >"+	
					"<svg xmlns='http://www.w3.org/2000/svg' width='16' height='16' fill='currentColor' class='bi bi-emoji-angry' viewBox='0 0 16 16'>"+
  					"<path d='M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z'/>"+
 					"<path d='M4.285 12.433a.5.5 0 0 0 .683-.183A3.498 3.498 0 0 1 8 10.5c1.295 0 2.426.703 3.032 1.75a.5.5 0 0 0 .866-.5A4.498 4.498 0 0 0 8 9.5a4.5 4.5 0 0 0-3.898 2.25.5.5 0 0 0 .183.683zm6.991-8.38a.5.5 0 1 1 .448.894l-1.009.504c.176.27.285.64.285 1.049 0 .828-.448 1.5-1 1.5s-1-.672-1-1.5c0-.247.04-.48.11-.686a.502.502 0 0 1 .166-.761l2-1zm-6.552 0a.5.5 0 0 0-.448.894l1.009.504A1.94 1.94 0 0 0 5 6.5C5 7.328 5.448 8 6 8s1-.672 1-1.5c0-.247-.04-.48-.11-.686a.502.502 0 0 0-.166-.761l-2-1z'/>"+
					"</svg>신고하기"+
					"</a>"+
					"</div>"+
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
					var html2 = "";
					if(p[0].prev == "true"){
						html2 = "<li class='page-item previous'>" +
						"<a class='page-link' onclick='paging("+(parseInt(p[0].startPage)-1)+");'>Previous</a> </li>";
					}
					for(var i=p[0].startPage;i<=p[0].endPage;i++){
						html2 += "<li class='page-item'>" ;
						if(p[0].nowPage == i){
						html2 +=	"<a class='page-link' style='color:red;border-color:black'onclick='paging("+i+");'>";
						}else{
						html2 +=	"<a class='page-link' onclick='paging("+i+");'>";
						}
						html2 += i + "</a>"
						+ "</li>";
					}
					if(p[0].next == "true"){
						html2 += "<li class='page-item next'>" +
						"<a class='page-link' onclick='paging("+(parseInt(p[0].endPage)+1)+")'>Next</a> </li>";
					}
					$(".pagination").append(html2);
			}
		});
	}
	$(document).on("click",".mbtn",function(){
		$(this).attr("hidden",true);
		$(this).siblings(".hide").removeAttr("hidden");
		$(this).siblings(".dbtn").removeAttr("hidden");
	});
	$(document).on("click",".dbtn",function(){
		$(this).attr("hidden",true);
		$(this).siblings(".hide").attr("hidden",true);
		$(this).siblings(".mbtn").removeAttr("hidden");
	});
	$(document).on("change","#numPerPage",function(){
		numPerPage = $(this).val();
		productlist();
	});
});
	