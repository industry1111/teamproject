package com.board.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.boardDAO;
import dto.receiverDTO;

@WebServlet("/ReceiverUpdate")
public class ReceiverUpdate extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doReUpdate(request, response);

	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	        doReUpdate(request, response);
	}


	protected void doReUpdate(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("dd");
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
		rdto.setBasic_num(Integer.parseInt(request.getParameter("basic_num")));
		
		new boardDAO().updateReceiver(rdto, receiver_num,member_num);

	}

}
