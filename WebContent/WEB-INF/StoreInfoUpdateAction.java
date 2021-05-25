package com.store;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.member.memberDAO;

@WebServlet("/StoreInfoUpdate")
public class StoreInfoUpdateAction extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		requestPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		requestPro(request, response);
	}
	protected void requestPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");

		String command = request.getParameter("command");
		PrintWriter out = response.getWriter();
		memberDAO mdao = new memberDAO();
		String param = null;
		int check =0;
		if(command.equals("store_id")) {
			param = request.getParameter("param");
			check = mdao.idCheck(param);
			if(check == 0 ){
				out.print("사용가능한 스토어명입니다.");
			}else if(check == 1){
				out.print("중복된 스토어명입니다.");
			}
		}
	}
}
