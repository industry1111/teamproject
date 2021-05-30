package com.board.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.boardDAO;
import dto.pagingDTO;
import dto.productDTO;

public class ProductListAction implements Action {
	
	@Override
	public ActionForward execute(HttpServletRequest request, 
			HttpServletResponse response) throws Exception {

		HttpSession session = request.getSession();
		int member_num = (Integer) session.getAttribute("member_num");
		
		pagingDTO param = new pagingDTO();
		if(request.getParameter("pageNum")!=null) {
			param.setPageNum(request.getParameter("pageNum"));
		}else {
			param.setPageNum("1");
		}
		param.setPageSize(12);
		
		//AdminGoodsDAO객체 생성 후 getGoodsList()생성
		boardDAO bDao = new boardDAO();
		List<productDTO> list = bDao.getProductList(member_num, param);
		
//		param.setCount(bDao.getProductCount());
		param.setCurrentPage(Integer.parseInt(param.getPageNum()));
		System.out.println("=>>>>>>>>>>>>>1111  여기 ");
		param.setStartRow((param.getCurrentPage()-1 ) * param.getPageSize());
//		System.out.println(param.getCount() + " count / " + param.getStartPage() + "startpage() / " + param.getCurrentPage() + " currentPage() ");

		System.out.println("=>>>>>>>>>>>>>2222222222  여기 ");

		//requset영역에 저장
		request.setAttribute("list", list);
		request.setAttribute("center", "ProductList.jsp");
		request.setAttribute("param", param);
		ActionForward forward = new ActionForward();
		//페이지이동(뷰페이지로이동)
		forward.setPath("mypage.jsp");
		forward.setRedirect(false);	
		System.out.println("=>>>>>>>>>>>>>333333333 여기 ");
		return forward;
	}
}