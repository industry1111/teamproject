package com.board.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import action.ActionForward;
import dao.ReviewDAO;
import dto.reviewDTO;

public class StoreReview implements Action {
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		int member_num = (Integer)session.getAttribute("member_num");
		
		ReviewDAO rdao = new ReviewDAO();
		List<reviewDTO> srlist = rdao.getStoreReviewList(member_num);
		
		request.setAttribute("srlist", srlist);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("mypage.jsp");

		return forward;
		
		
		
	}
}
