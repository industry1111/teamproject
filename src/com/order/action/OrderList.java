package com.order.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import action.ActionForward;

public class OrderList implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		int member_num = (int)session.getAttribute("member_num");
		
		OrderDAO odao = new OrderDAO();
		OrderDTO odto = new OrderDTO();
		List<OrderDTO> list = odao.getOrderInfo(member_num);
	
		request.setAttribute("list", list);
		request.setAttribute("center", "order.jsp");
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("mypage.jsp");
		
		return forward;
	}
	

}
