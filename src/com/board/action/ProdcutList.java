package com.board.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import db.boardDAO;
import db.memberDAO;
import db.productDTO;

public class ProdcutList implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		
		//
		boardDAO bDao = new boardDAO();
		List<productDTO> productlist = bDao.getProductList();
						
		System.out.println("M : "+ productlist);
		
		
		//
		request.setAttribute("center", "ProductList.jsp");
		//
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("mypage.jsp");
		return forward;
	}
	
}
