<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>스토어정보변경</title>

<link rel="stylesheet" href="css/seller.css">
<style type="text/css">
.tbl_model {
	position: relative;
	width: 80%;
	table-layout: fixed;
	border-spacing: 0;
	border-collapse: collapse;
	word-wrap: break-word;
	word-break: keep-all;
	border: 0;
	border-bottom: 1px solid #e5e5e5;
}

tbody {tbody { display:table-row-group;
	vertical-align: middle;
	border-color: inherit;
}

}
.tbl_model td, .tbl_model th {
	line-height: 14px;
	text-align: left;
	vertical-align: top;
	letter-spacing: -1px;
	border: 0;
	border-top: 1px solid #e5e5e5;
}

.tbl_model th {
	color: #333;
	border-right: 1px solid #e5e5e5;
	background: #f9f9f9;
}

tr {
	display: table-row;
	vertical-align: inherit;
	border-color: inherit;
}

.contxt_tit {
	font-size: 20px;
}

.contxt_desc {
	font-size: 12px;
	opacity: 0.5;
}
.check{
	color: red;
	font-size: 3px;
}
.check2{
	color: green;
	font-size: 3px;
}
#template{
  	margin-top: 35px
  }
  img{
  	width: 100px; 
  	height: 100px;
  }
.myButton {
	box-shadow:inset 0px 1px 0px 0px #ffffff;
	background:linear-gradient(to bottom, #ffffff 5%, #f6f6f6 100%);
	background-color:#ffffff;
	border-radius:6px;
	border:1px solid #dcdcdc;
	display:inline-block;
	cursor:pointer;
	color:#666666;
	font-family:Arial;
	font-size:15px;
	font-weight:bold;
	padding:6px 24px;
	text-decoration:none;
	text-shadow:0px 1px 0px #ffffff;
}
.myButton:hover {
	background:linear-gradient(to bottom, #f6f6f6 5%, #ffffff 100%);
	background-color:#f6f6f6;
}
.myButton:active {
	position:relative;
	top:1px;
}

.check{
	color: red;
	font-size: 13px;
}
.check2{
	color: green;
	font-size: 13px;
}
</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>var contextPath = "${pageContext.request.contextPath}";</script>
<script src="js/memberupdate.js"></script>
<script src="js/seller.js"></script>
<script type="text/javascript">
$(function() {
	var contextPath = "${pageContext.request.contextPath}";
	//var member_num = ${mdto.member_num};
	var storeidReg = /^[A-Za-z0-9]{8,20}$/;
	var accountReg = /^[0-9]{10,11}$/;
	var categoryReg = /^[가-힣]{2,5}$/;
	var templateReg = /^[가-힣]{2,5}$/; //변경필요함ㅠㅠ 
	var check = 0;
	
	//store_id
	$("#storeid_btn").on("click",function() {
		var store_id = $("#store_id").val();
		$(this).attr("hidden",true);
		$("#store_id").removeAttr("disabled");
		$("#store_id").focus();
		$(".store_id").removeAttr("hidden");
		$(".storeid_cancle").on("click", function() {
			$(".store_id").attr("hidden", true);
			$("#storeid_btn").removeAttr("hidden");
			$("#store_id").val(id);
			$("#store_id").attr("disabled", true);
			$("#storeid_check2").text("");
			$("#storeid_check").text("");
		});
		$("#store_id").blur(function() {
			var store_id2 = $(this).val();
			if(store_id == store_id2){
				$("#storeid_check").text("이전의 스토어명과 동일 합니다.");
				check = 0;
			}else{
				if (storeidReg.test(store_id2)) {
					$.ajax({
						type: "post",
						async: true,
						url: contextPath + "/StoreInfoUpdate",
						data: {
							param: id2,
							command: "store_id",
						},
						dataType: "text",
						success: function(data) {
							if(data == "사용가능한 스토어명입니다."){
								$("#storeid_check2").text(data);
								$("#storeid_check").text("");
								check = 1;
							}else{
								$("#storeid_check").text(data);
								$("#storeid_check2").text("");
								check = 0;
							}
						}
					});
				} else {
					$("#storeid_check").text("특수문자 한글 제외  8~20자 이내로 작성해 주세요");
					$("#storeid_check2").text("");
					check = 0;
				}
			}
		});
		$(".storeid_update").on("click",function() {
			if(check == 1){
				if(window.confirm("변경하시겠습니까?")){
					$("#form").attr("action","memberUpdateAction.do?command=store_id").submit();
				}
			}else{
				$("#store_id").focus();
			}
		});
	});
	
	//account
	$("#account_btn").on("click",function() {
		var phone = $("#account").val();
		$(this).attr("hidden", true);
		$("#account").removeAttr("disabled");
		$("#account").focus();
		$(".account").removeAttr("hidden");
		$(".account_cancle").on("click", function() {
			$(".account").attr("hidden", true);
			$("#account_btn").removeAttr("hidden");
			$("#account").attr("disabled", true);
			$("#account").val(phone);
			$("#account_check").text("");
			$("#account_check2").text("");
		});
		
		$("#account").blur(function() {
			var account2 = $(this).val();
			if(account == account2){
				$("#account_check").text("이전의 계좌번호와 동일 합니다.");
				check = 0;
			}else{
				if (accountReg.test(account2)) {
					$.ajax({
						type: "post",
						async: true,
						url: contextPath + "/StoreInfoUpdate",
						data: {
							param: account2,
							command: "account",
						},
						dataType: "text",
						success: function(data) {
							if(data == "다른 계정에서 사용하고 있는 번호입니다."){
								$("#account_check").text(data);
								$("#account_check2").text("");
								check = 0;
							}else{
								$("#account_check2").text(data);
								$("#account_check").text("");
								check = 1;
							}
						},
					});
				}else{
					$("#account_check").text("입력하신 계좌번호가 맞는지 한번 더 확인해주세요.")
					$("#account_check2").text("");
					check = 0;
				}
			}
		});
		$(".account_update").on("click",function() {
			if(check == 1){
				if(confirm("변경하시겠습니까?")){
					$("#form").attr("action","memberUpdateAction.do?command=account").submit();
				}
			}else{
				$("#account").focus();
			}
		});
});
	
	
	//category
	$("#category_btn").on("click",function() {
		var category = $("#category").val();
		$(this).attr("hidden", true);
		$("#category").removeAttr("disabled");
		$("#category").focus();
		$(".category").removeAttr("hidden");
		$(".category_cancle").on("click", function() {
			$(".category").attr("hidden", true);
			$("#category_btn").removeAttr("hidden");
			$("#category").attr("disabled", true);
			$("#category").val(name);
			$("#category_check2").text("");
			$("#category_check").text("");
		});
		$("#category").blur(function(){
			var category2 = $(this).val();
			if(category == category2){
				$("#category_check").text("이전의 카테고리와 동일 합니다.");
				check = 0;
			}else{
				if(categoryReg.test(category2)){
					$("#category_check2").text("사용가능합니다.");
					$("#category_check").text("");
					check = 1;
				}else{
					$("#category_check").text("카테고리명은 2~5자이내로 한글만 가능합니다");
					$("#category_check2").text("");
					check = 0;
				}
			}
		});
		$(".category_update").on("click",function() {
			if(check == 1){
				if(window.confirm("변경하시겠습니까?")){
					$("#form").attr("action","memberUpdateAction.do?command=category").submit();
				}
			}else{
				$("#category").focus();
			}
		});
	});
	
	
	//template
	$("#template_btn").on("click",function() {
		var name = $("#template").val();
		$(this).attr("hidden", true);
		$("#template").removeAttr("disabled");
		$("#template").focus();
		$(".template").removeAttr("hidden");
		$(".template_cancle").on("click", function() {
			$(".template").attr("hidden", true);
			$("#template_btn").removeAttr("hidden");
			$("#template").attr("disabled", true);
			$("#template").val(name);
			$("#template_check2").text("");
			$("#template_check").text("");
		});
		$("#template").blur(function(){
			var template2 = $(this).val();
			if(template == template2){
				$("#template_check").text("이전의 이름과 동일 합니다.");
				check = 0;
			}else{
				if(templateReg.test(name2)){
					$("#template_check2").text("사용가능합니다.");
					$("#template_check").text("");
					check = 1;
				}else{
					$("#template_check").text("새로운 템플릿을 선택해주세요.");
					$("#template_check2").text("");
					check = 0;
				}
			}
		});
		$(".template_update").on("click",function() {
			if(check == 1){
				if(window.confirm("변경하시겠습니까?")){
					$("#form").attr("action","memberUpdateAction.do?command=template").submit();
				}
			}else{
				$("#template").focus();
			}
		});	
	});
});
		
		
</script>
</head>
<body>

	<p style="font-size: 30;color: gray;">내 스토어 정보</p>
	<form method="post" id="form" enctype="multipart/form-data">
		<table border="0" class="tbl_model">
			<tbody>
				<tr>
					<th width="30%">
						<div>스토어 명</div> 
					</th>
					<td>
						<div>
							<p class="contxt_tit">
								<input type="text" id="store_id" name="store_id" value="${store_id}"
									   disabled="disabled" style="border: 0;"><br>
								<span id="storeid_check" class="check"></span>
                                <span id="storeid_check2" class="check2"></span>
							</p>
							<p class="contxt_desc">스토어명은 한달에 한 번 변경하실 수 있습니다.</p>
							<p>
								<input type="button" id="storeid_btn" value="수정" />
							</p>
							<p class="id" hidden>
								<input class="storeid_cancle" type="button" value="수정 취소" /> 
								<input class="storeid_update" type="button" value="수정 완료" />
							</p>
						</div>
					</td>
				</tr>

				<tr>
					<th>
						<div>프로필</div>
					</th>
					<td>
						<div class="pass_div">
							&nbsp;
							<p>현재 사용중인 프로필<br>
							  	<div class="col-md-8">
										<div class="form-group mb-4">
											<img src="" id="preview" ><br>
											<label for="image">프로필 이미지 선택</label>
											 <input type="file" id="image" name="image" hidden/>
										</div>
									</div>
						</div>
							</p>
							<p class="contxt_desc">스토어에 새롭게 적용하실 프로필을 변경하실 수 있습니다.</p>
				
				<tr>
					<th>
						<div>카테고리</div>
					</th>
					<td>
						<div>
							<p class="contxt_tit">
								<input type="text" id="category" name="category" value="${category}" disabled="disabled" style="border: 0;" maxlength="5"><br>
								<span id="category_check" class="check"></span>
                                <span id="category_check2" class="check2"></span>
							</p>
							<p class="contxt_desc">판매하시는 물품의 카테고리가 변경되었다면 수정하실 수 있습니다.</p>
							<p>
								<input type="button" id="category_btn" value="수정" />
							</p>
							<p class="name" hidden>
								<input class="category_cancle" type="button" value="수정 취소" /> 
								<input class="category_update" type="button" value="수정 완료" />
							</p>
						</div>
					</td>
				</tr>
				<tr>
					<th>
						<div>템플릿</div>
					</th>
					<td>
						<div class="pass_div">
							&nbsp;
							<p>현재 사용중인 템플릿<br>
							  <div class="col-md-9">
							<a href="store.bo">
							<img alt="" src="images/1.png"> 
							<img alt="" src="images/1.png"> 
							</a>
						</div>
							</p>
							<p class="contxt_desc">스토어에 새롭게 적용하실 템플릿을 변경하실 수 있습니다.</p>
							
							<c:forEach var="i" begin="1" step="1" end="4" >
									<div class="col-md-12">
									<hr>
										<div class="row">
											<div class="col-md-3">
												<input type="radio" name="template" id="template" value="template${i}"> template${i}
												<!-- <span id="template_check" class="check"></span>
                        						<span id="template_check2" class="check2"></span> -->
											</div>
											<div class="col-md-9">
												<img alt="" src="images/1.png" >&nbsp;
												<img alt="" src="images/1.png" >&nbsp;
											</div>
										<!-- <p>
											<input type="button" id="template_btn" value="수정" /> 
										</p> -->
										<p class="template" hidden>
											<input class="template_cancle" type="button" value="수정 취소" /> 
											<input class="template_update" type="button" value="수정 완료" />
										</p>
											</div>
										</div>
									</div>
									<%-- <c:if test='${i!=5}'><hr></c:if> --%>
										<hr>
									</c:forEach>
									<div class="col-md-12">
										<div class="form-group d-flex"> </div>
									</div>
							<p>
								<input class="template_btn" type="button" value="수정" /> 
							</p>
						</div>
					</td>
				</tr>
					<th>
						<div>계좌번호</div>
					</th>
					<td>
						<div>
							<p class="contxt_tit">
								<input type="text" id="account" name="account" value="${mdto.account}" disabled="disabled"
									style="border: 0" maxlength="11"><br>
								<span id="account_check" class="check"></span>
                                <span id="account_check2" class="check2"></span>
							</p>
							<p class="contxt_desc">정산대금을 수령하실 계좌번호를 입력해주세요.</p>
							<p>
								<input type="button" id="account_btn" value="수정" />
							</p>
							<p class="account" hidden>
								<input class="account_cancle" type="button" value="수정 취소" /> 
								<input class="account_update" type="button" value="수정 완료" />
							</p>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
		<input type="hidden" name="member_num" value="${mdto.member_num}">
	</form>
</body>
</html>