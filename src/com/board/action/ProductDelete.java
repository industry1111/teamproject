package com.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.boardDAO;


public class ProductDelete implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, 
			HttpServletResponse response) throws Exception {
		//상품 상세정보로 이동하는 서블릿
		//전달해오는  product_num 값 받기
		
		int product_num = Integer.parseInt(request.getParameter("product_num"));
		
		/*데이터베이스 자바빈 작업*/
		boardDAO bdao = new boardDAO();// 데이터 베이스 객체 생성
		bdao.deleteProduct(product_num);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("ProductListAction.bo");
		return forward;
	}
	

}
