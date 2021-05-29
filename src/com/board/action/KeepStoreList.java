package com.board.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;
import dao.boardDAO;
import dto.categoryDTO;

public class KeepStoreList implements Action{

	
	
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		

		boardDAO bdao = new boardDAO();
		List<categoryDTO> list = bdao.getcategory();
		
		request.setAttribute("list", list);
		
		request.setAttribute("center", "keepstore.jsp");
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("mypage.jsp");
		return forward;
	}
	

}
