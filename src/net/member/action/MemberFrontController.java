package net.member.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemberFrontController extends HttpServlet{

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
		
		//가상요청 주소 가져오기
		//  /CarProject/MemberJoin.me
		String RequestURI=request.getRequestURI();
		
		//  /CarProject 얻기
		String contextPath=request.getContextPath();
		
		//	길이 11
		
		//  /MemberJoin.me 얻기
		String command=RequestURI.substring(contextPath.length());
		System.out.println(command);
					
		/*주소 비교*/	
		//페이지 이동 방식 여부 값,이동페이지 경로 값 저장 하여 리턴 해주는 객체를 저장할 참조변수 선언 
		ActionForward forward=null;
	
		//자식 Action 객체들을 담을 인터페이스 타입의 참조변수 선언
		Action action=null;
			
		//Top.jsp에서.. join링크를 누르면 회원가입페이지로 이동하는 요청이 들어 왔을때..
		if(command.equals("/MemberJoin.me")){
		
			//페이지 이동 방식 여부 값,이동페이지 경로 값 저장 하여 리턴 해주는 객체 생성 
			forward=new ActionForward();
			//페이지 이동 방식 여부 값 false로 저장-> RequestDispatcher  forward() 방식
			forward.setRedirect(false);
			//이동할 페이지 경로(회원가입 페이지) 주소값 저장
			forward.setPath("./join.jsp");
			
		//join.jsp에서...회원가입 처리요청이 들어 왔을떄...	
		}else if(command.equals("/MemberJoinAction.me")){
	
			//회원가입 처리를 위한 Action객체 생성
			action=new MemberJoinAction();
			
			try {
				forward=action.execute(request, response);
						
			} catch (Exception e) {
				e.printStackTrace();
			}

		}else if(command.equals("/MemberLogin.me")){ 

			forward=new ActionForward();
			forward.setRedirect(false); 
			forward.setPath("login.jsp"); 

		}else if(command.equals("/MemberLoginAction.me")){
			
			//로그인 처리를 위한 Action객체 생성 
			action=new MemberLoginAction();
			
			try {
				forward=action.execute(request, response);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}else if(command.equals("/Main.me")) {
			
		}else if(command.equals("/MemberLogout.me")){
			
			//로그아웃 처리를 위한 Action객체 생성  
			action=new MemberLogoutAction();
			try {
			
				forward=action.execute(request, response); //return null;

			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/Seller.me")){
			forward=new ActionForward();
			forward.setRedirect(false); 
			forward.setPath("index.jsp");
			request.setAttribute("center","seller.jsp" );
			
		}else if(command.equals("/SellerJoinAction.me")) {
			
		}else if(command.equals("/MemberUpdate.me")){
			forward=new ActionForward();
			forward.setRedirect(false); 
			forward.setPath("mypage.jsp");
			request.setAttribute("center","MemberUpdate.jsp" );
		}


		//주소 이동
		if(forward!=null){ 
			if(forward.isRedirect()){//true -> sendRedirect() 방식

				response.sendRedirect(forward.getPath());
				
			}else{//forward() 방식
				
				RequestDispatcher dispatcher=request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
		}//if 
		
	}//	doProcess 메소드 끝
	
}//서블릿 끝



