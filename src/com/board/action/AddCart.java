package com.board.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.boardDAO;
import dto.CartDTO;

@WebServlet("/AddCart.do")
public class AddCart extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		
	
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		HttpSession session = request.getSession();
		
		PrintWriter out = response.getWriter();
		
		int member_num = 0;
		if((String) session.getAttribute("id") != null){
			member_num = (int) session.getAttribute("member_num");
			int product_num = Integer.parseInt(request.getParameter("product_num"));
			int quantity = Integer.parseInt(request.getParameter("quantity"));
			
			//장바구니에 상품정보 저장 후 다른페이지 session에서 꺼내서 사용할 용도
			CartDTO cdto = new CartDTO();
			cdto.setMember_num(member_num);
			cdto.setProduct_num(product_num);
			cdto.setQuantity(quantity);	
			
		
			//장바구니 테이블에 상품정보 insert함.
			boardDAO bdao = new boardDAO();
			bdao.AddCart(cdto);
		} //id값이 있으면 실행
		
		out.print(member_num);
		out.flush();
		out.close();		
	}
}

