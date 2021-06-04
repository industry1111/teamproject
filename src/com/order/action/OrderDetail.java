package com.order.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;

public class OrderDetail implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("OrderDetail");

		request.setCharacterEncoding("UTF-8");
		
		
		String orders_code = request.getParameter("orders_code");
		System.out.println("orders_code :"+ orders_code);
		OrderDAO odao = new OrderDAO();
		
		List<OrderDetailDTO> list = odao.getOrderDetail(orders_code);
		
		request.setAttribute("list", list);
		
		 ActionForward forward=new ActionForward();
         forward.setRedirect(false);
         
         forward.setPath("mypage.jsp"); 
         request.setAttribute("center", "orderDetail.jsp");
         
         return forward;
	}

}
