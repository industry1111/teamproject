package com.board.action;

import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.member.action.memberDAO;
import com.member.action.memberDTO;

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
		String id = (String) session.getAttribute("id");
		boardDAO bdao =	new boardDAO();
		memberDAO mdao = new memberDAO();
		
		String product_num = request.getParameter("product_num");
		
		int price_total = Integer.parseInt(request.getParameter("price_total"));
		String s_checkbox = request.getParameter("chk");
		String[] check = s_checkbox.split(",");
		List<basketDTO> list = bdao.getBasketList(member_num);
		List<receiverDTO> rlist = bdao.getReceiverList(member_num);
		memberDTO mdto = mdao.getMemberInfo(id);
		
		request.setAttribute("price_total", price_total);
		request.setAttribute("mdto", mdto);
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
