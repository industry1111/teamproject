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

public class WritableReviewsAction implements Action{

	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("WritableReviewAction execute");


		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		int member_num = (Integer)session.getAttribute("member_num");
		
		productDAO pdao = new productDAO();
		List<productDTO> plist= pdao.getProductList(member_num);
		request.setAttribute("plist", plist);
		
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
	
		
		
		
		request.setAttribute("center", "writableReviews.jsp");
		ActionForward forward = new ActionForward();
		forward.setPath("mypage.jsp");
		forward.setRedirect(false);
		return forward;
	}

	
}
