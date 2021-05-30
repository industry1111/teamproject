package com.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import action.ActionForward;



public class WrittenReviewsAction implements Action{

	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("ratingTest");
		
		request.setCharacterEncoding("utf-8");
		
		HttpSession session=request.getSession();
		System.out.println(request.getParameter("rating1"));
		
		
		
		request.setAttribute("center", "writtenReviews.jsp");
		
		ActionForward forward = new ActionForward();
		forward.setPath("mypage.jsp");
		forward.setRedirect(false);
		return forward;
	}

	
}
