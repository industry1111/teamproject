package com.member.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.sellerDAO;

@WebServlet("/StoreInfoUpdateAction")
public class StoreInfoUpdateAction extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	doStoreUpdate(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	doStoreUpdate(request, response);
    }
    
    protected void doStoreUpdate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		String command = request.getParameter("command");
		HttpSession session = request.getSession();
	 
		int member_num = (int)session.getAttribute("member_num");
		
		sellerDAO sdao = new sellerDAO();
				
		if(command.equals("new_store_name")){
			
			String store_name = request.getParameter("store_name");
			sdao.updateStore_name(store_name, member_num);
		
		}else if(command.equals("new_store_c_num")){
			
			int store_c_num = (Integer.parseInt(request.getParameter("store_c_num")));
			sdao.updateStore_c_num(store_c_num, member_num);
			
		}else if(command.equals("new_profile_img")){
			
			String profile_img = request.getParameter("profile_img");
			sdao.updateProfile_img(profile_img, member_num);
			
		}else if(command.equals("new_template")){
			
			String template = request.getParameter("template");
			sdao.updateTemplate(template, member_num);
			
		}else if(command.equals("new_account")){
			
			String account = request.getParameter("account");
			sdao.updateAccount(account, member_num);
	
    	}
	
	}
}

