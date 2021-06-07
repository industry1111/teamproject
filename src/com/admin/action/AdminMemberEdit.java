package com.admin.action;

//1) '수정하기'를 클릭하면 컨트롤러에 요청한다.
//2) 컨트롤러는 전송된 회원 정보를 가져온 후 테이블에서 회원정보를 수정한다.
//3) 수정을 마친 후 컨트롤러는 회원목록을 보여준다.
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.member.action.memberDAO;
import com.member.action.memberDTO;

import action.Action;
import action.ActionForward;

public class AdminMemberEdit extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	AdminMemberEdit(request, response);
    }
    
	@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	AdminMemberEdit(request, response);
    }
	
	private ActionForward AdminMemberEdit(HttpServletRequest request, HttpServletResponse response) {

		ActionForward forward = new ActionForward();
		
		List<memberDTO> list = new memberDAO().getMembersInfo();

		int member_num = (Integer.parseInt(request.getParameter("member_num")));
		
		
		request.setAttribute("list", list);
		forward.setRedirect(false);
        forward.setPath("AdminMember.jsp");

        return forward;	

	}
}	


	