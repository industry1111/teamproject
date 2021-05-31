package com.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import action.ActionForward;
import dto.reviewDTO;



public class WrittenReviewsAction implements Action{

	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("ratingTest");
		
		request.setCharacterEncoding("utf-8");
		
		HttpSession session=request.getSession();
		int product_num = (Integer) session.getAttribute("product_num");
		
		reviewDTO rdto = new reviewDTO();
		rdto.setRating1(Integer.parseInt(request.getParameter("Rating1")));
		rdto.setRating2(Integer.parseInt(request.getParameter("Rating2")));
		rdto.setRating3(Integer.parseInt(request.getParameter("Rating3")));
		
		
		request.setAttribute("center", "writtenReviews.jsp");
		
		ActionForward forward = new ActionForward();
		forward.setPath("mypage.jsp");
		forward.setRedirect(false);
		return forward;
	}

	
}
