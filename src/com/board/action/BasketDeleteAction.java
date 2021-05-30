package com.board.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.boardDAO;


@WebServlet("/BasketDeleteAction")
public class BasketDeleteAction extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		dohandle(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		dohandle(request, response);
	}
	protected void dohandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	    System.out.println("dd");
		request.setCharacterEncoding("utf-8");
	
		int product_num = Integer.parseInt(request.getParameter("product_num"));
	    
	    new boardDAO().deleteBasket(product_num);
	    
	}

}
