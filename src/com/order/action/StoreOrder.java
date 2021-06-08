package com.order.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.member.action.memberDAO;
import com.member.action.memberDTO;

import action.Action;
import action.ActionForward;
import action.Criteria;
import action.PageDTO;
import dao.sellerDAO;
import dto.sellerDTO;

public class StoreOrder implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		int member_num = (int) session.getAttribute("member_num");
		String id = (String) session.getAttribute("id");
		
		sellerDTO sdto = new sellerDAO().getSellerInfo(member_num); 
		OrderDAO odao = new OrderDAO();

		int store_num = sdto.getStore_num();
		
		List<StoreOrderDTO> list = odao.getStoreOrder(store_num);
		
		// 페이징 부분
		String page = request.getParameter("page");
		Criteria cri;
		PageDTO pagedto;
		int numPerPage = 10;

		if (page != null) {
			int nowPage = Integer.parseInt(request.getParameter("nowPage"));
			cri = new Criteria(nowPage, numPerPage);
			pagedto = new PageDTO(cri, list.size());
		} else {
			cri = new Criteria(numPerPage);
			pagedto = new PageDTO(cri, list.size());
		}
		request.setAttribute("p", pagedto);
		request.setAttribute("list", list);
		 ActionForward forward = new ActionForward();
         forward.setRedirect(false);
         
         forward.setPath("mypage.jsp"); 
         request.setAttribute("center", "StoreOrder.jsp");
         
         return forward;
	}

	
	
	
}
