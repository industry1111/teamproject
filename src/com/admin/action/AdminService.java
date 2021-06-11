package com.admin.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;
import action.Criteria;
import action.PageDTO;
import dao.boardDAO;
import dto.pagingDTO;


public class AdminService implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
			
			request.setCharacterEncoding("utf-8");
		
			ActionForward forward = new ActionForward();
			
			//페이징 부분
			String page = request.getParameter("page");
			Criteria cri;
			PageDTO pagedto;
			int numPerPage = 5;
			
//			if(page != null){
//				int nowPage = Integer.parseInt(request.getParameter("nowPage"));
//				cri = new Criteria(nowPage, numPerPage);
//				pagedto = new PageDTO(cri, list.size());
//			}else{
//				cri = new Criteria(numPerPage);
//				pagedto = new PageDTO(cri, list.size());
//			}
//			
//			request.setAttribute("list", list);
//			request.setAttribute("p", pagedto);
			
	        forward.setRedirect(false);
	        forward.setPath("AdminService.jsp");
	        
	        return forward;	
	}
} 
