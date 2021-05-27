package net.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import db.memberDAO;
import db.memberDTO;
import db.sellerDTO;

public class StoreInfo implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

	      	HttpSession session = request.getSession();
	        
	        int member_num = (Integer)session.getAttribute("member_num");
	        
	        
	        sellerDTO sdto = new memberDAO().getSellerInfo(member_num);
	        request.setAttribute("sdto", sdto);
	        request.setAttribute("center","StoreInfoUpdate.jsp");

		
			ActionForward forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("mypage.jsp");
			
		return forward;
	}

}
