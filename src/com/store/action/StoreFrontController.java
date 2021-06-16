package com.store.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;

public class StoreFrontController extends HttpServlet { //스토어 및 상품상세페이지로 이동 프론트컨트롤러입니다.

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

		if (command.equals("/StoreProductListAction.st")) // main에서 선택한 플로필 이미지을 통해 해당 스토어로 이동
		{

			action = new StoreProductListAction();
			try {
				forward = action.execute(request, response);

			} catch (Exception e) {
				e.printStackTrace();
			}

		} else if (command.equals("/StoreProductDetail.st")) { // main에서 선택한 상품 이미지를 통해 해당 상품 상세보기로 이동
			action = new StoreProductDetail();
			try {
				forward = action.execute(request, response);

			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/Report.st")) { // 신고하기로 이동
			action = new Report();
			try {
				forward = action.execute(request, response);

			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if (command.equals("/ReportAction.st")) { 
			action = new ReportAction();
			try {
				forward = action.execute(request, response);

			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if (command.equals("/ReportLogin.st")) { //신고하기 로그인
		    int product_num = Integer.parseInt(request.getParameter("product_num"));
		    forward = new ActionForward();
            forward.setRedirect(true);
            forward.setPath("./reportLogin.jsp?product_num="+product_num);
            
        }else if (command.equals("/ReportLoginAcion.st")) { //신고하기 로그인액션
            
         // 로그인 처리를 위한 Action객체 생성
            action = new ReportLoginAction();

            try {
                forward = action.execute(request, response);

            } catch (Exception e) {
                e.printStackTrace();
            } 
        }else if(command.equals("/BrandProductActon.st")){
            
            action = new BrandProductListAction();
            
            try {
                forward = action.execute(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }
            
        }
		
		
		if (forward != null) {
			if (forward.isRedirect()) {// true -> sendRedirect()

				response.sendRedirect(forward.getPath());

			} else {// forward()

				RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
		} // if

	}

}
