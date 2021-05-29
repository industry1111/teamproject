package com.board.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.sellerDAO;


@WebServlet("/StoreInfoUpdateCheck")
public class StoreInfoUpdateCheck extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doStInfoUpdate(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doStInfoUpdate(request, response);
	}

	protected void doStInfoUpdate(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		String command = request.getParameter("command");
		
		sellerDAO sdao = new sellerDAO();
		System.out.println("check2");
		int result= 0;
		if(command.equals("new_store_name")){
			System.out.println("check");
			String store_name = request.getParameter("store_name");
			result = sdao.store_name_check(store_name);
			if(result==1){
				out.print("1");
			}else{
				out.print("0");
			}
		
		}
	}
}
