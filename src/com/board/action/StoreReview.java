package com.board.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.member.action.memberDAO;

import action.Action;
import action.ActionForward;
import dao.ReviewDAO;
import dao.sellerDAO;
import dto.reviewDTO;

public class StoreReview implements Action {
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		int member_num = (Integer)session.getAttribute("member_num");
		int store_num = new sellerDAO().getSellerInfo(member_num).getStore_num();
		
		ReviewDAO rdao = new ReviewDAO();
		List<reviewDTO> srlist = rdao.getStoreReviewList(store_num);
		System.out.println(srlist.size());
		
		request.setAttribute("srlist", srlist);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("mypage.jsp");
		request.setAttribute("center", "StoreChart.jsp");
		return forward;
		
		
		
	}
}
