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
		
		int product_num = Integer.parseInt(request.getParameter("product_num"));
		int order_detail_num = Integer.parseInt(request.getParameter("order_detail_num"));
		int store_num = Integer.parseInt(request.getParameter("store_num"));
		productDAO pdao = new productDAO();
		productDTO pdto = pdao.getProductInfo(product_num);
		
		request.setAttribute("order_detail_num", order_detail_num);
		request.setAttribute("pdto", pdto);
		request.setAttribute("store_num", store_num);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("reviewForm.jsp");

		return forward;

	}
}
