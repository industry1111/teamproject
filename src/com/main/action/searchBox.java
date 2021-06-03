package com.main.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.boardDAO;
import dto.categoryDTO;

@WebServlet("/searchBox")
public class searchBox extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String searchBox = request.getParameter("searchBox");
		System.out.println(searchBox);
		boardDAO bdao = new boardDAO();
		List<categoryDTO> clist = bdao.getcategory();

		String json = "[";
		for (int i = 0; i < clist.size(); i++) {
			categoryDTO cdto = (categoryDTO) clist.get(i);

			int category_code = cdto.getCategory_code();
			String category_name = cdto.getCategory_name();
			json += "{\"category_code\":\"" + category_code + "\",\"category_name\":\"" + category_name + "\"}";
			if (i != clist.size() - 1) {
				json += ",";
			}
		}

		json += "]||";
		PrintWriter out = response.getWriter();
		response.setHeader("content-type", "application/json");
		out.print(json);
		out.flush();
		out.close();
	}

}
