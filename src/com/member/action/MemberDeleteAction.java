package com.member.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.memberDAO;

@WebServlet("/MemberDeleteAction")
public class MemberDeleteAction extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		dohandle(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		dohandle(request, response);
	}
	protected void dohandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("dd");
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
	    int member_num = (int) session.getAttribute("member_num");
		memberDAO mdao = new memberDAO();
		mdao.deletemember(member_num);
		
		response.sendRedirect("./login.jsp");
	}

}
