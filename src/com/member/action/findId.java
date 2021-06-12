package com.member.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;

public class findId implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		
		ActionForward forward = new ActionForward();
		
		memberDAO mdao=new memberDAO().findId();
			
		mdao.findId(id);

		String email = request.getParameter("email");

		String id = mdao.findId(email);

		request.setAttribute("id", id); //ID를 세션에 담고 

		forward.setRedirect(false);//DB변화없음 
        forward.setPath("findIdAfter.me");//찾은다음결과를표시하기위한이동경로설정
	
		 
		return forward;	
	}

}
	
		