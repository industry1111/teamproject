package com.order.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import action.ActionForward;
import dao.sellerDAO;
import dto.sellerDTO;

public class OrderDetail implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		int member_num = (int) session.getAttribute("member_num");
		
		String orders_code = request.getParameter("orders_code");
		
		OrderDAO odao = new OrderDAO();
		List<OrderDTO> mlist = odao.getOrder(orders_code);
		List<OrderDetailDTO> list = odao.getOrderDetail(orders_code);
		sellerDAO sdao = new sellerDAO();
		List<sellerDTO> slist = sdao.getSellerInfo();
		
		
		request.setAttribute("list", list);
		request.setAttribute("mlist", mlist);
		request.setAttribute("slist", slist);
		 ActionForward forward=new ActionForward();
         forward.setRedirect(false);
         
         forward.setPath("mypage.jsp"); 
         request.setAttribute("center", "StoreOrder.jsp");
         
         return forward;
	}

}
