<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<!-- Theme style  -->
<link rel="stylesheet" href="css/style.css?ver=1">
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
.wrap{
	font-size: 12px;
}


.category{
	background-color: #22CC88; 
	color: white;
}
ul {
    list-style:none;
    padding:0;
}

.list{
 	border: 1px solid #f3f3f3; 
 	
}

.myButton {
	box-shadow: inset 0px 1px 0px 0px #ffffff;
	background: linear-gradient(to bottom, #ffffff 5%, #f6f6f6 100%);
	background-color: #ffffff;
	border-radius: 6px;
	border: 1px solid #dcdcdc;
	display: inline-block;
	cursor: pointer;
	color: #666666;
	font-family: Arial;
	font-size: 15px;
	font-weight: bold;
	padding: 6px 24px;
	text-decoration: none;
	text-shadow: 0px 1px 0px #ffffff;
	
}

.myButton:hover {
	background: linear-gradient(to bottom, #f6f6f6 5%, #ffffff 100%);
	background-color: #f6f6f6;
}

.myButton:active {
	position: relative;
	top: 1px;
}

#pname{
	font-weight: bolder;
}
.search{
	border-radius:20px; 
	border: 3px solid #22CC88; 
	width:400px;
	height:40px;
}
.search:focus{
	border-radius:20px; 
	border: 3px solid #22CC88; 
	width:400px;
	height:40px;
	outline: none;
}
.price, .category1, .category2, .category3, .sort, .mbtn, .dbtn{
	margin-left:30px;
    float: left; 
    margin-top: 10px;
}
.ui-menu-item{
	color: black;
	margin-top: 2px;
}
.ui-widget{
	background-color: white;
	border: 1px solid green;
	width: 400px; 
}
</style>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
	var contextPath = "${pageContext.request.contextPath}";
</script>
<script src="js/main2.js"></script>
<script type="text/javascript">
	function jjim_click() {
		
		if(confirm("로그인이 필요한 서비스 입니다. 로그인 하시겠어요?")){
			location.href="MemberLogin.me";
		}
			
	}

</script>
</head>

<body>


		<div class="row" style="margin-left:130px;" >
			<div class="col-md-2 offset-1"  align="right" >
				<a href="Main.main"> <img
					src="images/modooLogo.png"
					alt="Logo" style="height: 40px">
				</a>
			</div>
			<div class="col-md-6">
				<input type="text" id="searchBox" class="search">
				<img src="images/magnifying-glass.png" alt="shopping" style="height: 23px">
			</div>
		</div>
		<div class="wrap" style="margin-left: 100px;">
			<div class="row" style="margin-top: 40px;">
				<div class="col-md-1 offset-2 category" align="left" >카테고리</div>
				<div class="col-md-6 list">
					<ul >
						<c:forEach var="i" begin="0" step="1" end="${clist.size()-1}"> <%-- -1제거하고 실행 --%>
							<c:if test="${clist[i].category_codeRef1 eq 0 && clist[i].category_codeRef2 eq 0}">
								<li class="category1" value="${clist[i].category_code }">${clist[i].category_name }</li>
							</c:if>
						</c:forEach>
					</ul>
				</div>
			</div>
			<div class="row">
				<div  class="col-md-1 offset-2 category" align="left">중분류</div>
				<div class="col-md-6 list">
					<ul id="category2">
						<c:forEach var="i" begin="0" step="1" end="${clist.size()-1}">
							<c:if test="${clist[i].category_codeRef1 ne  0 && clist[i].category_codeRef2 eq 0 }">
								<c:set var="j" value="${j+1 }" />
								<c:if test="${j <= 10 }">
									<li class='category2' value="${ clist[i].category_code}">${ clist[i].category_name}</li>
								</c:if>
								<c:if test="${j > 10 }">
									<li class='category2 hide' hidden value="${ clist[i].category_code}">${ clist[i].category_name}</li>
								</c:if>
							</c:if>
						</c:forEach>
						<li class="mbtn">
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-down" viewBox="0 0 16 16">
							  <path d="M3.204 5h9.592L8 10.481 3.204 5zm-.753.659 4.796 5.48a1 1 0 0 0 1.506 0l4.796-5.48c.566-.647.106-1.659-.753-1.659H3.204a1 1 0 0 0-.753 1.659z"/>
							</svg>
						</li>
						<li class="dbtn" hidden>
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-up" viewBox="0 0 16 16">
							  <path d="M3.204 11h9.592L8 5.519 3.204 11zm-.753-.659 4.796-5.48a1 1 0 0 1 1.506 0l4.796 5.48c.566.647.106 1.659-.753 1.659H3.204a1 1 0 0 1-.753-1.659z"/>
							</svg>
						</li>
					</ul>
				</div>
			</div>
			<c:set var="j" value="0" />
			<div class="row">
				<div class="col-md-1 offset-2 category" align="left" >소분류</div>
					<div class="col-md-6 list">
						<ul id="category3">
							<c:forEach var="i" begin="0" step="1" end="${clist.size()-1}">
								<c:if test="${clist[i].category_codeRef1 ne 0 && clist[i].category_codeRef2 ne 0 }">
								<c:set var="j" value="${j+1 }" />
									<c:if test="${j <= 10 }">
										<li class='category3' value="${ clist[i].category_code}">${ clist[i].category_name}</li>
									</c:if>
									<c:if test="${j > 10 }">
										<li class='category3 hide' hidden value="${ clist[i].category_code}">${ clist[i].category_name}</li>
									</c:if>
								</c:if>
							</c:forEach>
							<li class="mbtn">
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-down" viewBox="0 0 16 16">
								  <path d="M3.204 5h9.592L8 10.481 3.204 5zm-.753.659 4.796 5.48a1 1 0 0 0 1.506 0l4.796-5.48c.566-.647.106-1.659-.753-1.659H3.204a1 1 0 0 0-.753 1.659z"/>
								</svg>
							</li>
							<li class="dbtn" hidden>
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-up" viewBox="0 0 16 16">
								  <path d="M3.204 11h9.592L8 5.519 3.204 11zm-.753-.659 4.796-5.48a1 1 0 0 1 1.506 0l4.796 5.48c.566.647.106 1.659-.753 1.659H3.204a1 1 0 0 1-.753-1.659z"/>
								</svg>
							</li>
						</ul>
				</div>
			</div>
			<div class="row" >
				<div class="col-md-1 offset-2 category" align="left"  >가격</div>
				<div class="col-md-6 list">
					<ul>
						<li class="price" value="1">1만원이하</li>
						<li class="price" value="2" >1만원~5만원</li>
						<li class="price" value="3" >5만원~10만원</li>
						<li style="float: left; margin-left:30px; margin-top: 10px;">직접입력 &nbsp;
							<input type="text"  id="price1"  placeholder="원" style="height: 20px;text-align: right;" >~
							<input  type="text" id="price2" placeholder="원"  style="height: 20px;text-align: right;">
						</li>
						<li><img class="price"  value="4" src="images/magnifying-glass.png" alt="shopping" style="height: 15px"></li>
					</ul>
				</div>
			</div>
			<div class="row" style="margin-top: 60px">
				<div class="col-md-6 offset-2">
					<ul >
						<li  class="sort" value="0">
							<a>랭킹순</a>
						</li>
						<li  class="sort" value="1">
							<a>낮은 가격순</a>
						</li>
						<li  class="sort" value="2">
							<a>높은 가격순</a>
						</li>
						<li  class="sort" value="3">
							<a>등록일순</a>
						</li>
						<li  class="sort" value="4">
							<a>리뷰 많은순</a>
						</li>
					</ul>
				</div>
				<div class="col-md-4">
					<select name="numPerPage" id="numPerPage"style="color:grey;">
						<option value="5">5개씩 보기
						<option value="10" selected>10개씩 보기
						<option value="20">20개씩 보기
					</select>
				</div>
			</div>
			<div class="row" id="product-list" style="margin-top: 10px;">
				<c:set var="loop" value="true"/>
				<c:if test="${plist.size() > 0 }">
				<c:forEach var="i" begin="${p.beginPerPage }" step="1" end="${p.endPerPage}">
					<c:if test="${p.total == i }">
						<c:set var="loop" value="false"/>
					</c:if>
					<c:if test="${loop }">
					<div class="col-md-7 offset-2" >
					<hr>
					<div class="row">
						<div class="col-md-2"  >
							<a href="StoreProductDetail.st?product_num=${plist[i].product_num }">
								<img alt="" src="product_img_upload/${plist[i].product_img }" style="height: 150px; width: 150px;">
							</a>	
						</div>
						<div class="col-md-7 " id="pname" >
							<b>${plist[i].product_name }</b><br>
							<b>${plist[i].product_description }</b><br><br>
							
						<c:forEach var="j" begin="0" step="1" end="${clist.size()-1 }">
							<c:if test="${plist[i].category_coderef1 eq clist[j].category_code}">
									${clist[j].category_name } >
							</c:if>
						</c:forEach>
						<c:forEach var="j" begin="0" step="1" end="${clist.size()-1 }">
							<c:if test="${plist[i].category_coderef2 eq clist[j].category_code}">
									${clist[j].category_name } >
							</c:if>
						</c:forEach>
						<c:forEach var="j" begin="0" step="1" end="${clist.size()-1 }">
							<c:if test="${plist[i].category_code1 eq clist[j].category_code}">
									${clist[j].category_name } 
							</c:if>
						</c:forEach>
						<br>
							<p style="color:red;">${plist[i].product_price}원</p>
	
							등록일&nbsp;<fmt:formatDate pattern="yyyy-MM-dd" value="${plist[i].regdate}" /> &nbsp;
							<c:choose>
								<c:when test="${member_num eq 0 }">
									<a style="color: black;" onclick="jjim_click();">
										<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-suit-heart" viewBox="0 0 16 16">
			  								<path d="m8 6.236-.894-1.789c-.222-.443-.607-1.08-1.152-1.595C5.418 2.345 4.776 2 4 2 2.324 2 1 3.326 1 4.92c0 1.211.554 2.066 1.868 3.37.337.334.721.695 1.146 1.093C5.122 10.423 6.5 11.717 8 13.447c1.5-1.73 2.878-3.024 3.986-4.064.425-.398.81-.76 1.146-1.093C14.446 6.986 15 6.131 15 4.92 15 3.326 13.676 2 12 2c-.777 0-1.418.345-1.954.852-.545.515-.93 1.152-1.152 1.595L8 6.236zm.392 8.292a.513.513 0 0 1-.784 0c-1.601-1.902-3.05-3.262-4.243-4.381C1.3 8.208 0 6.989 0 4.92 0 2.755 1.79 1 4 1c1.6 0 2.719 1.05 3.404 2.008.26.365.458.716.596.992a7.55 7.55 0 0 1 .596-.992C9.281 2.049 10.4 1 12 1c2.21 0 4 1.755 4 3.92 0 2.069-1.3 3.288-3.365 5.227-1.193 1.12-2.642 2.48-4.243 4.38z"/>
										</svg>찜&nbsp;·
									</a>
								</c:when>
								<c:otherwise>
									<c:if test="${jlist.size() > 0 }">
											<c:forEach var="k" begin="0" step="1" end="${jlist.size()-1 }">
												<c:if test="${slist[i].store_num eq jlist[k].store_num }">
													<c:set var="store_num" value="${jlist[k].store_num}"/>	
												</c:if>
											</c:forEach>	
									</c:if>
									
									<c:set var="loop2" value="true"/>
									<c:if test="${loop2}">
										<c:if test="${slist[i].store_num eq store_num}">
											<a id="jjim"  class="jjim check" value="${slist[i].store_num}" style="color: red;"> 
												<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-suit-heart" viewBox="0 0 16 16">
									  				<path d="m8 6.236-.894-1.789c-.222-.443-.607-1.08-1.152-1.595C5.418 2.345 4.776 2 4 2 2.324 2 1 3.326 1 4.92c0 1.211.554 2.066 1.868 3.37.337.334.721.695 1.146 1.093C5.122 10.423 6.5 11.717 8 13.447c1.5-1.73 2.878-3.024 3.986-4.064.425-.398.81-.76 1.146-1.093C14.446 6.986 15 6.131 15 4.92 15 3.326 13.676 2 12 2c-.777 0-1.418.345-1.954.852-.545.515-.93 1.152-1.152 1.595L8 6.236zm.392 8.292a.513.513 0 0 1-.784 0c-1.601-1.902-3.05-3.262-4.243-4.381C1.3 8.208 0 6.989 0 4.92 0 2.755 1.79 1 4 1c1.6 0 2.719 1.05 3.404 2.008.26.365.458.716.596.992a7.55 7.55 0 0 1 .596-.992C9.281 2.049 10.4 1 12 1c2.21 0 4 1.755 4 3.92 0 2.069-1.3 3.288-3.365 5.227-1.193 1.12-2.642 2.48-4.243 4.38z"/>
												</svg>찜&nbsp;·
											</a>
										</c:if>
										<c:if test="${slist[i].store_num ne store_num}">
											<a id="jjim"  class="jjim" value="${slist[i].store_num}" style="color:black;">
													<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-suit-heart" viewBox="0 0 16 16">
									  					<path d="m8 6.236-.894-1.789c-.222-.443-.607-1.08-1.152-1.595C5.418 2.345 4.776 2 4 2 2.324 2 1 3.326 1 4.92c0 1.211.554 2.066 1.868 3.37.337.334.721.695 1.146 1.093C5.122 10.423 6.5 11.717 8 13.447c1.5-1.73 2.878-3.024 3.986-4.064.425-.398.81-.76 1.146-1.093C14.446 6.986 15 6.131 15 4.92 15 3.326 13.676 2 12 2c-.777 0-1.418.345-1.954.852-.545.515-.93 1.152-1.152 1.595L8 6.236zm.392 8.292a.513.513 0 0 1-.784 0c-1.601-1.902-3.05-3.262-4.243-4.381C1.3 8.208 0 6.989 0 4.92 0 2.755 1.79 1 4 1c1.6 0 2.719 1.05 3.404 2.008.26.365.458.716.596.992a7.55 7.55 0 0 1 .596-.992C9.281 2.049 10.4 1 12 1c2.21 0 4 1.755 4 3.92 0 2.069-1.3 3.288-3.365 5.227-1.193 1.12-2.642 2.48-4.243 4.38z"/>
													</svg>찜&nbsp;·
											</a>
											<c:set var="loop2" value="false"/>	 
										</c:if>
									</c:if>
								</c:otherwise>
							</c:choose>
							<a id="report" >	
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-emoji-angry" viewBox="0 0 16 16">
  								<path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
 								 <path d="M4.285 12.433a.5.5 0 0 0 .683-.183A3.498 3.498 0 0 1 8 10.5c1.295 0 2.426.703 3.032 1.75a.5.5 0 0 0 .866-.5A4.498 4.498 0 0 0 8 9.5a4.5 4.5 0 0 0-3.898 2.25.5.5 0 0 0 .183.683zm6.991-8.38a.5.5 0 1 1 .448.894l-1.009.504c.176.27.285.64.285 1.049 0 .828-.448 1.5-1 1.5s-1-.672-1-1.5c0-.247.04-.48.11-.686a.502.502 0 0 1 .166-.761l2-1zm-6.552 0a.5.5 0 0 0-.448.894l1.009.504A1.94 1.94 0 0 0 5 6.5C5 7.328 5.448 8 6 8s1-.672 1-1.5c0-.247-.04-.48-.11-.686a.502.502 0 0 0-.166-.761l-2-1z"/>
							</svg>신고하기
							</a>
						</div>
						<div class="col-md-2"> <%--스토어 페이지로 이동 --%>
						<c:forEach var="j" begin="0" step="1" end="${slist.size()-1 }">
							<c:if test="${plist[i].member_num eq slist[j].member_num }">
								<a href="StoreProductListAction.st?store_num=${slist[j].store_num}">
									<img src="upload_profile/${slist[j].profile_img }" style="height: 70px; width: 70px;">
								</a><br> 
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
				</c:if>
				</c:forEach>
				</c:if>
			</div>
			<div class="row" >
				<div class="col-md-7 offset-2">
						<hr>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6 offset-4 paging" style="height: 120px;">
 					<ul class="pagination">
       					<c:if test="${p.prev }">
           					 <li class="page-item previous">
              					  <a class="page-link" onclick="paging(${p.startPage-1 });">Previous</a>
           					 </li>
        				</c:if>
				        <c:forEach var="num" begin="${p.startPage }" step="1" end="${p.endPage }">
				            <li class="page-item">
				            	 <a class="page-link" ${p.cri.nowPage == num ? 'style="color:red;border-color:black"':''} onclick="paging(${num});" >${num }</a>
				            </li>
				        </c:forEach>
				        <c:if test="${p.next }">
				            <li class="page-item next">
				               <a class="page-link" onclick="paging(${p.endPage + 1 });">Next</a>
				            </li>
				        </c:if>
   					 </ul>
				</div>
			</div>
		</div>
		<input type="hidden" value="${member_num}" id="member_num">
</body>
</html>