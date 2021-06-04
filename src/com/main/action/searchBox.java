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
import dto.searchDTO;

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
		response.setContentType("text/html;charset=utf-8");
		String searchBox = request.getParameter("searchBox");
		System.out.println(searchBox);
		boardDAO bdao = new boardDAO();
		List<searchDTO> searchlist = bdao.getSearchString(searchBox);

		String json = "[";
		for (int i = 0; i <7; i++) {
			
			searchDTO searchdto = (searchDTO) searchlist.get(i);
			String name = searchdto.getName();
			json += "{\"name\":\"" + name + "\"}";
			
			if(searchlist.size() == i+1){
				break;
			}
			if (i != 6) {
				json += ",";
			}
			
		}

		json += "]";
		System.out.println(json);
		PrintWriter out = response.getWriter();
		response.setHeader("content-type", "application/json");
		out.print(json);
		out.flush();
		out.close();
	}

}
