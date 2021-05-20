package net.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.member.db.MemberBean;
import net.member.db.MemberDAO;

public class SignUpAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		MemberBean mb = new MemberBean();
		
		mb.setName(request.getParameter("name"));
		mb.setId(request.getParameter("id"));
		mb.setPassword(request.getParameter("pw"));
		mb.setEmail(request.getParameter("email"));
		mb.setPhone(request.getParameter("phone"));
		mb.setAddress1(request.getParameter("addr1"));
		mb.setAddress2(request.getParameter("addr2"));
		mb.setAddress3(request.getParameter("addr3"));
		
		MemberDAO mdao = new MemberDAO();
		boolean result = false;
		
		result = mdao.insertMember(mb);
		
		if(result == false){
			System.out.println("회원가입 실패");
			return null;
		}
		ActionForward forward=new ActionForward();
		forward.setRedirect(false);
		forward.setPath("../index.jsp?center=main.jsp");
		return forward;
	}
	

}
