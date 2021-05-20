package net.member.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemberFrontController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String RequestURI = request.getRequestURI();
		
		
		String contextPath = request.getContextPath();
		
		String command = RequestURI.substring(contextPath.length());
		
		//페이지 재요청 방식 여부값(true또는 false)과
		//이동할 페이지 경로 주소값을  저장하여 제공해주는 객체를 저장할 참조변수 선언
		ActionForward forward = null;
		
		//Action인터페이스를 구현한 자식객체를 저장하기 위한 참조변수 선언
		Action action = null;
		if(command.equals("/member/SignUpAction.me")){
			action = new SignUpAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}	
		}else if(command.equals("/store.me")) {
			action = new StoreGetInfoAction();
		}
		
		if(forward!=null){ 
			if(forward.isRedirect()){//true -> sendRedirect() 방식일떄..
				response.sendRedirect(forward.getPath());
				
			}else{//false -> forward() 방식일때...
				
				RequestDispatcher dispatcher=request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
		}
		
	}//	doProcess 메소드 끝
	
}
