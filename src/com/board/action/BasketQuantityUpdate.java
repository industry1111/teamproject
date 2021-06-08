package com.board.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.boardDAO;

@WebServlet("/BasketQuantityUpdate")
public class BasketQuantityUpdate extends HttpServlet{
	
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
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		String command = request.getParameter("command");
		boardDAO bdao = new boardDAO();
		
		if (command.equals("plus")) {
			
			int basket_num = Integer.parseInt(request.getParameter("basket_num"));
			int quantity = Integer.parseInt(request.getParameter("new_quantity"));
			bdao.basketQuantityUpdate(basket_num, quantity);	
			
		}else if (command.equals("minus")) {
			
			int basket_num = Integer.parseInt(request.getParameter("basket_num"));
			int quantity = Integer.parseInt(request.getParameter("new_quantity"));
			bdao.basketQuantityUpdate(basket_num, quantity);	
		}
		
	}
	

}
