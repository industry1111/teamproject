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
			request.setAttribute("center","main.jsp");
			
		}else if(command.equals("/MyPage.bo")) {

			forward=new ActionForward();
			forward.setRedirect(false);
			forward.setPath("mypage.jsp");
			request.setAttribute("center","MemberUpdate.jsp");
		}else if(command.equals("/basket.bo")) {
			forward=new ActionForward();
			forward.setRedirect(false);
			forward.setPath("mypage.jsp");
			request.setAttribute("center","basket.jsp");
		}else if(command.equals("/memberupdate.bo")) {
			forward=new ActionForward();
			forward.setRedirect(false);
			forward.setPath("mypage.jsp");
			request.setAttribute("center","MemberUpdate.jsp");
			
		}else if(command.equals("/ProductList.bo")) { // 상품 등록페이지 이동
			forward=new ActionForward();
			forward.setRedirect(false);
			forward.setPath("mypage.jsp");
			request.setAttribute("center","productUpdateDelete.jsp");
		}else if(command.equals("/ProductAdd.bo")) { //상품 등록 페이지 이동
				forward=new ActionForward();
				forward.setRedirect(false);
				forward.setPath("mypage.jsp");
				request.setAttribute("center","ProductAdd.jsp");

		}else if(command.equals("/ProductModify.bo")) { //상품 수정 페이지 이동
			forward=new ActionForward();
			forward.setRedirect(false);
			forward.setPath("mypage.jsp");
			request.setAttribute("center","ProductModify.jsp");
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
