package com.store.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.member.action.memberDAO;
import com.product.action.productDAO;
import com.product.action.productDTO;

import action.Action;
import action.ActionForward;
import action.Criteria;
import action.PageDTO;
import dao.ReviewDAO;
import dao.boardDAO;
import dao.sellerDAO;
import dto.brandDTO;
import dto.categoryDTO;
import dto.reviewDTO;
import dto.sellerDTO;

public class StoreProductDetail implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		
		String visit = request.getParameter("visit");
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		String user = "비회원";
		if(id != null){
			user = new memberDAO().getMemberInfo(id).getGender();
		}
		int product_num = Integer.parseInt(request.getParameter("product_num"));
		
		int member_num =0;
		if((String) session.getAttribute("id") != null){
			member_num = (int) session.getAttribute("member_num");
		}
		
		
		/*데이터베이스 자바빈 작업*/
		productDAO pdao = new productDAO();
		productDTO pdto = pdao.getStoreProductInfo(product_num);	
		int store_num = pdto.getStore_num();
		sellerDAO sdao = new sellerDAO();
		List<sellerDTO> slist = sdao.getSellerInfo();
		String template = sdao.getSellerTemplate(store_num);
		if(visit != null){
			sdao.visitorCount(user, store_num);
		}
		//카테고리 정보 받아오기
		boardDAO bdao = new boardDAO();
		List<categoryDTO> clist = bdao.getcategory();
		List<brandDTO> blist = bdao.getbrandList();

		//리뷰 리스트
		List<reviewDTO> rvlist = new ReviewDAO().getProductReviewList(product_num);
		
		//페이징
		String page = request.getParameter("page");
		Criteria cri;
		PageDTO pagedto;
		int numPerPage = 5;
						
		if(page != null){
			int nowPage = Integer.parseInt(request.getParameter("nowPage"));
			cri = new Criteria(nowPage, numPerPage);
			pagedto = new PageDTO(cri, rvlist.size());
		}else{
			cri = new Criteria(numPerPage);
			pagedto = new PageDTO(cri, rvlist.size());
		}

		request.setAttribute("member_num", member_num);

		request.setAttribute("p", pagedto);
		request.setAttribute("rvlist", rvlist);
		request.setAttribute("blist", blist);
		request.setAttribute("clist", clist);
		request.setAttribute("pdto", pdto);
		
		ActionForward forward = new ActionForward();
		
		request.setAttribute("center", "template"+template+"/product.jsp"); 
		forward.setRedirect(false);
		forward.setPath("index.jsp");
		return forward;
	}
	

}
