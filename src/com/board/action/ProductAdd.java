package com.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ProductAdd implements Action {
	// 상품추가 페이지로 이동
	@Override
	public ActionForward execute(HttpServletRequest request, 
			HttpServletResponse response) throws Exception {
		
		
		request.setAttribute("center", "ProductAdd.jsp");
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("mypage.jsp");
		
		return forward;
	}
	
	

}
