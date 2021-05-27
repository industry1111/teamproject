package com.board.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


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
		String contextPath = request.getContextPath();
		String command = RequestURI.substring(contextPath.length());
		System.out.println(command);
		ActionForward forward = null;
		Action action = null;
		if(command.equals("/Order.bo")) {
			action = new OrderList();
			try {
				forward = action.execute(request, response);

			} catch (Exception e) {
				e.printStackTrace();
			}

		}else if(command.equals("/basket.bo")) {
			action = new BasketList();
			try {
				forward = action.execute(request, response);

			} catch (Exception e) {
				e.printStackTrace();
			}

		}else if(command.equals("/ProductListAction.bo")) //상품 리스트 페이지로 이동하는 서블릿 
		{ 
			System.out.println("ProductListAction.bo");

			action = new ProductListAction();
			try {
				forward = action.execute(request, response);

			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}else if(command.equals("/ProductAdd.bo")) { //상품 등록 페이지로 이동하는 서블릿
			action = new ProductAdd();
			try {
				forward = action.execute(request, response);

			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}else if(command.equals("/ProductAddAction.bo")) { //상품을 등록하는 서블릿 
			action = new ProductAddAction();

			System.out.println("controll: ProductAddAction.bo");
			try {
				forward = action.execute(request, response);

			} catch (Exception e) {
					e.printStackTrace();
			}	
		}else if(command.equals("/ProductModify.bo")) { //상품 수정 페이지로 이동하는 서블릿
			action = new ProductModify();
			try {
				forward = action.execute(request, response);

			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/ProductModifyAction.bo")) { //상품 수정 페이지로 이동하는 서블릿
			action = new ProductModify();
			try {
				forward = action.execute(request, response);

			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}else if(command.equals("/Productdelete.bo")) { //등록된 상품을 삭제하는 서블릿
			action = new ProductModify();
			try {
				
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
				
		}else if(command.equals("/receiver.bo")) {
			action = new ReceiverList();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/keepstore.bo")) {
			action = new KeepStoreList();
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

