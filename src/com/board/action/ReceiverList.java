package com.board.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import db.boardDAO;
import db.receiverDTO;

public class ReceiverList implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
        
        int member_num = (int) session.getAttribute("member_num");
        List<receiverDTO> rlist = new boardDAO().getReceiverInfo(member_num);
        
        request.setAttribute("rlist", rlist);
	
		request.setAttribute("center", "receiver.jsp");
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("mypage.jsp");
		return forward;
	}
	

}
