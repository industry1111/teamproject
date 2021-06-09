package com.store.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.sellerDAO;

@WebServlet("/StoreLike.do")
public class StoreLikeAction extends HttpServlet{

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
		System.out.println("storeLike");
		HttpSession session = request.getSession();
		
		int member_num = (int) session.getAttribute("member_num");
		int store_num = Integer.parseInt(request.getParameter("store_num"));
		
		Store_likeDTO dto = new Store_likeDTO();
		
		dto.setMember_num(member_num);
		dto.setStore_num(store_num);

		new sellerDAO().insertStore_like(member_num, store_num);

	}

	
}
