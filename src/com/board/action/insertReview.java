package com.board.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import action.Action;
import action.ActionForward;
import dao.ReviewDAO;
import dto.reviewDTO;

public class insertReview implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		int member_num = (int) session.getAttribute("member_num");

		String directory = request.getServletContext().getRealPath("/upload_review/");
		int maxSize = 1024 * 1024 * 1024;

		MultipartRequest multipartRequest;
		multipartRequest = new MultipartRequest(request, directory, maxSize, "UTF-8", new DefaultFileRenamePolicy());

		ReviewDAO rvdao = new ReviewDAO();
		int product_num = Integer.parseInt(multipartRequest.getParameter("product_num"));
		
		int order_detail_num = Integer.parseInt(multipartRequest.getParameter("order_detail_num"));
		System.out.println("order_detail_num: "+order_detail_num);
		
	
		
		
		reviewDTO rvdto = new reviewDTO();
		rvdto.setMember_num(member_num);
		rvdto.setProduct_num(product_num);
		rvdto.setRating1(Integer.parseInt(multipartRequest.getParameter("rating1")));
		rvdto.setRating2(Integer.parseInt(multipartRequest.getParameter("rating2")));
		rvdto.setRating3(Integer.parseInt(multipartRequest.getParameter("rating3")));
		rvdto.setReview_content(multipartRequest.getParameter("textarea"));
		rvdto.setReview_img(multipartRequest.getFilesystemName("profile_img"));
		rvdto.setStore_num(Integer.parseInt(multipartRequest.getParameter("store_num")));
		System.out.println(multipartRequest.getParameter("review_content"));
		
		rvdao.insertReview(rvdto, order_detail_num);

		ActionForward forward = new ActionForward();
		forward.setPath("close.jsp");
		forward.setRedirect(true);
		return forward;
	}

}
