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
import dao.Mail;

public class NoticeAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		String member_code = (String)session.getAttribute("member_code");
		
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		int r_member_code = Integer.parseInt(request.getParameter("member_code"));
		
		memberDAO mdao = new memberDAO();
		List<memberDTO> list =	mdao.getMemberEmail(r_member_code);
	
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		for(int i=0; i<list.size(); i++){
			
			String address = list.get(i).getEmail();
			
			Mail mail = new Mail();
			mail.naverMailSend(subject, content, address);
			out.print(content);
		
		}

		ActionForward forward = new ActionForward();
		forward.setPath("AdminMain.ad?member_code="+member_code);
		forward.setRedirect(true);
		return forward;
	}

}
