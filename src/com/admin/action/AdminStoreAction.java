package com.admin.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;
import dao.sellerDAO;
import dto.sellerDTO;

public class AdminStoreAction implements Action{
	
	@Override
	public ActionForward execute(HttpServletRequest request, 
						HttpServletResponse response) throws Exception {
		
		 ActionForward forward = new ActionForward();

		 List<sellerDTO> list = new sellerDAO().getSellerInfo();
		 	
		 	request.setAttribute("list", list);
	        forward.setRedirect(false);
	        forward.setPath("AdminStore.ad");
	        
	        return forward;
		}
}
