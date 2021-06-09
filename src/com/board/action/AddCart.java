package com.board.action;

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
	
		HttpSession session = request.getSession();
		
		int member_num = (Integer)session.getAttribute("member_num");

		int product_num = (Integer)request.getAttribute("product_name");
		
		int quantity = (Integer)request.getAttribute("quantity");
		
		CartDTO cdto = new CartDTO();
		cdto.setMember_num(member_num);
		cdto.setProduct_num(product_num);
		cdto.setQuantity(quantity);
		
		
		boardDAO bdao = new boardDAO();
		bdao.AddCart(member_num, product_num, quantity);
		
		
		ActionForward forward=new ActionForward();
		
		forward.setRedirect(true);
		
		forward.setPath("./StoreProductListAction.st");
		
		return forward;
	}
}
