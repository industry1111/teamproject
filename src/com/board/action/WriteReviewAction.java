package com.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.product.action.productDAO;
import com.product.action.productDTO;

import action.Action;
import action.ActionForward;

public class WriteReviewAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 리뷰리스트 있는 페이지에서 리뷰쓰기버튼을 클릭했을때 실행

		request.setCharacterEncoding("utf-8");
		String orders_code = request.getParameter("orders_code");
				
		int product_num = Integer.parseInt(request.getParameter("product_num"));
		productDAO pdao = new productDAO();
		productDTO pdto = pdao.getProductInfo(product_num);
		
	
		request.setAttribute("orders_code", orders_code);
		request.setAttribute("pdto", pdto);

		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("reviewForm.jsp");

		return forward;

	}
}
