package com.member.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;

public class MemberFrontController extends HttpServlet {

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

		if (command.equals("/MemberJoin.me")) {

			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("./join.jsp");

			// join.jsp에서...회원가입 처리요청이 들어 왔을떄...
		} else if (command.equals("/MemberJoinAction.me")) {

			// 회원가입 처리를 위한 Action객체 생성
			action = new MemberJoinAction();

			try {
				forward = action.execute(request, response);

			} catch (Exception e) {
				e.printStackTrace();
			}

		} else if (command.equals("/MemberLogin.me")) {
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("login.jsp");
		} else if (command.equals("/MemberLoginAction.me")) {

			// 로그인 처리를 위한 Action객체 생성
			action = new MemberLoginAction();

			try {
				forward = action.execute(request, response);

			} catch (Exception e) {
				e.printStackTrace();
			}

		}else if (command.equals("/MemberPopupLogin.me")) { //비로그인 상태에서 장바구니 버튼을 눌럿을때 나오는 로그인창
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("popuplogin.jsp");
			
		} else if (command.equals("/MemberPopupLoginAction.me")) { // 비로그인상태에서 장바구니버튼을 누르고 로그인을 했을 때, 
																   // 로그인된 상태로 상품페이지를 다시 보여줌.
																   // 로그인이 성공하면 로그인창은 자동으로 닫힘.
			action = new MemberPopupLoginAction();

			try {
				forward = action.execute(request, response);

			} catch (Exception e) {
				e.printStackTrace();
			}

		}else if (command.equals("/Main.me")) {
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("index.jsp?center=main.jsp");

		} else if (command.equals("/MemberLogout.me")) {
			
			// 로그아웃 처리를 위한 Action객체 생성
			action = new MemberLogoutAction();
			try {

				forward = action.execute(request, response);

			} catch (Exception e) {
				e.printStackTrace();
			}

		} else if (command.equals("/Seller.me")) {

			action = new StoreCategoryList();
			try {

				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/SellerJoinAction.me")) {
			action = new SellerJoinAction();
			try {

				forward = action.execute(request, response);

			} catch (Exception e) {
				e.printStackTrace();
			}

		} else if (command.equals("/MemberInfo.me")) {

			action = new MemberInfo();
			try {

				forward = action.execute(request, response);

			} catch (Exception e) {
				e.printStackTrace();
			}

		} else if (command.equals("/MemberUpdateAction.me")) {

		} else if (command.equals("/DeleteMember.me")) {
			
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("mypage.jsp");
			
			request.setAttribute("center", "deleteMember.jsp");
			
		} else if (command.equals("/StoreInfoUpdateAction.me")) {
			
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("mypage.jsp");
			request.setAttribute("center", "StoreInfoUpdate.jsp");
	
		} else if (command.equals("/StoreInfo.me")) {
		    
			action = new StoreInfo();
			try {
	
				forward = action.execute(request, response);
	
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		} else if (command.equals("/findId.me")) {//id찾기
				forward = new ActionForward();
				forward.setRedirect(true);
				forward.setPath("findId.jsp");

		} else if (command.equals("/findPw.me")) {//pw찾기
				forward = new ActionForward();
				forward.setRedirect(true);
				forward.setPath("findPw.jsp");

			
		} else if (command.equals("/findIdAfter.me")) {//id를 찾은다음 이동
				forward = new ActionForward();
				forward.setRedirect(false);
				forward.setPath("findIdAfter.jsp");

		} 
		// 주소 이동
		if (forward != null) {
			if (forward.isRedirect()) {// true -> sendRedirect() 방식

				response.sendRedirect(forward.getPath());

			} else {// forward() 방식

				RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
		} // if

	}// doProcess 메소드 끝
	
}// 서블릿 끝
