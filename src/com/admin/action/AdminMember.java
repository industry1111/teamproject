package com.admin.action;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.member.action.memberDAO;
import com.member.action.memberDTO;

import action.Action;
import action.ActionForward;
import action.Criteria;
import action.PageDTO;
import dao.boardDAO;
import dto.pagingDTO;


public class AdminMember implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
			
			request.setCharacterEncoding("utf-8");
			
			HttpSession session = request.getSession();
			String member_code = (String) session.getAttribute("member_code");
			
			
			
			if(!member_code.equals("8")){
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out=response.getWriter();
				out.println("<script>");
				out.println("alert('접근권한이 없습니다.');");
				out.println("history.back();");
				out.println("</script>");
				out.close();
				return null;
			}
			
			
			
			ActionForward forward = new ActionForward();
			//회원정보를 가지고온다.
			List<memberDTO> list = new memberDAO().getMembersInfo();
			//회원정보를 전달하기 위해 
			
			
			//페이징 부분
			String page = request.getParameter("page");
			Criteria cri;
			PageDTO pagedto;
			int numPerPage = 5;
			
			if(page != null){
				int nowPage = Integer.parseInt(request.getParameter("nowPage"));
				cri = new Criteria(nowPage, numPerPage);
				pagedto = new PageDTO(cri, list.size());
			}else{
				cri = new Criteria(numPerPage);
				pagedto = new PageDTO(cri, list.size());
			}
			
			request.setAttribute("list", list);
			request.setAttribute("p", pagedto);
	       
	        forward.setPath("AdminMember.jsp");
	        forward.setRedirect(false);
 
	        return forward;	
	}

	
}
