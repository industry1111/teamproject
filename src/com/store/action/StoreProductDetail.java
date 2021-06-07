package com.store.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.product.action.productDAO;
import com.product.action.productDTO;

import action.Action;
import action.ActionForward;
import dao.boardDAO;
import dao.sellerDAO;
import dto.brandDTO;
import dto.categoryDTO;
import dto.sellerDTO;

public class StoreProductDetail implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		
		int product_num = Integer.parseInt(request.getParameter("product_num"));
		
		String template = request.getParameter("template");
		/*데이터베이스 자바빈 작업*/
		productDAO pdao = new productDAO();
		productDTO pdto = pdao.getStoreProductInfo(product_num);	
		sellerDAO sdao = new sellerDAO();
		List<sellerDTO> sdto = sdao.getSellerInfo();
		
		//카테고리 정보 받아오기
		boardDAO bdao = new boardDAO();
		List<categoryDTO> clist = bdao.getcategory();
		List<brandDTO> blist = bdao.getbrandList();
		
		request.setAttribute("blist", blist);
		request.setAttribute("clist", clist);
		request.setAttribute("pdto", pdto);
		request.setAttribute("sdto", sdto);
		ActionForward forward = new ActionForward();
		
		request.setAttribute("center", "template/product.jsp"); 
		forward.setRedirect(false);
		forward.setPath("index.jsp");
		return forward;
	}
	

}
