package com.board.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import action.ActionForward;
import dao.boardDAO;
import dto.receiverDTO;

public class OrderReceiverInfo implements Action{
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
		int member_num = (int)session.getAttribute("member_num");
		
		boardDAO bdao = new boardDAO();
		
		List<receiverDTO> list = bdao.getReceiverList(member_num);
		
		request.setAttribute("list", list);
		ActionForward forward = new ActionForward();
		forward.setPath("receiver_3.jsp");
		forward.setRedirect(false);
		return forward;
	}


}
