package com.store.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ReviewDAO;

@WebServlet("/insert_reply.do")
public class Insert_reply extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("utf-8");
		int review_num = Integer.parseInt(req.getParameter("review_num"));
		String reply_contents = req.getParameter("reply_contents");
		new ReviewDAO().insertReply(review_num, reply_contents);
	}
	
	
}
