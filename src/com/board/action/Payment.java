package com.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import action.ActionForward;

public class Payment implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		
		String product_name = request.getParameter("product_name");
		String email = request.getParameter("email");
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		int price_total = Integer.parseInt(request.getParameter("price_total"));
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("payment.jsp");
		
		
		return null;
	}

}
