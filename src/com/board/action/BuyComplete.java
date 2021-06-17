package com.board.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.order.action.OrderDAO;
import com.order.action.OrderDTO;

@WebServlet("BuyComplete.do")
public class BuyComplete extends HttpServlet{
	
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
		
		HttpSession session = request.getSession();
		
		int member_num = (int) request.getAttribute("member_num");
		
		int store_num = Integer.parseInt(request.getParameter("store_num"));
		int price = Integer.parseInt(request.getParameter("price"));
		int order_detail_num = Integer.parseInt(request.getParameter("order_detail_num"));
		
		OrderDTO odto = new OrderDTO();
		OrderDAO odao = new OrderDAO();
		
		odao.OrderStateUpdate("6", order_detail_num); //구매확정으로 state변경
		
		//원래 페이지로 이동
		response.sendRedirect("OrderContent.or");
		
	}
	
	
}
