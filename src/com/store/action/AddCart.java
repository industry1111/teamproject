package com.store.action;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.product.action.productDAO;
import com.product.action.productDTO;

import action.Action;
import action.ActionForward;
import dao.boardDAO;
import dto.CartDTO;

public class AddCart implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, 
						HttpServletResponse response)
	throws Exception{

		request.setCharacterEncoding("UTF-8");
		ServletContext context = request.getServletContext();
	
		int member_num = Integer.parseInt(request.getParameter("member_num"));

		int product_num = Integer.parseInt(request.getParameter("product_num"));
		
		int quantity = Integer.parseInt(request.getParameter("quantity"));
		
		//장바구니에 상품정보 저장 후 다른페이지 session에서 꺼내서 사용할 용도
		CartDTO cdto = new CartDTO();
		cdto.setMember_num(member_num);
		cdto.setProduct_num(product_num);
		cdto.setQuantity(quantity);	
		HttpSession session = request.getSession();
		session.setAttribute("cdto", cdto);
		
		//장바구니 테이블에 상품정보 insert함.
		boardDAO bdao = new boardDAO();
		bdao.AddCart(cdto);
		
		
		ActionForward forward=new ActionForward();
		
		forward.setRedirect(true);
		
		forward.setPath("./StoreProductDetail.st");
		
		return forward;
	}
}
