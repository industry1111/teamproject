package com.admin.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.member.action.memberDAO;
import com.member.action.memberDTO;
import com.mysql.jdbc.ReplicationMySQLConnection;

import action.Action;
import action.ActionForward;

public class AdminMain implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
			
		 	ActionForward forward = new ActionForward();
	        forward.setRedirect(false);
	        forward.setPath("AdminMain.jsp");
	        
	        return forward;	
	}
} 


