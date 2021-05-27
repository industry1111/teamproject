package com.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

<<<<<<< HEAD:src/net/member/action/StoreInfo.java
import db.memberDAO;
import db.memberDTO;
import db.sellerDTO;
=======
import dao.memberDAO;
import dto.memberDTO;
>>>>>>> 9f6ccbc3e44a9f6c7cae6ad687744e90f73dd59f:src/com/member/action/StoreInfo.java

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
