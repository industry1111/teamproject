package com.board.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.boardDAO;
import dto.productDTO;

public class ProductListAction implements Action {
	
	@Override
	public ActionForward execute(HttpServletRequest request, 
			HttpServletResponse response) throws Exception {

		HttpSession session = request.getSession();
		int member_num = (Integer) session.getAttribute("member_num");
	
		//AdminGoodsDAO객체 생성 후 getGoodsList()생성
		boardDAO bDao = new boardDAO();
		List<productDTO> list = bDao.getProductList(member_num);
		
		//requset영역에 저장
		request.setAttribute("list", list);
		request.setAttribute("center", "ProductList.jsp");
		ActionForward forward = new ActionForward();
		//페이지이동(뷰페이지로이동)
		forward.setPath("mypage.jsp");
		forward.setRedirect(false);		
		return forward;
	}
}