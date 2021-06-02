package com.product.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;
import dao.boardDAO;
import dto.brandDTO;
import dto.categoryDTO;

public class ProductModify implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		
		int product_num = Integer.parseInt(request.getParameter("product_num"));
	
		/*데이터베이스 자바빈 작업*/
		productDAO pdao = new productDAO();
		productDTO pdto = pdao.getProductInfo(product_num);	
		
		//카테고리 정보 받아오기
		boardDAO bdao = new boardDAO();
		List<categoryDTO> clist = bdao.getcategory();
		List<brandDTO> blist = bdao.getbrandList();
		
		request.setAttribute("blist", blist);
		request.setAttribute("clist", clist);
		request.setAttribute("pdto", pdto);
		request.setAttribute("center", "ProductModify.jsp"); 
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("mypage.jsp");
		return forward;
	}
	

}
