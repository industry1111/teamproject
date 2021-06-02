package com.board.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import action.ActionForward;
import dao.ReviewDAO;
import dto.reviewDTO;

public class ReviewListAction implements Action {
	//여기아직 안함----------------------------reviewlist복사함
	@Override
	public ActionForward execute(HttpServletRequest request, 
			HttpServletResponse response) throws Exception {
		
		
		HttpSession session = request.getSession();
		int member_num = (Integer) session.getAttribute("member_num");
		
		reviewDTO rdto = new reviewDTO();
		rdto.setRating1(Integer.parseInt(request.getParameter("Rating1")));
		rdto.setRating2(Integer.parseInt(request.getParameter("Rating2")));
		rdto.setRating3(Integer.parseInt(request.getParameter("Rating3")));
		System.out.println("DD");
		//AdminGoodsDAO객체 생성 후 getGoodsList()생성
		ReviewDAO rvdao = new ReviewDAO();
		List<reviewDTO> list = rvdao.getReviewList(member_num);
		
		
		
		//requset영역에 저장
		request.setAttribute("list", list);
		request.setAttribute("center", "writtenReviews.jsp");
		ActionForward forward = new ActionForward();
		//페이지이동(뷰페이지로이동)
		forward.setPath("mypage.jsp");
		forward.setRedirect(false);		
		return forward;
	}
}