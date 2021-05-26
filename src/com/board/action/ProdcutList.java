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
	public ActionForward execute(HttpServletRequest request, 
								HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		
		//회원정보 가져오기
		boardDAO bDao = new boardDAO();
		List<productDTO> productlist = bDao.getProductList();
						
		//등록된 상품 목록 전부 가져오기
		System.out.println("M : "+ productlist);
		
		
		//리퀘스트 영역에 저장
		request.setAttribute("center", "ProductList.jsp");
		//페이지 이동
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("mypage.jsp");
		return forward;
	}
	
}
