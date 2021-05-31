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
import dto.productDTO;

@WebServlet("/SelectList.do")
public class SelectProductList extends HttpServlet{

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
		String brand = request.getParameter("brand");
		int price1 = Integer.parseInt(request.getParameter("price1"));
		int price2 = Integer.parseInt(request.getParameter("price2"));

		
		
		
		boardDAO bdao = new boardDAO();
		List<categoryDTO> clist = bdao.getcategory(category_code1,category_code2);
		List<productDTO> plist = bdao.getProductList(category_code1, category_code2, category_code3, brand, price1, price2);
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
		for (int i=0; i<plist.size();i++) {
			productDTO pdto = (productDTO)plist.get(i);
			String product_img = pdto.getProduct_img();
			String product_name = pdto.getProduct_name();
			String category_name = pdto.getCategory_name();
			json+="{\"product_img\":\""+product_img+"\",\"category_name\":\""+category_name+"\",\"product_name\":\""+product_name+"\"}";
			if(i !=plist.size()-1) {
				json+=",";
			}
		}
		json +="]";
		response.setHeader("content-type", "application/json");
		out.print(json);
		out.flush();
		out.close();
	}
}
