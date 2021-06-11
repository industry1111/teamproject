package com.store.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.product.action.productDAO;
import com.product.action.productDTO;

import action.Action;
import action.ActionForward;
import dao.sellerDAO;
import dto.sellerDTO;

public class Report implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		
		int member_num = Integer.parseInt(request.getParameter("member_num"));
		int product_num = Integer.parseInt(request.getParameter("product_num"));
		System.out.println(member_num + " : member_num");
		System.out.println(product_num + " : product_num");
		sellerDAO sdao = new sellerDAO();
		productDAO pdao = new productDAO();
		sellerDTO sdto = sdao.getSellerInfo(member_num);
		productDTO pdto = pdao.getProductInfo(product_num);
		System.out.println("스토어이름 : " + sdto.getStore_name());
		request.setAttribute("sdto", sdto);
		request.setAttribute("pdto", pdto);
		
		ActionForward forward = new ActionForward();
		forward.setPath("report.jsp");
		forward.setRedirect(false);
		
		return forward;
		
	}

	
	
	
}
