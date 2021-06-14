package com.board.action;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.member.action.memberDAO;
import com.order.action.OrderDetailDTO;

import action.Action;
import action.ActionForward;
import dao.ReviewDAO;
import dao.boardDAO;
import dao.sellerDAO;
import dto.reviewDTO;

public class StoreChart implements Action {
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		int member_num = (Integer)session.getAttribute("member_num");
		int store_num = new sellerDAO().getSellerInfo(member_num).getStore_num();
		
		ReviewDAO rdao = new ReviewDAO();
		List<reviewDTO> srlist = rdao.getStoreReviewList(store_num);
		
			
		String pattern = "yyyyMMdd";
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);

		String day = simpleDateFormat.format(new Date());
		int date = Integer.parseInt(day);
		List<OrderDetailDTO> olist = new boardDAO().getSalesRate(store_num, date);
		JSONArray count = new JSONArray();
		for(int i=0;i<olist.size();i++) {
			count.add(olist.get(i).getCount());
		}
		JSONArray total = new JSONArray();
		for(int i=0;i<olist.size();i++) {
			total.add(olist.get(i).getTotal());
		}
		
		request.setAttribute("count", count);
		request.setAttribute("total", total);
		request.setAttribute("srlist", srlist);
		request.setAttribute("center", "StoreChart.jsp");
		
		
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("mypage.jsp");
		return forward;
		
	}
}
