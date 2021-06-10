package com.board.action;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.order.action.OrderDAO;
import com.order.action.OrderDTO;
import com.order.action.OrderDetailDTO;
import com.product.action.productDAO;
import com.product.action.productDTO;

import action.Action;
import action.ActionForward;
import action.Criteria;
import action.PageDTO;
import dao.ReviewDAO;
import dto.reviewDTO;

public class WritableReviewsAction implements Action{

	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("WritableReviewAction execute");


		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		int member_num = (Integer)session.getAttribute("member_num");
		
		reviewDTO rvdto = new ReviewDAO().getReviewInfo(member_num);
		int product_num = rvdto.getProduct_num();
		//OrderDTO odto = new OrderDTO();
		OrderDAO odao = new OrderDAO();
		//String orders_code = odto.getOrders_code();
		
		List<OrderDTO> odlist = odao.getOrderInfo(member_num);
		//List<OrderDetailDTO> oddlist = odao.getOrderDetail(orders_code);
		
		
		for(int i=0; i<odlist.size(); i++){
//			OrderDTO odto =  new OrderDTO();
//			odto.setOrders_code(odlist.get(i).getOrders_code());
			
			OrderDTO odto=(OrderDTO)odlist.get(i);
			String Orders_code= odto.getOrders_code();
		} 
		
		
		
	
		productDAO pdao = new productDAO();
		List<productDTO> pdlist = pdao.getProductList(product_num);
//		OrderDTO odto = new OrderDAO().getOrder(orders_code);
//		int orders_code = odto.getOrders_code();
//		List<String> order = request.getParameter(order);
	
	
	
	
//		OrderDAO odao = new OrderDAO();
//		ReviewDAO rdao = new ReviewDAO();
		
		
//		String orders_code =request.getParameter("orders_code");
//		int product_num = Integer.parseInt(request.getParameter("product_num"));
//		
//		List<reviewDTO> rlist = rdao.getReviewList(member_num);
//		List<OrderDetailDTO> odlist = odao.getOrderDetail(orders_code);
		
		
		System.out.println(odlist.size());
		request.setAttribute("odlist", odlist);
	
		request.setAttribute("pdlist", pdlist);
		//페이징 부분
		String page = request.getParameter("page");
		Criteria cri;
		PageDTO pagedto;
		int numPerPage = 5;
		
		if(page != null){
			int nowPage = Integer.parseInt(request.getParameter("nowPage"));
			cri = new Criteria(nowPage, numPerPage);
			pagedto = new PageDTO(cri, odlist.size());
		}else{
			cri = new Criteria(numPerPage);
			pagedto = new PageDTO(cri, odlist.size());
		}
		
		request.setAttribute("p", pagedto);
	
		
		request.setAttribute("center", "writableReviews.jsp");
		ActionForward forward = new ActionForward();
		forward.setPath("mypage.jsp");
		forward.setRedirect(false);
		return forward;
	}

	
}
