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
		HttpSession session = request.getSession();
		
		int member_num =0;
		if((String) session.getAttribute("id") != null){
			member_num = (int) session.getAttribute("member_num");
		}
		int store_num = Integer.parseInt(request.getParameter("store_num"));
		String command = request.getParameter("command");
		
		Store_likeDTO dto = new Store_likeDTO();
		sellerDAO dao = new sellerDAO();
		
		dto.setMember_num(member_num);
		dto.setStore_num(store_num);
		
		if(command.equals("check")){
			
			System.out.println("check123");
			dao.insertStore_like(member_num, store_num);
			dao.StorejjimCountUp(store_num);
			
		}else if(command.equals("delete")){
			
			System.out.println("delete");
			dao.deleteStore_like(member_num, store_num);
			dao.StorejjimCountDown(store_num);
		}

	}

	
}
