package com.board.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.product.action.productDAO;
import com.product.action.productDTO;

import action.Action;
import action.ActionForward;
import action.Criteria;
import action.PageDTO;
import dao.boardDAO;
import dto.categoryDTO;

public class KeepStoreList implements Action{

	
	
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//여기부터 밑에까지 손댐
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		int member_num = (Integer)session.getAttribute("member_num");
		
		
		productDAO pdao = new productDAO();
		List<productDTO> plist= pdao.getProductList(member_num);
		request.setAttribute("plist", plist);
		//
		boardDAO bdao = new boardDAO();
		List<categoryDTO> list = bdao.getcategory();
		
		request.setAttribute("list", list);
		
		//페이징 부분
				String page = request.getParameter("page");
				Criteria cri;
				PageDTO pagedto;
				int numPerPage = 5;
						
				if(page != null){
					int nowPage = Integer.parseInt(request.getParameter("nowPage"));
					cri = new Criteria(nowPage, numPerPage);
					pagedto = new PageDTO(cri, plist.size());
				}else{
					cri = new Criteria(numPerPage);
					pagedto = new PageDTO(cri, plist.size());
				}
						
				request.setAttribute("p", pagedto);
				request.setAttribute("plist", plist);
				
		
		
		request.setAttribute("center", "keepstore.jsp");
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("mypage.jsp");
		return forward;
	}
	

}
