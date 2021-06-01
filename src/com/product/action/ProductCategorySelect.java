package com.product.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.boardDAO;
import dto.brandDTO;
import dto.categoryDTO;

@WebServlet("/ProductCategorySelect.pr")
public class ProductCategorySelect extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		PrintWriter out = response.getWriter();
		
		int category_code1 = Integer.parseInt(request.getParameter("category_code1"));
		int category_code2 = Integer.parseInt(request.getParameter("category_code2"));
		int category_code3 = Integer.parseInt(request.getParameter("category_code3"));
		
		
		boardDAO bdao = new boardDAO();
		List<categoryDTO> clist = bdao.getcategory(category_code1,category_code2);
		List<brandDTO> blist = bdao.getbrandList(category_code2);
		String json = "[";
		for (int i=0; i<clist.size();i++) {
			categoryDTO cdto = (categoryDTO)clist.get(i);
			int category_code = cdto.getCategory_code();
			String category_name= cdto.getCategory_name();
			json+="{\"category_code\":\""+category_code+"\",\"category_name\":\""+category_name+"\"}";
			if(i !=clist.size()-1) {
				json+=",";
			}
		}
		json +="]||[";
		for (int i=0; i<blist.size(); i++){
			brandDTO bdto = (brandDTO)blist.get(i);
			int brand_num = bdto.getBrand_num();
			String brand_name = bdto.getBrand_name();
		
		json +="{\"brand_num\":\""+brand_num
				+"\",\"brand_name\":\""+brand_name+"\"}";
			
		if(i !=blist.size()-1){
			json+= ",";
			}
			
		}
		json +="]"; System.out.println(json);
		response.setHeader("content-type", "application/json");
		out.print(json);
		out.flush();
		out.close();
	}
}
