<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html>
<html>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	var contextPath = "${pageContext.request.contextPath}";
</script>
<script src="js/memberupdate.js"></script>
<script type="text/javascript">
function btn_click() {

	child = window.open("receiver_3.re","child","width=600,height=650");
		
}
function submit_form() {
	
	var form = document.form;
	form.action = contextPath + '/PaymentComplete.or'; 
	form.submit();    
  
}
function cancle_btn_click(){
	
	console.log("dd");
	location.href= contextPath + "/basket.bo";
  
}

$(function(){ 
	
	$("#payment_btn").on("click",function(){
			
		if($("input:radio[id='new_check']").is(':checked')){

			if($("#receiver_name").val() != "" && $("#receiver_phone").val() !="" && $("#adress_name").val() !="" && $("#addr1").val() !="" 
					&& $("#addr2").val() != "" && $("#addr3")!= ""){
				
			      var gsWin = window.open('about:blank','child2',"width=800,height=600 resizable=no, scrollbars=no");
			      var frm = document.form;
			      frm.action = contextPath + '/payment.bo';
			      frm.target ="child2";
			      frm.method ="post";
			      frm.submit();    
				
			}else{
				alert("배송지를 입력해 주세요.");
			}
			
		}else{
			
			 var gsWin = window.open('about:blank','child2',"width=800,height=600 resizable=no, scrollbars=no");
		      var frm = document.form;
		      frm.action = contextPath + '/payment.bo';
		      frm.target ="child2";
		      frm.method ="post";
		      frm.submit();    
		}
	
		}) 
		
		 
});
</script>
<script src="js/order.js"></script>
<head>
<title>주문하기</title>

<style type="text/css">
ul{
   list-style:none;
   }
input {
	border: 0;
}
</style>
</head>
<body>
			<div class="row " >
				<div class="col-md-8 offset-2"  >
					<div class="product-name d-flex " style="background-color: #22CC88 !important; text-align: center; margin-top:100px;" >
							<div class="col-md-12">주문 결제</div>
					</div>
				</div>
			</div>
<div class="col-md-8 offset-2" style="border 1px solid grey;">	
장바구니 > <span style="font-weight: bold;">주문결제</span> > 완료
<hr>
<form name="form" method="post">
<div>
	<div class="product_info">
		<div class="row">
			<div class="col-md-12" align="center" style="display: flex;">
					<div class="col-md-4">
								상품정보
					</div>
					<div class="col-md-2 ">
								판매자
					</div>
					<div class="col-md-1">
								수량
					</div>
					<div class="col-md-3">
								상품금액
					</div>
			</div>
		</div>	
		
		<c:forEach var="i" begin="0" step="1" end="${fn:length(check)-1}">
			<c:forEach var="j" begin="0" step="1" end="${list.size()}">
				<c:if test="${check[i] eq list[j].basket_num}">
					<div class="col-md-12" align="center" style="display: flex;">
							<div class="col-md-4">
							<a>
								<img src="product_img_upload/${list[j].product_img}" style="width: 100px;height: 100px;">
								<input type="hidden" value="${list[j].product_img}"  name="image${i}">
								<input type="hidden" value="${list[j].basket_num}"  name="basket_num${i}">
							</a>
								<input type="text" name="product_name${i}" value="${list[j].product_name}"readonly="readonly"/>
								<input type="hidden" name="product_name_order" value="${list[j].product_name}"/>
							</div>
							<div class="col-md-2 ">
								<input type="text" name="store_name${i}" value="${list[j].store_name}"readonly="readonly"/>
							</div>
							<div class="col-md-1">
								<input type="text" name="quantity${i}" value="${list[j].quantity}"readonly="readonly"/>
							</div>
							<div class="col-md-3">
								<input type="text" name="price${i}" value="${list[j].product_price * list[j].quantity}"readonly="readonly"/>
							</div>
							
							<input type="hidden" value="${list[j].product_num}" name="product_num${i}"/>
							<input type="hidden" name="store_num${i}" value="${list[j].store_num}">
							
							
					</div>	
				</c:if>
			</c:forEach>
		</c:forEach>
							<input type="hidden" value="${fn:length(check)-1}" name="count"/>
	</div>

<div class="deliver_info" >
	<div class="row">
	<div class="col-md-12"  style="display: flex;">
		<div class="col-md-8">
			<h4>배송지 정보</h4>
			<hr>
			<div class="deliver_option" >
				<strong>배송지 선택</strong>
				<div class="deliver_option_wrap">
				<ul>
					<li>
						<span><input type="radio" name="receiver" id="basic" checked/></span><label>기본배송지</label>
						<span><input type="radio" name="receiver" id="new_check"/></span><label>신규배송지</label>
						<span><input type="button" class="myButton" value="배송지 목록" onclick="btn_click();" /></span>
					</li>
					
				</ul>
				
				<c:forEach var="i" begin="0" step="1" end="${rlist.size()}" >
					<c:if test="${rlist[i].basic_num eq 1 }">
					<div class="basic_select">
						<ul>
							<li><input type="text" name="receiver_name" value="${rlist[i].receiver_name}" readonly="readonly"/></li>
							<li><input type="text" name="address_name" value="${rlist[i].address_name}" readonly="readonly"/></li>
							<li><input type="text" name="receiver_phone" value="${rlist[i].receiver_phone}" readonly="readonly"/></li>
							<li>
							<input type="text" name="receiver_addr1" value="${rlist[i].receiver_addr1}" readonly="readonly"/><br>
							<input type="text" name="receiver_addr2" value="${rlist[i].receiver_addr2}" readonly="readonly"/><br>
							<input type="text" name="receiver_addr3" value="${rlist[i].receiver_addr3}" readonly="readonly"/>
							</li>
							<li><span style="font-weight: bold;">배송시 요청사항을 입력해주세요</span></li>
							<li><input type="text" name="receiver_msg" placeholder="입력"/></li>
						</ul>
					</div>
					</c:if>
				</c:forEach>
				<div class="new_select" id="new_select" hidden>
					<ul>
						<li>수령인 : <input type="text" id="receiver_name" name="receiver_name"></li>
						<li>배송지 이름 : <input type="text" id="address_name" name="address_name"></li>
						<li>번호 : <input type="text" id="receiver_phone" name="receiver_phone"></li>
						<li>주소 : <input type="text" id="addr1" name="addr1" >&nbsp;
						<input type="button" onclick="addr_search()" value="우편번호 찾기" id="post_btn" class="myButton"></li>
						<li><input type="text" id="addr2" name="addr2"></li>
						<li><input type="text" id="addr3" name="addr3"></li>
						<li><span style="font-weight: bold;">배송시 요청사항을 입력해주세요</span></li>
						<li><input type="text" name="receiver_msg" placeholder="입력"/></li>
					</ul>
				</div>
				</div>
			</div>
		</div>
		<div class="col-md-4">
		<h4>주문자 정보</h4>
			<hr>
			<div >
				<ul>
					<li>이름 : <input value="${mdto.name}" type="text" readonly="readonly" name="order_name"></li><br>
					<li>연락처 : <input value="${mdto.phone}" type="text" readonly="readonly" name="order_phone"></li><br>
					<li>이메일 : <input value="${mdto.email}" type="text" readonly="readonly" name="order_email"></li><br>
				</ul>
			
		
		</div>
	 </div><!-- 주문자 정보 -->
	</div>
<div> <!-- 배송지,주문자 -->
	
	</div>
	</div>
	<div class="payment_info">
		<h4>결제수단</h4>
		<div>
			주문금액 : <input type="text" name="price_total" value="${price_total}" readonly="readonly">
		
		</div>
		<div>
			<input type="button" class="myButton" value="결제하기" id = "payment_btn" name="payment_btn">
			<input type="button" class="myButton" value="주문취소" id = "cancle_btn" name="cancle_btn" onclick="cancle_btn_click();" >
		</div>
		<div>
			
		</div>
	
	</div>
</div> <!-- 전체 -->	
</form>
</div>	
</body>
<!-- 카카오 우편번호 api -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
function addr_search() {
    new daum.Postcode({
        oncomplete: function(data) { 
            var address = ''; // 주소 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                address = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                address = data.jibunAddress;
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('addr1').value = data.zonecode;
            document.getElementById("addr2").value = address;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("addr3").focus();
        }
    }).open();
}
</script>
</html>