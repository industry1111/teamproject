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
	
    //이름은 중복창 제어용
	child = window.open("receiver_3.bo","child","width=600,height=650");
		
}
</script>
<script src="js/order.js"></script>
<head>
<title>주문하기</title>

<style type="text/css">
ul{
   list-style:none;
   }

</style>
</head>
<body>
<h4>주문/결제</h4>
<hr>
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
							</a>
								<h6>${list[j].product_name}</h6>
							</div>
							<div class="col-md-2 ">
								<h6>${list[j].store_name}</h6>
							</div>
							<div class="col-md-1">
								<h6>${list[j].quantity}</h6>
							</div>
							<div class="col-md-3">
								<h6>${list[j].product_price * list[j].quantity}</h6>
							</div>
					</div>	
				</c:if>
			</c:forEach>
		</c:forEach>
		
	</div>

	<div class="deliver_info" >
		<h4>배송지 정보</h4>
		<div class="deliver_option">
			<strong>배송지 선택</strong>
			<div class="deliver_option_wrap">
			<ul>
				<li>
					<span><input type="radio"/></span><label>기본배송지</label>
					<span><input type="radio" id="new"/></span><label>신규배송지</label>
					<span><input type="button" value="배송지 목록" onclick="btn_click();"/></span>
				</li>
				<hr>
			</ul>
			
			<c:forEach var="i" begin="0" step="1" end="${rlist.size()}" >
				<c:if test="${rlist[i].basic_num eq 1 }">
				<div class="basic">
					<ul>
						<li>${rlist[i].address_name}</li>
						<li>${rlist[i].receiver_phone}</li>
						<li>(${rlist[i].receiver_addr1})
						${rlist[i].receiver_addr2}
						${rlist[i].receiver_addr3}</li>
						<li><input type="text" placeholder="배송 요청사항"/></li>
					</ul>
				</div>
				</c:if>
			</c:forEach>
			<div class="new">
			<ul>
				<li>수령인 : </li>
				<li>배송지 이름 : </li>
				<li>번호</li>
				<li><input type="text" >
					${rlist[i].receiver_addr2}
					${rlist[i].receiver_addr3}</li>
				<li><input type="text" placeholder="배송 요청사항"/></li>
			</ul>
			</div>
			</div>
		</div>
	
	</div>
	<div class="payment_info">
		<h4>결제수단</h4>
	
	
	
	</div>

</div> <!-- 전체 -->	
</body>
</html>