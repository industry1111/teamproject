package com.order.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/OrderStateUpdate")
public class OrderStateUpdateAction extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}
	
	protected void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		int order_detail_num =  Integer.parseInt(request.getParameter("order_detail_num"));
		String state = request.getParameter("state");
		int product_num = Integer.parseInt(request.getParameter("product_num"));
		int quantity = Integer.parseInt(request.getParameter("quantity"));
		
		OrderDAO dao = new OrderDAO();
		dao.OrderStateUpdate(state, order_detail_num);
		
		if(state.equals("1")){
			
			dao.updateProductCount(quantity, product_num);
			
		}

		
	}

	
}
