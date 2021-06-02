package com.board.action;

import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import action.ActionForward;
import dao.boardDAO;
import dto.basketDTO;
import dto.receiverDTO;

public class Order implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		int member_num = (int) session.getAttribute("member_num");
		boardDAO bdao =	new boardDAO();
		
		String s_checkbox = request.getParameter("chk");
		String[] check = s_checkbox.split(",");
		List<basketDTO> list = bdao.getBasketList(member_num);
		List<receiverDTO> rlist = bdao.getReceiverList(member_num);
		
		request.setAttribute("rlist", rlist);
		request.setAttribute("list", list);
		request.setAttribute("check",check);
		request.setAttribute("center", "order_1.jsp");
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("mypage.jsp");
		
		return forward;
	}

}
