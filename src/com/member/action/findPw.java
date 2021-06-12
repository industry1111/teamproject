package com.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;

public class findPw implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		
		ActionForward forward = new ActionForward();
		
		memberDAO mdao=new memberDAO().findPw();
			
		mdao.findPw(pw);
		
		String name = request.getParameter("name");
		String email = request.getParameter("email");

		String pw = mdao.findPw(name,email);

		request.setAttribute("pw", pw);
		
		forward.setRedirect(false);
		forward.setPath("");
		 
        return forward;	
}


}