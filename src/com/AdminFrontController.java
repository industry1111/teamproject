package com.admin.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.action.Order;
import com.member.action.StoreInfo;
import com.product.action.ProductListAction;

import action.Action;
import action.ActionForward;

public class AdminFrontController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doProcess(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doProcess(request, response);
	}

	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	
		request.setCharacterEncoding("utf-8");
		
		String RequestURI = request.getRequestURI();
		
		String contextPath = request.getContextPath();
		String command = RequestURI.substring(contextPath.length());
		System.out.println(command);
		
		ActionForward forward = null;
		Action action = null;
		
		if(command.equals("/AdminMain.ad")) { //관리자메인페이지로 이동하는 서블릿
			
			action = new AdminMain(); 
			try {
				forward = action.execute(request, response);

			} catch (Exception e) {
				e.printStackTrace();
		}	
		
	  }else if (command.equals("/AdminMember.ad")){ //회원관리페이지로 이동하는 서블릿 
		  	  
			action = new AdminMember(); 
			try {
				forward = action.execute(request, response);
	
			} catch (Exception e) {
				e.printStackTrace();
			}	
			
//	  }else if (command.equals("/AdminMemberEdit.ad")){ //회원수정요청시 
//
//			action = new AdminMemberEdit(); 
//			try {
//				forward = action.execute(request, response);
//	
//			} catch (Exception e) {
//				e.printStackTrace();
//			}	
			
		}else if (command.equals("/AdminStore.ad")){ //스토어관리페이지로 이동하는 서블릿 
		  action = new AdminStore(); 
		  try {
			  forward = action.execute(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
		 
	  }else if (command.equals("/AdminService.ad")){//문의함페이지로 이동하는 서블릿 
		  System.out.println("1");
		  action = new AdminService(); 
		  try {
			  forward = action.execute(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
		  
	  }

		if(forward!=null){ 
			if(forward.isRedirect()){//true -> sendRedirect()

				response.sendRedirect(forward.getPath());
				
			}else{//forward() 
				
				RequestDispatcher dispatcher=request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
		}//if 
	}	
}

