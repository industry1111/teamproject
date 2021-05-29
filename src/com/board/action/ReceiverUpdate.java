package com.board.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import db.boardDAO;
import db.memberDAO;
import db.receiverDTO;
@WebServlet("/ReceiverInsert")
public class ReceiverUpdate extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doReIn(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doReIn(request, response);
	}

	protected void doReIn(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		System.out.println("ReceiverInsertAction execute()");
		
		request.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
		int member_num = (int) session.getAttribute("member_num");
		receiverDTO rdto = new receiverDTO();
		
		boardDAO bdao = new boardDAO();
		rdto.setAddress_name(request.getParameter("addr_name"));
		rdto.setReceiver_name(request.getParameter("receiver_name"));
		rdto.setReceiver_addr1(request.getParameter("addr1"));
		rdto.setReceiver_addr2(request.getParameter("addr2"));
		rdto.setReceiver_addr3(request.getParameter("addr3"));
		rdto.setReceiver_phone(request.getParameter("receiver_phone"));
		rdto.setBasic_num(Integer.parseInt(request.getParameter("basic_num")));
		
		bdao.insertReceiver(rdto, member_num);

	}

}
