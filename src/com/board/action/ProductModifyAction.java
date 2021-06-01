package com.board.action;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import action.Action;
import action.ActionForward;
import dao.boardDAO;
import dto.productDTO;

public class ProductModifyAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("utf-8");

		ServletContext context = request.getServletContext();
		String realpath = context.getRealPath("/product_img_upload");

		int maxSize = 10 * 1024 * 1024;

		MultipartRequest multi = new MultipartRequest(request, realpath, maxSize, "UTF-8",
				new DefaultFileRenamePolicy());
		
		productDTO pdto = new productDTO();
		pdto.setProduct_num(Integer.parseInt(multi.getParameter("product_num")));
		pdto.setProduct_name(multi.getParameter("product_name"));
		pdto.setCategory_name((multi.getParameter("category_name")));
		pdto.setProduct_price(Integer.parseInt(multi.getParameter("product_price")));
		pdto.setProduct_count(Integer.parseInt(multi.getParameter("product_count")));
		pdto.setProduct_brand(multi.getParameter("product_brand"));
		pdto.setProduct_description(multi.getParameter("product_description"));
		pdto.setProduct_img(multi.getFilesystemName("product_img")); // 상품이미지 정보 처리

		
		boardDAO bdao = new boardDAO();// 데이터 베이스 객체 생성
		bdao.updateProduct(pdto);// 수정메소드 호출시 빈객체 전달하여 수정!

		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("./ProductListAction.bo");
		return forward;
	}

}
