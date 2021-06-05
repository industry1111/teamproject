package com.admin.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;
import dao.ReviewDAO;
import dto.reviewDTO;

public class AdminServiceAction implements Action{
	
	@Override
	public ActionForward execute(HttpServletRequest request, 
						HttpServletResponse response) throws Exception {
		
		 ActionForward forward = new ActionForward();

	        forward.setRedirect(false);
	        forward.setPath("AdminService.ad");
	        
	        return forward;
		}
}