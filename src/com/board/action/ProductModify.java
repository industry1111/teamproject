package com.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.boardDAO;
import db.productDTO;

public class ProductModify implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//상품 상세정보로 이동하는 서블릿
		
		/*클라이언트의 요청값 전달받기*/
		//CarReserveResult.jsp페이지에서 렌트예약한 하나의 차량에 대하여.. 수정하기 버튼을 누르면..
		//전달해오는  product_num 값 받기
		int product_num = Integer.parseInt(request.getParameter("product_num"));
	
		/*데이터베이스 자바빈 작업*/
		boardDAO bdao = new boardDAO();
		//렌트예약한 id를 전달하여..하나의 주문정보를 얻어오는 메소드를 호출
		productDTO pdto = bdao.getProductInfo(product_num);	
		//차량이름에 빈클래스에 추가

		/*request영역에 담기*/
		//차량 주문 정보 수정 페이지로 전달 해야함 
		//대여기간,대여일,차량수량, 보험적용,무선wifi,베이비시트, 비밀번호등을 저장하고 있는..
		//CarConfirmBean객체를 request영역에 담기 
		
		request.setAttribute("pdto", pdto);
		request.setAttribute("center", "ProductModify.jsp"); 
		System.out.println("ProductModify으로 이동");
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("mypage.jsp");
		return forward;
	}
	

}
