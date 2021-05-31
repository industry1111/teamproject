<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
.wrap{
	font-size: 12px;
}
.category{
	background-color: navy; 
	color: white;
}
ul {
    list-style:none;
    padding:0;
}

li {
    margin-left:30px;
    float: left;
    margin-top: 10px;
}
.list{
 	border: 1px solid #f3f3f3; 
 	
}
input::placeholder { text-align: right;}
.price{
	width: 130px;
}
</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	var contextPath = "${pageContext.request.contextPath}";
</script>
<script src="js/main2.js"></script>
</head>

<body>
		<div class="row">
			<div class="col-md-3" align="right">
				<a href="index.bo"> <img
					src="images/shopping.png"
					alt="shopping" style="height: 28px">
				</a>
			</div>
			<div class="col-md-6">
				<input type="text">
				<img
					src="images/magnifying-glass.png"
					alt="shopping" style="height: 23px">
			</div>
		</div>
		<div class="wrap" style="margin-left: 100px;">
			<div class="row" style="margin-top: 40px;">
				<div class="col-md-1 offset-2 category" align="left" >카테고리</div>
				<div class="col-md-6 list">
					<ul >
						<li class="category1" value="0">전체</li>
						<c:forEach var="i" begin="0" step="1" end="${clist.size()-1}"> <%-- -1제거하고 실행 --%>
							<c:if test="${clist[i].category_codeRef1 eq 0 && clist[i].category_codeRef2 eq 0}">
								<li class="category1" value="${clist[i].category_code }">${clist[i].category_name }</li>
							</c:if>
						</c:forEach>
					</ul>
				</div>
			</div>
			<div class="row">
				<div class="col-md-1 offset-2 category" align="left">중분류</div>
					<div class="col-md-6 list">
						<ul id="category2">
						</ul>
				</div>
			</div>
			<div class="row">
				<div class="col-md-1 offset-2 category" align="left">소분류</div>
					<div class="col-md-6 list">
						<ul id="category3">
						</ul>
				</div>
			</div>
			<div class="row" >
				<div class="col-md-1 offset-2 category" align="left" style="">가격</div>
				<div class="col-md-6 list">
					<ul>
						<li>1만원이하</li>
						<li>1만원~5만원</li>
						<li>5만원~10만원</li>
						<li>직접입력 &nbsp;<input class="price" type="text" placeholder="원"></li>
						<li>~</li>
						<li>
							<input class="price" type="text" placeholder="원">
								<img src="images/magnifying-glass.png" alt="shopping" style="height: 15px">
						</li>
					</ul>
				</div>
			</div>
			<div class="row" style="margin-top: 60px">
				<div class="col-md-6 offset-2">
					<ul >
						<li  class="sort">
							<a>랭킹순</a>
						</li>
						<li  class="sort">
							<a>낮은 가격순</a>
						</li>
						<li  class="sort">
							<a>높은 가격순</a>
						</li>
						<li  class="sort">
							<a>등록일순</a>
						</li>
						<li  class="sort">
							<a>리뷰 많은순</a>
						</li>
					</ul>
				</div>
				<div class="col-md-4">
					<select>
						<option>5개씩 보기
						<option>10개씩 보기
						<option>20개씩 보기
					</select>
				</div>
			</div>
			<div class="row" id="product-list" style="margin-top: 10px;">
				<c:if test="${plist.size() > 0 }">
				<c:forEach var="i" begin="0" step="1" end="${plist.size()-1 }">
				<div class="col-md-7 offset-2">
					<hr>
					<div class="row">
						<div class="col-md-2">
							<img alt="" src="product_img_upload/${plist[i].product_img }" style="height: 100px; width: 100px;">
						</div>
						<div class="col-md-6 offset-1">
							${plist[i].product_name }<br>
							${plist[i].product_description }
						</div>
						<div class="col-md-3">
						<c:forEach var="j" begin="0" step="1" end="${slist.size()-1 }">
							<c:if test="${plist[i].member_num eq slist[j].member_num }">
								<a href="store.bo?${slist[j].store_num }">
									<img alt="" src="upload_profile/${slist[j].profile_img }" style="height: 100px; width: 100px;">
								</a>
								${slist[j].store_name }<br>
								<c:forEach var="category" items="${clist }">
									<c:if test="${category.category_num eq slist[j].category_num}">
										${category.category_name }
									</c:if>
								</c:forEach>
							</c:if>
						</c:forEach>
						</div>
					</div>
				</div>
				</c:forEach>
				</c:if>
			</div>
			<div class="row">
				<div class="col-md-7 offset-2" style="height: 120px;" align="center">
					<hr>
					페이징
				</div>
			</div>
	</div>
</body>
</html>