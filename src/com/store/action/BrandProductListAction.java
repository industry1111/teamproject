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
import dao.boardDAO;
import dao.sellerDAO;
import dto.brandDTO;
import dto.pagingDTO;
import dto.sellerDTO;

public class BrandProductListAction implements Action {
	
	@Override
	public ActionForward execute(HttpServletRequest request, 
			HttpServletResponse response) throws Exception {
		
		String visit = request.getParameter("visit");
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		String user = "비회원";
		if(id != null){
			user = new memberDAO().getMemberInfo(id).getGender();
		}
		int store_num = Integer.parseInt(request.getParameter("store_num"));
		productDAO pdao = new productDAO();
		sellerDAO sdao = new sellerDAO();
		boardDAO bdao = new boardDAO();
		
		String brand = request.getParameter("brand");
		List<productDTO> list = pdao.getProductInfo(store_num, brand);	
		List<productDTO> plist = pdao.getStoreInfo(store_num);
		String template = sdao.getSellerTemplate(store_num);
		if(visit != null){
			sdao.visitorCount(user, store_num);
		}
		
		int member_num = list.get(0).getMember_num();
		List<brandDTO> blist = bdao.getStorebrandList(member_num);
		
		//페이징 부분
		String page = request.getParameter("page");
		Criteria cri;
		PageDTO pagedto;
		int numPerPage = 10;
		
		if(page != null){
			int nowPage = Integer.parseInt(request.getParameter("nowPage"));
			cri = new Criteria(nowPage, numPerPage);
			pagedto = new PageDTO(cri, list.size());
		}else{
			cri = new Criteria(numPerPage);
			pagedto = new PageDTO(cri, list.size());
		}
		
		
		//requset영역에 저장
		request.setAttribute("brand", brand);
		request.setAttribute("list", list);
		request.setAttribute("plist", plist);
		request.setAttribute("p", pagedto);
		request.setAttribute("blist", blist);
		request.setAttribute("store_num", store_num);
		//member_num에 해당하는 상품 스토어 리스트 페이지로 이동
		ActionForward forward = new ActionForward();
		//페이지이동(뷰페이지로이동)
		forward.setPath("index.jsp");
		forward.setRedirect(false);
		request.setAttribute("center", "template"+template+"/shop2.jsp");

		return forward;
	}
}