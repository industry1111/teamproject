package com.receiver.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import action.ActionForward;
import dao.boardDAO;
import dto.receiverDTO;

public class ReceiverUpdateAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		int receiver_num = Integer.parseInt(request.getParameter("receiver_num"));
		receiverDTO rdto = new receiverDTO();
		
		HttpSession session = request.getSession();
		int member_num = (int) session.getAttribute("member_num");
	
		rdto.setAddress_name(request.getParameter("addr_name"));
		rdto.setReceiver_name(request.getParameter("receiver_name"));
		rdto.setReceiver_phone(request.getParameter("receiver_phone"));
		rdto.setReceiver_addr1(request.getParameter("receiver_addr1"));
		rdto.setReceiver_addr2(request.getParameter("receiver_addr2"));
		rdto.setReceiver_addr3(request.getParameter("receiver_addr3"));
		rdto.setReceiver_msg(request.getParameter("receiver_msg"));
		rdto.setBasic_num(Integer.parseInt(request.getParameter("basic")));
		
		new boardDAO().updateReceiver(rdto, receiver_num,member_num);
		
		ActionForward forward = new ActionForward();
		
		forward.setPath("close.jsp");
		forward.setRedirect(true);
		
		return forward;
	}

}
