package net.member.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.memberDAO;

@WebServlet("/Check")
public class Check extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		requestpro(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		requestpro(request, response);
	}

	protected void requestpro(HttpServletRequest request, HttpServletResponse response) 	throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		String command = request.getParameter("command");
		String param = null;
		int result = 0;

		memberDAO mdao = new memberDAO();
		if (command.equals("pw")) {
			param = request.getParameter("param");
			int member_num = (Integer.parseInt(request.getParameter("member_num")));
			result = mdao.deletemember(member_num);
			if (result == 1) {
				out.print("1");
			} else {
				out.print("0");
			}
		
				
			
			
		}
	}

}
