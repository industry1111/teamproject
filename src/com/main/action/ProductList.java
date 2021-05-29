package com.main.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import action.ActionForward;
import dao.boardDAO;
import dao.sellerDAO;
import dto.categoryDTO;
import dto.productDTO;
import dto.sellerDTO;

public class ProductList implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		
		boardDAO bdao = new boardDAO();
		sellerDAO sdao = new sellerDAO();
		List<categoryDTO> clist = bdao.getcategory();
		List<productDTO> plist = bdao.getProductList();
 		List<sellerDTO> slist = sdao.getSellerInfo();
 		request.setAttribute("clist", clist);
		request.setAttribute("plist", plist);
		request.setAttribute("slist", slist);
		ActionForward forward = new ActionForward();
		forward.setPath("index.jsp");
		forward.setRedirect(false);
		request.setAttribute("center", "main.jsp");
		return forward;
	}
	
}
