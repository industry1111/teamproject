package com.board.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.member.action.memberDAO;

@WebServlet("/UpdateCheck")
public class UpdateCheck extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doUpdate(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doUpdate(request, response);
	}

	protected void doUpdate(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		String command = request.getParameter("command");
		String param = null;
		int result = 0;
		HttpSession session = request.getSession();
	    int member_num = (int) session.getAttribute("member_num");
	    
		memberDAO mdao = new memberDAO();

		if (command.equals("id")) {

			param = request.getParameter("param");

			result = mdao.idCheck(param);

			if (result == 0) {
				out.print("0");
			} else {
				out.print("1");
			}
		} else if (command.equals("pw")) {
			
			param = request.getParameter("param");
			result = mdao.pwCheck(param, member_num);
			if (result == 1) {
				out.print("1");
			} else {
				out.print("0");
			}
		} else if (command.equals("email")) {
			param = request.getParameter("param");
			result = mdao.emailCheck(param);
			if (result == 0) {
				out.print("0");
			} else {
				out.print("1");
			}
		} else if (command.equals("phone")) {
			param = request.getParameter("param");
			result = mdao.phoneCheck(param);
			if (result == 0) {
				out.print("0");
			} else {
				out.print("1");
			}
		}

	}

}
