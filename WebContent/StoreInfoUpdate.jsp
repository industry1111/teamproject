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
<script src="js/storeinfo.js"></script>
<script type="text/javascript"></script>
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
								<input type="text" id="store_name" name="store_name" value="${store_name}"
									   disabled="disabled" style="border: 0;"><br>
								<span id="store_name_check" class="check"></span>
                                <span id="store_name_check2" class="check2"></span>
							</p>
							<p class="contxt_desc">스토어명은 한달에 한 번 변경하실 수 있습니다.</p>
							<p>
								<input type="button" id="store_name_btn" value="수정" />
							</p>
							<p class="id" hidden>
								<input class="store_name_cancle" type="button" value="수정 취소" /> 
								<input class="store_name_update" type="button" value="수정 완료" />
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
											 <input type="file" id="profile_img" name="profile_img" hidden/>
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
								<input type="text" id="store_c_num" name="store_c_num" value="${store_c_num}" disabled="disabled" style="border: 0;" maxlength="5"><br>
								<span id="store_c_num_check" class="check"></span>
                                <span id="store_c_num_check2" class="check2"></span>
							</p>
							<p class="contxt_desc">판매하시는 물품의 카테고리가 변경되었다면 수정하실 수 있습니다.</p>
							<p>
								<input type="button" id="store_c_num_btn" value="수정" />
							</p>
							<p class="name" hidden>
								<input class="store_c_num_cancle" type="button" value="수정 취소" /> 
								<input class="store_c_num_update" type="button" value="수정 완료" />
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