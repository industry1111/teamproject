package com.board.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.member.action.memberDAO;
import com.member.action.memberDTO;
import com.order.action.OrderDAO;
import com.order.action.OrderDTO;

import dao.boardDAO;

@WebServlet("/BuyComplete.do")
public class BuyComplete extends HttpServlet {

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
		
		int member_num = (int) session.getAttribute("member_num");
		String id = (String) session.getAttribute("id");
		
		int store_num = Integer.parseInt(request.getParameter("store_num"));
		int price = Integer.parseInt(request.getParameter("price"));
		int order_detail_num = Integer.parseInt(request.getParameter("order_detail_num"));
		
		OrderDTO odto = new OrderDTO();
		OrderDAO odao = new OrderDAO();
		boardDAO bdao = new boardDAO();
		bdao.insertBuyComplete(member_num, store_num, price);
		bdao.upgradeMemberState(member_num, store_num);
		odao.OrderStateUpdate("6", order_detail_num); //구매확정으로 state변경
		
		memberDAO mdao = new memberDAO();
	    memberDTO mdto = mdao.getMemberInfo(id);
	    session.setAttribute("member_code", mdto.getMember_code());
		
		
		String orders_code = request.getParameter("orders_code");
		
		//원래 페이지로 이동
		response.sendRedirect("OrderDetail.or?orders_code="+orders_code);
		
	}
	
	
}
