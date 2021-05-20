package net.member.action;

import java.io.IOException;
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
		
		System.out.println(RequestURI);
		
		String contextPath = request.getContextPath();
		// /CarProject <--컨텍스트 주소 문자열의 문자개수 얻기
		System.out.println( contextPath.length() ); //11
		
		String command = RequestURI.substring(contextPath.length());
		System.out.println(command);
		
		//페이지 재요청 방식 여부값(true또는 false)과
		//이동할 페이지 경로 주소값을  저장하여 제공해주는 객체를 저장할 참조변수 선언
		ActionForward forward = null;
		
		//Action인터페이스를 구현한 자식객체를 저장하기 위한 참조변수 선언
		Action action = null;
		if(command.equals("/store.me")){
			action = new StoreGetInfoAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}	
		}
	}
}
