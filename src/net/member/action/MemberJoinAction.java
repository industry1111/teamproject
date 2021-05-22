package net.member.action;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.member.memberDAO;
import com.member.memberDTO;

public class MemberJoinAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) 
			throws Exception {
		System.out.println("MemberJoinAction execute()");
		
		request.setCharacterEncoding("utf-8");
		
		memberDTO mb=new memberDTO();
		mb.setId(request.getParameter("id"));
		mb.setPw(request.getParameter("pw"));
		mb.setName(request.getParameter("name"));
		mb.setEmail(request.getParameter("email"));
		mb.setPhone(request.getParameter("phone"));
		mb.setAddr1(request.getParameter("addr1"));
		mb.setAddr2(request.getParameter("addr2"));
		mb.setAddr3(request.getParameter("addr3"));
		
		
		//회원가입 성공 여부를 담을 변수 선언
		boolean result = false;
		
		memberDAO mdao=new memberDAO();
		
		//회원가입 내용을 담고 있는 mb객체를 전달하여..
		//가입에 성공하면 true리턴, 실패하면 false리턴
		result = mdao.insertMember(mb);
	
		//회원 가입 처리에 실패 했을 경우 null을 반환 한다.
		if(result == false){
			System.out.println("회원가입 실패");
			return null;
		}
		
		/*회원 가입 성공 시 로그인 페이지로 이동.*/
		//페이지 이동 방식 여부 값,이동페이지 경로 값 저장 하여 리턴 해주는 객체 생성
		ActionForward forward=new ActionForward();

		forward.setRedirect(true);
	
		forward.setPath("./MemberLogin.me");

		return forward;
	}
}
