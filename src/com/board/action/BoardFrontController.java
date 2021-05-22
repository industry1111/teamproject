package com.board.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.member.action.ActionForward;


public class BoardFrontController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String RequestURI = request.getRequestURI();
		System.out.println(RequestURI);
		String contextPath = request.getContextPath();
		System.out.println(contextPath.length());
		String command = RequestURI.substring(contextPath.length());
		System.out.println(command);
		ActionForward forward = null;

		boolean a = false;
		if(command.equals("/index.bo")) {
			
			forward=new ActionForward();
			
			forward.setRedirect(false);
			forward.setPath("index.jsp");
			
		}else if(command.equals("/store.bo")) {

			forward=new ActionForward();
			
			forward.setRedirect(false);
			forward.setPath("index.jsp");
		}else if(command.equals("/seller.bo")) {
			forward=new ActionForward();
			
			forward.setRedirect(false);
			forward.setPath("seller/seller.jsp");
		}else if(command.equals("/basket.bo")) {
			forward=new ActionForward();
			forward.setRedirect(false);
			forward.setPath("basket.jsp");
		}
		
		if(forward!=null){ 
			if(forward.isRedirect()){//true -> sendRedirect() 방식

				response.sendRedirect(forward.getPath());
				
			}else{//forward() 방식
				
				RequestDispatcher dispatcher=request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
		}//if 
	}
}
