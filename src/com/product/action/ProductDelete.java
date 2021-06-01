package com.product.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;
import dao.boardDAO;


public class ProductDelete implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, 
			HttpServletResponse response) throws Exception {
		//상품 상세정보로 이동하는 서블릿
		//전달해오는  product_num 값 받기
		
		request.setCharacterEncoding("utf-8");
		
		int product_num = Integer.parseInt(request.getParameter("product_num"));
		System.out.println(product_num);
		/*데이터베이스 자바빈 작업*/
		productDAO pdao = new productDAO();
		pdao.deleteProduct(product_num);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("ProductListAction.pr");
		return forward;
	}
	

}
