package com.admin.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.member.action.memberDAO;
import com.member.action.memberDTO;

import action.Action;
import action.ActionForward;
import action.Criteria;
import action.PageDTO;

public class AdminMember implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
			
			request.setCharacterEncoding("utf-8");
			
			ActionForward forward = new ActionForward();
			//회원정보를 가지고온다.
			List<memberDTO> list = new memberDAO().getMembersInfo();
			//회원정보를 전달하기 위해 
			request.setAttribute("list", list);
	        forward.setRedirect(false);
	        forward.setPath("AdminMember.jsp");
 
	        return forward;	
	}

	
}
