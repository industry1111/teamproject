package com.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.boardDAO;
import dto.receiverDTO;


public class ReceiverInfo implements Action{

	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		
		int receiver_num = Integer.parseInt(request.getParameter("receiver_num"));
		
		boardDAO bdao = new boardDAO();
		
		receiverDTO rdto = bdao.getReceiverInfo(receiver_num);
		
		request.setAttribute("rdto", rdto);
		ActionForward forward = new ActionForward();
		forward.setPath("receiver_2.jsp");
		forward.setRedirect(false);
		return forward;
	}

	
}
