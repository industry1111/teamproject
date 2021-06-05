package com.admin.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.member.action.memberDAO;
import com.member.action.memberDTO;

import action.Action;
import action.ActionForward;

public class AdminMemberAction implements Action{
	
	@Override
	public ActionForward execute(HttpServletRequest request, 
						HttpServletResponse response) throws Exception {
		
		 ActionForward forward = new ActionForward();

		 List<memberDTO> list = new memberDAO().getMembersInfo();
		 	
		 	request.setAttribute("list", list);
	        forward.setRedirect(false);
	        forward.setPath("AdminMember.ad");
	        
	        return forward;
		}
}
