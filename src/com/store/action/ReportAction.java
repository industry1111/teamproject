package com.store.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import action.ActionForward;
import dao.sellerDAO;
import dto.ReportDTO;

public class ReportAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
	    request.setCharacterEncoding("UTF-8");
	
	    System.out.println("ReportAction");
	    
	    HttpSession session = request.getSession();
	    
	    int member_num = (int) session.getAttribute("member_num"); //신고한 사람 member_num
	    int store_num = Integer.parseInt(request.getParameter("store_num"));
	    int product_num = Integer.parseInt(request.getParameter("product_num"));
	    String reportDetail = request.getParameter("reportDetail"); 
	    String detailText = request.getParameter("detailText");
	    
	    System.out.println("member_num : " + member_num);
	    System.out.println("store_num : " + store_num);
	    System.out.println("product_num : " + product_num);
	    System.out.println("reportDetail : " + reportDetail);
	    System.out.println("detailText : " + detailText);
	    
	    ReportDTO dto = new ReportDTO();
	    
	    dto.setStore_num(store_num);
	    dto.setProduct_num(product_num);
	    dto.setReportDetail(reportDetail);
	    dto.setDetailText(detailText);
	    dto.setMember_num(member_num);
	    
	    sellerDAO sdao = new sellerDAO();
	    sdao.insertReport(dto);
	    
	    ActionForward forward = new ActionForward();
	    forward.setPath("close.jsp");
	    forward.setRedirect(false);
	    
		return forward;
	}

}
