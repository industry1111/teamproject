package com.admin.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.member.action.memberDAO;
import com.member.action.memberDTO;
import com.product.action.productDAO;
import com.product.action.productDTO;
import com.store.action.Report;

import action.Action;
import action.ActionForward;
import action.Criteria;
import action.PageDTO;
import dao.boardDAO;
import dao.sellerDAO;
import dto.ReportDTO;
import dto.pagingDTO;
import dto.sellerDTO;


public class AdminService implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
			
			request.setCharacterEncoding("utf-8");
		
			ActionForward forward = new ActionForward();
			
			sellerDAO sdao = new sellerDAO();
			productDAO pdao = new productDAO();
			memberDAO mdao = new memberDAO();
			List<ReportDTO> rlist = sdao.getReportInfo();
			List<productDTO> plist = pdao.getProductList();
			List<sellerDTO> slist = sdao.getSellerInfo();
			List<memberDTO> mlist =	mdao.getMembersInfo();
			
			//페이징 부분
			String page = request.getParameter("page");
			Criteria cri;
			PageDTO pagedto;
			int numPerPage = 5;
			
			if(page != null){
				int nowPage = Integer.parseInt(request.getParameter("nowPage"));
				cri = new Criteria(nowPage, numPerPage);
				pagedto = new PageDTO(cri, rlist.size());
			}else{
				cri = new Criteria(numPerPage);
				pagedto = new PageDTO(cri, rlist.size());
			}
			
			request.setAttribute("mlist", mlist);
			request.setAttribute("rlist", rlist);
			request.setAttribute("slist", slist);
			request.setAttribute("plist", plist);
			request.setAttribute("p", pagedto);
			
	        forward.setRedirect(false);
	        forward.setPath("AdminService.jsp");
	        
	        return forward;	
	}
} 
