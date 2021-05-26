package net.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import db.memberDAO;
import db.memberDTO;

public class SellerJoinAction implements Action{
	  @Override
	    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
	        
	        HttpSession session = request.getSession();
	        
	        
	        
	        
	        
	        
	        
	        ActionForward forward = new ActionForward();
	        forward.setRedirect(true);
	        forward.setPath("main.me");
	        
	        return forward;
	    }
}
