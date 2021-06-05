package com.admin.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;
import dao.ReviewDAO;
import dto.reviewDTO;


public class AdminService implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
			
			request.setCharacterEncoding("utf-8");
		
			ActionForward forward = new ActionForward();
			
			
	        forward.setRedirect(false);
	        forward.setPath("AdminService.jsp");
	        
	        return forward;	
	}
} 
