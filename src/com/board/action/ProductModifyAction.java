package com.board.action;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import db.boardDAO;
import db.productDTO;

public class ProductModifyAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		// 차량 주문 수정 페이지 CarConfirmUpdate.jsp에서 사용자로부터 넘어온 데이터를 입력

		request.setCharacterEncoding("utf-8");

		// 파일 변경 업로드(product_img_upload) 준비
		ServletContext context = request.getServletContext();
		String realpath = context.getRealPath("/product_img_upload");


		// 업로드 파일 크기
		int maxSize = 10 * 1024 * 1024;

		// multipart객체생성
		MultipartRequest multi = new MultipartRequest(request, realpath, maxSize, "UTF-8",
				new DefaultFileRenamePolicy());

		int product_num = Integer.parseInt(multi.getParameter("product_num"));
		productDTO pdto = new productDTO();
		pdto.setProduct_num(product_num);
		pdto.setProduct_name(multi.getParameter("product_name"));
		pdto.setProdcut_category(multi.getParameter("product_category"));
		pdto.setPrice(Integer.parseInt(multi.getParameter("price")));
		pdto.setCount(Integer.parseInt(multi.getParameter("count")));
		pdto.setBrand(multi.getParameter("brand"));
		pdto.setDescription(multi.getParameter("description"));
		pdto.setProduct_img(multi.getFilesystemName("product_img")); // 상품이미지 정보
																		// 처리

		boardDAO bdao = new boardDAO();// 데이터 베이스 객체 생성
		bdao.updateProduct(pdto);// 수정메소드 호출시 빈객체 전달하여 수정!

		response.setContentType("text/html; charset=UTF-8");

		request.setAttribute("center", "ProductModify.jsp");

		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("./ProductListAction.bo");
		return forward;
	}

}
