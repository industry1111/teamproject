package com.board.action;

import java.sql.Timestamp;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import db.boardDAO;
import db.productDTO;

public class ProductAddAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, 
						HttpServletResponse response)
	throws Exception{
		System.out.println("ProductAddAction execute()");
		
		//파일 업로드(product_img_upload) 준비
		ServletContext context = request.getServletContext();
		String realpath = context.getRealPath("/product_img_upload");
		System.out.println("realpath: " + realpath);
		
		//업로드 파일 크기
		int maxSize = 10 * 1024 * 1024;
		System.out.println("image size 출력됨");
		
		//multipart객체생성
		MultipartRequest multi = new MultipartRequest(
				request, realpath, maxSize, "UTF-8", new DefaultFileRenamePolicy()
				);
		System.out.println("M : 파일업로드완료" + multi);
		
		//상품 DAO
		boardDAO bDao = new boardDAO();
		//상품정보 저장
		productDTO pdto = new productDTO();
		
		pdto.setProduct_name(multi.getParameter("product_name"));
		pdto.setProdcut_category(multi.getParameter("prodcut_category"));
		pdto.setDescription(multi.getParameter("description"));
		pdto.setBrand(multi.getParameter("brand"));
		pdto.setPrice(Integer.parseInt(multi.getParameter("product_price")));
		pdto.setCount(Integer.parseInt(multi.getParameter("count")));
		pdto.setProduct_img(multi.getParameter("product_img"));
		// regdate 추가해야함
		
		//상품이미지 정보 처리
		String product_img = multi.getFilesystemName("file1");
		System.out.println("img정보" + product_img);
		
		//상품 DAO에서 insert불러오기
		bDao.insertProduct(pdto);
		
		
		//페이지 이동
		ActionForward forward=new ActionForward();
		
		forward.setRedirect(true);
		
		forward.setPath("./ProductList.bo");
		
		return forward;
	}
}
