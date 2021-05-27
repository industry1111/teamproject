package com.board.action;

import java.sql.Timestamp;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import db.boardDAO;
import db.productDTO;

public class ProductAddAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, 
						HttpServletResponse response)
	throws Exception{

		request.setCharacterEncoding("UTF-8");
		//파일 업로드(product_img_upload) 준비
		ServletContext context = request.getServletContext();
		String realpath = context.getRealPath("/product_img_upload");
		
		HttpSession session = request.getSession();
		int member_num = (Integer)session.getAttribute("member_num");

		//업로드 파일 크기
		int maxSize = 10 * 1024 * 1024;

		//multipart객체생성
		MultipartRequest multi = new MultipartRequest(
				request, realpath, maxSize, "UTF-8", new DefaultFileRenamePolicy()
				);
		

		//상품정보(DTO) 저장
		productDTO pdto = new productDTO();
		
		pdto.setMember_num(member_num);
		pdto.setProduct_name(multi.getParameter("product_name"));
		pdto.setProdcut_category(multi.getParameter("prodcut_category"));
		pdto.setDescription(multi.getParameter("description"));
		pdto.setBrand(multi.getParameter("brand"));
		pdto.setPrice(Integer.parseInt(multi.getParameter("price")));
		pdto.setCount(Integer.parseInt(multi.getParameter("count")));
		// regdate 추가해야함
		
		//상품이미지 정보 처리
		String product_img = multi.getFilesystemName("product_img");
		pdto.setProduct_img(product_img);
		
		
		//insertProduct 메소드 생성
		boardDAO bDao= new boardDAO();
		bDao.insertProduct(pdto);
		
		//페이지 이동
		ActionForward forward=new ActionForward();
		
		forward.setRedirect(true);
		
		forward.setPath("./ProductListAction.bo");
		
		return forward;
	}
}
