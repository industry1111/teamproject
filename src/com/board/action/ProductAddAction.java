package com.board.action;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.boardDAO;
import dto.productDTO;

public class ProductAddAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, 
						HttpServletResponse response)
	throws Exception{
		System.out.println("ProductAddAction execute()");

		request.setCharacterEncoding("UTF-8");
		ServletContext context = request.getServletContext();
		String realpath = context.getRealPath("/product_img_upload");
		
		HttpSession session = request.getSession();
		int member_num = (Integer)session.getAttribute("member_num");

		int maxSize = 10 * 1024 * 1024;
		System.out.println("image size 출력됨");

		MultipartRequest multi = new MultipartRequest(
				request, realpath, maxSize, "UTF-8", new DefaultFileRenamePolicy()
				);
		System.out.println("M : 파일업로드완료" + multi);
		

		productDTO pdto = new productDTO();
		
		pdto.setMember_num(member_num);
		pdto.setProduct_name(multi.getParameter("product_name"));
		pdto.setCategory_num(Integer.parseInt(multi.getParameter("category_num")));
		pdto.setProduct_description(multi.getParameter("product_description"));
		pdto.setProduct_brand(multi.getParameter("product_brand"));
		pdto.setProduct_price(Integer.parseInt(multi.getParameter("product_price")));
		pdto.setProduct_count(Integer.parseInt(multi.getParameter("product_count")));
		// regdate 추가해야함
		
		//상품이미지 정보 처리
		String product_img = multi.getFilesystemName("product_img");

		pdto.setProduct_img(product_img);
		
		
		boardDAO bDao= new boardDAO();
		bDao.insertProduct(pdto);
		
		ActionForward forward=new ActionForward();
		
		forward.setRedirect(true);
		
		forward.setPath("./ProductListAction.bo");
		
		return forward;
	}
}
