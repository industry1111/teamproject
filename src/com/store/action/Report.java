package com.store.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.product.action.productDAO;
import com.product.action.productDTO;

import action.Action;
import action.ActionForward;
import dao.boardDAO;
import dao.sellerDAO;
import dto.categoryDTO;
import dto.sellerDTO;

public class Report implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		
		int product_num = Integer.parseInt(request.getParameter("product_num"));

		sellerDAO sdao = new sellerDAO();
		productDAO pdao = new productDAO();
		productDTO pdto = pdao.getProductInfo(product_num);
		sellerDTO sdto = sdao.getSellerInfo(pdto.getMember_num());
		 List<categoryDTO> clist = new boardDAO().getcategory();
	        
		
		request.setAttribute("sdto", sdto);
		request.setAttribute("pdto", pdto);
		request.setAttribute("clist", clist);
		
		ActionForward forward = new ActionForward();
		forward.setPath("report.jsp");
		forward.setRedirect(false);
		
		return forward;
		
	}

	
	
	
}
