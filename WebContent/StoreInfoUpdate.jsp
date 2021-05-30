<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>스토어 정보 변경</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	var contextPath = "${pageContext.request.contextPath}";
</script>
<script src="js/storeupdate.js"></script>
<style type="text/css">
input[type="text"] {
  width: 40%;
  border: 2px solid DarkGray;
  border-radius: 4px;
  margin: 8px 0;
  outline: none;
  padding: 8px;
  box-sizing: border-box;
  transition: 0.3s;
}

input[type="text"]:focus {
  border-color: dodgerBlue;
  box-shadow: 0 0 8px 0 dodgerBlue;
}

.inputWithIcon input[type="text"] {
  padding-left: 40px;
}

.inputWithIcon {
  position: relative;
}

.check{
	color: red;
	font-size: 14px;
}
.check2{
	color: green;
	font-size: 14px;
}
#template{
  	margin-top: 35px
  }
  img{
  	width: 100px; 
  	height: 100px;
  }

</style>

</head>
<body>

	<p style="font-size: 20;color: gray;">내 스토어 정보</p>
	<form method="post" id="profile_form" name="profile_form" enctype="multipart/form-data">
		<table border="0" class="tbl_model">
			<tbody>
				<tr>
					<th width="30%">
						<div>스토어 명</div> 
					</th>
					<td>
						<div>
							<p class="contxt_tit">
								<input type="text" id="store_name" name="store_name" value="${sdto.store_name}"
									   disabled="disabled" style="border: 0;"><br>
								<span id="store_name_check" class="check"></span>
                                <span id="store_name_check2" class="check2"></span>
							</p>
							<p class="contxt_desc">스토어명은 한달에 한 번 변경하실 수 있습니다.</p>
							<p>
								<input type="button" id="store_name_btn" value="수정" class="myButton" />
							</p>
							<p class="store_name" hidden>
								<input type="button" value="수정 취소" id="store_name_cancle" class="myButton"/> 
								<input type="button" value="수정 완료" id="store_name_update" class="myButton"/>
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
							<p>현재 사용중인 프로필
								<br>
							  	<div class="col-md-8">
										<div class="form-group mb-4">
											<img src="upload_profile/${sdto.profile_img}" id="preview" name="preview"><br>
										</div>
										
											<div class="profile_img" hidden>
												<label for="profile_img">프로필 이미지 선택</label>
												 <input type="file" id="profile_img" name="profile_img" hidden/>
											</div>
									
											<input type="button" class="myButton" name="img_btn" id="img_btn" value="수정">
										<div class="img_btn" hidden>
											<input type="button" class="myButton" name="img_btn_cancle" id="img_btn_cancle" value="수정취소">
											<input type="button" class="myButton" name="img_btn_update" id="img_btn_update" value="수정완료">
										</div>
									</div>
							</p>
						</div>
							<p class="contxt_desc">스토어에 새롭게 적용하실 프로필을 변경하실 수 있습니다.</p>
				
				<tr>
					<th>
						<div>카테고리</div>
					</th>
					
					<td>
					<div>
							<select id="store_c_num" name="store_c_num" disabled="disabled">
									<c:forEach var="i" begin="0" step="1" end="${list.size()}">
										<c:if test="${list[i].category_num eq sdto.category_num}">
											<option value="${sdto.category_num}" selected="selected">${list[i].category_name }</option>
										</c:if>
									</c:forEach>
									<c:forEach var="i" begin="0" step="1" end="${list.size()}">
										<c:if test="${list[i].category_num ne sdto.category_num && list[i].category_codeRef1 eq 0 && list[i].category_codeRef2 eq 0 }">
												<option value="${list[i].category_num}">${list[i].category_name }</option>
										</c:if>
									</c:forEach>
							</select>
							</div>	
					
						<div>
							<p class="contxt_desc">판매하시는 물품의 카테고리가 변경되었다면 수정하실 수 있습니다.</p>
							<p>
								<input type="button" id="store_c_num_btn" value="수정" class="myButton"/>
							</p>
							<p class="store_c_num_btn" hidden>
								<input id="store_c_num_cancle" type="button" value="수정 취소" class="myButton"/> 
								<input id="store_c_num_update" type="button" value="수정 완료" class="myButton"/>
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
								
									<img alt="" src="template/${sdto.template}.jpg" name="template_o" id="template_o"> 
									<img alt="" src="template/${sdto.template}-2.jpg" name="template2_o" id="template2_o"> 
								
							  </div>
							</p>
							<p class="contxt_desc">스토어에 새롭게 적용하실 템플릿을 변경하실 수 있습니다.</p>
							
							<c:forEach var="i" begin="0" step="1" end="4" >
								<c:set var="o_template" value="${sdto.template}"/>
								
									<div class="col-md-12">
										<div class="row">
 												<c:if test="${tlist[i].template_num ne sdto.template}">
											<div class="col-md-3">
													<input hidden	type="radio" class="template" name="template" id="template" value="${tlist[i].template_num}"> ${tlist[i].template_name}
											</div>
														<div class="col-md-9">
															<img alt="" src="template/${tlist[i].template_num}.jpg" >&nbsp;
															<img alt="" src="template/${tlist[i].template_num}-2.jpg" >&nbsp;
														<br>
														</div>
											   	</c:if>
											</div>
										</div>
								</c:forEach>
									</div>			
									<div class="col-md-12">
										<div class="form-group d-flex"> </div>
									</div>
							<p>
										<p class="template" hidden>
											<input id="template_cancle" type="button" value="수정 취소" class="myButton"/> 
											<input id="template_update" type="button" value="수정 완료" class="myButton"/>
										</p>
								<input id="template_btn" type="button" value="수정" class="myButton"/> 
			
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
								<input type="text" id="account" name="account" value="${sdto.account}" disabled="disabled"
									 maxlength="11"><br>
								<span id="account_check" class="check"></span>
                                <span id="account_check2" class="check2"></span>
							</p>
							<p class="contxt_desc">정산대금을 수령하실 계좌번호를 입력해주세요.</p>
							<p>
								<input type="button" id="account_btn" value="수정" class="myButton"/>
							</p>
							<p class="account" hidden>
								<input id="account_cancle" type="button" value="수정 취소" class="myButton"/> 
								<input id="account_update" type="button" value="수정 완료" class="myButton"/>
							</p>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
	</form>
</body>
</html>