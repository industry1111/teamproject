package com.main.action;

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
import dao.sellerDAO;
import dto.categoryDTO;
import dto.sellerDTO;

public class ProductList implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();

		boardDAO bdao = new boardDAO();
		sellerDAO sdao = new sellerDAO();
		productDAO pdao = new productDAO();
		List<categoryDTO> clist = bdao.getcategory();
		List<productDTO> plist = pdao.getProductList();
		List<sellerDTO> slist = sdao.getSellerInfo();
		// 페이징 부분
		String page = request.getParameter("page");
		Criteria cri;
		PageDTO pagedto;
		int numPerPage = 10;

		if (page != null) {
			int nowPage = Integer.parseInt(request.getParameter("nowPage"));
			cri = new Criteria(nowPage, numPerPage);
			pagedto = new PageDTO(cri, plist.size());
		} else {
			cri = new Criteria(numPerPage);
			pagedto = new PageDTO(cri, plist.size());
		}
		request.setAttribute("p", pagedto);
		request.setAttribute("clist", clist);
		request.setAttribute("plist", plist);
		request.setAttribute("slist", slist);
		ActionForward forward = new ActionForward();
		forward.setPath("index.jsp");
		forward.setRedirect(false);
		request.setAttribute("center", "main.jsp");
		return forward;
	}

}
