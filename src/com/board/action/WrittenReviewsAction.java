package com.board.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.order.action.OrderDAO;
import com.order.action.OrderDTO;
import com.product.action.productDAO;
import com.product.action.productDTO;

import action.Action;
import action.ActionForward;
import action.Criteria;
import action.PageDTO;
import dao.ReviewDAO;
import dto.reviewDTO;



public class WrittenReviewsAction implements Action{

	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("writtenReveiwsAction execute");
		
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		int member_num = (Integer)session.getAttribute("member_num");
	
		OrderDAO odao = new OrderDAO();
		List<String> order = new ArrayList<String>();
		List<OrderDTO> odlist = odao.getOrderInfo(member_num);
		List<productDTO> pdlist = new ArrayList<productDTO>();
		
		if(odlist.size() > 0){
			for(int i=0; i<odlist.size(); i++){
				OrderDTO odto=(OrderDTO)odlist.get(i);
				String Orders_code= odto.getOrders_code();
				order.add(Orders_code);
			} 
			
			pdlist = odao.getWrittenReviewProduct(order);
			request.setAttribute("pdlist", pdlist);
		}
		
		ReviewDAO rvdao = new ReviewDAO();
		List<reviewDTO> rvlist= rvdao.getReviewList(member_num);
		request.setAttribute("rvlist", rvlist);
		
		
		
		//페이징 부분
		String page = request.getParameter("page");
		Criteria cri;
		PageDTO pagedto;
		int numPerPage = 10;
				
		if(page != null){
			int nowPage = Integer.parseInt(request.getParameter("nowPage"));
			cri = new Criteria(nowPage, numPerPage);
			pagedto = new PageDTO(cri, rvlist.size());
		}else{
			cri = new Criteria(numPerPage);
			pagedto = new PageDTO(cri, rvlist.size());
		}
				
		request.setAttribute("p", pagedto);
		request.setAttribute("rvlist", rvlist);
		
		
		request.setAttribute("center", "writtenReviews.jsp");
		ActionForward forward = new ActionForward();
		forward.setPath("mypage.jsp");
		forward.setRedirect(false);
		return forward;
	}

	
}
