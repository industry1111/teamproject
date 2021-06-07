package com.receiver.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import action.ActionForward;
import action.Criteria;
import action.PageDTO;
import dao.boardDAO;
import dto.receiverDTO;

public class ReceiverList implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
        
        int member_num = (int) session.getAttribute("member_num");
        List<receiverDTO> rlist = new boardDAO().getReceiverList(member_num);
        request.setAttribute("rlist", rlist);
	
     // 페이징 부분
     		String page = request.getParameter("page");
     		Criteria cri;
     		PageDTO pagedto;
     		int numPerPage = 5;

     		if (page != null) {
     			int nowPage = Integer.parseInt(request.getParameter("nowPage"));
     			cri = new Criteria(nowPage, numPerPage);
     			pagedto = new PageDTO(cri, rlist.size());
     		} else {
     			cri = new Criteria(numPerPage);
     			pagedto = new PageDTO(cri, rlist.size());
     		}
     		request.setAttribute("p", pagedto);
     		
     	
        
		request.setAttribute("center", "receiver.jsp");
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("mypage.jsp");
		return forward;
	}
	

}
