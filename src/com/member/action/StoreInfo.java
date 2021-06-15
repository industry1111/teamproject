package com.member.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import action.ActionForward;
import dao.boardDAO;
import dao.sellerDAO;
import dto.categoryDTO;
import dto.sellerDTO;
import dto.templateDTO;

public class StoreInfo implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		HttpSession session = request.getSession();
		
        int member_num = (int) session.getAttribute("member_num");

        sellerDTO sdto = new sellerDAO().getSellerInfo(member_num);
        request.setAttribute("sdto", sdto);
        
        boardDAO bdao = new boardDAO();
        List<categoryDTO> list = bdao.getcategory();
    
        
        request.setAttribute("list", list);
       
		
        request.setAttribute("center","StoreInfoUpdate.jsp");
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("mypage.jsp");
		
		return forward;
	}

}
