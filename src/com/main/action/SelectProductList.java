package com.main.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.boardDAO;
import dto.categoryDTO;


@WebServlet("/SelectList.do")
public class SelectProductList extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		int category_code1 = Integer.parseInt(request.getParameter("category_code1"));
		int category_code2 = Integer.parseInt(request.getParameter("category_code2"));
		int category_code3 = Integer.parseInt(request.getParameter("category_code3"));
		String brand = request.getParameter("brand");
		int price1 = Integer.parseInt(request.getParameter("price1"));
		int price2 = Integer.parseInt(request.getParameter("price2"));
		
		boardDAO bdao = new boardDAO();
		List<categoryDTO> list = bdao.getcategory(category_code1);
	}
}
