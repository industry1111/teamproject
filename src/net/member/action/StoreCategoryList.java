package net.member.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.boardDAO;
import db.categoryDTO;



public class StoreCategoryList implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		boardDAO bdao = new boardDAO();
		List<categoryDTO> list = bdao.getcategory();
		
		request.setAttribute("list", list);
		
		request.setAttribute("center", "seller.jsp");
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("mypage.jsp");
		
		return forward;
	}
	

}
