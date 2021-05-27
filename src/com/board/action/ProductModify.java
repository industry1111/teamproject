package com.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.boardDAO;
import db.productDTO;

public class ProductModify implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, 
			HttpServletResponse response) throws Exception {
		//상품 상세정보로 이동하는 서블릿
		//전달해오는  product_num 값 받기
		int product_num = Integer.parseInt(request.getParameter("product_num"));
	
		/*데이터베이스 자바빈 작업*/
		boardDAO bdao = new boardDAO();

		productDTO pdto = bdao.getProductInfo(product_num);	

		
		request.setAttribute("pdto", pdto);
		request.setAttribute("center", "ProductModify.jsp"); 
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("mypage.jsp");
		return forward;
	}
	

}
