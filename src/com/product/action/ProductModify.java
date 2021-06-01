package com.product.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;
import dao.boardDAO;

public class ProductModify implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		
		int product_num = Integer.parseInt(request.getParameter("product_num"));
	
		/*데이터베이스 자바빈 작업*/
		productDAO pdao = new productDAO();
		productDTO pdto = pdao.getProductInfo(product_num);	

		
		request.setAttribute("pdto", pdto);
		request.setAttribute("center", "ProductModify.jsp"); 
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("mypage.jsp");
		return forward;
	}
	

}
