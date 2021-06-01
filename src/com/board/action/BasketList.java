package com.board.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.member.action.memberDAO;

import action.Action;
import action.ActionForward;
import dao.boardDAO;
import dto.basketDTO;

public class BasketList implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		int member_num = (int) session.getAttribute("member_num");
		memberDAO mdao = new memberDAO();
		
		List<basketDTO> list = new boardDAO().getBasketList(member_num);
		
		request.setAttribute("list", list);
		ActionForward forward=new ActionForward();
		forward.setRedirect(false);
		
		forward.setPath("mypage.jsp"); 
		request.setAttribute("center", "basket.jsp");
		
		return forward;
	}
	

}
