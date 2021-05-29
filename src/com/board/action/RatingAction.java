package com.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.memberDAO;
import dao.productDAO;
import dto.ratingDTO;

public class RatingAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("ratingTest");
		
		request.setCharacterEncoding("utf-8");
		
		HttpSession session=request.getSession();
		String id = (String)session.getAttribute("id");
		
		System.out.println(request.getParameter("rating1"));
		System.out.println(request.getParameter("rating2"));
		System.out.println(request.getParameter("rating3"));
		
		
		
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("mypage.jsp");
		
		return forward;

}
}
