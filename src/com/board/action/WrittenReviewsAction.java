package com.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



public class WrittenReviewsAction implements Action{

	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("ratingTest");
		
		request.setCharacterEncoding("utf-8");
		
		HttpSession session=request.getSession();
		String id = (String)session.getAttribute("id");
		int member_num = (int)session.getAttribute("member_num");
		
		int rating1 = Integer.parseInt(request.getParameter("rating1"));
		System.out.println(request.getParameter("rating1"));
		
		
		
		request.setAttribute("center", "writtenReviews.jsp");
		
		ActionForward forward = new ActionForward();
		forward.setPath("writtenReviews.jsp");
		forward.setRedirect(false);
		return forward;
	}

	
}
