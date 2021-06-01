package com.product.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;
import dao.boardDAO;
import dto.categoryDTO;

public class ProductAdd implements Action {
	// 상품추가 페이지로 이동
	@Override
	public ActionForward execute(HttpServletRequest request, 
			HttpServletResponse response) throws Exception {
		
		boardDAO bdao = new boardDAO();
		List<categoryDTO> list = bdao.getcategory();
		
		request.setAttribute("list", list);
		request.setAttribute("center", "ProductAdd.jsp");
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("mypage.jsp");
		
		return forward;
	}
	
	

}
