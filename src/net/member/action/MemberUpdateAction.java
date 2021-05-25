package net.member.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.member.memberDAO;

@WebServlet("/MemberUpdateAction")
public class MemberUpdateAction extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doUpdate(request,response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doUpdate(request,response);
	}
	
	protected void doUpdate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		String command = request.getParameter("command");
		String param = null;
		int result = 0;
		int member_num = (Integer.parseInt(request.getParameter("member_num")));
		
		memberDAO mdao = new memberDAO();
		
		
		if(command.equals("new_id")){
			param = request.getParameter("param");
			HttpSession session = request.getSession();
			
		}else if(command.equals("new_pw")){
			
			String pw = request.getParameter("pw");
			mdao.updatePw(pw, member_num);
			
		}else if(command.equals("new_email")){
			
			String email = request.getParameter("email");
			mdao.updateEmail(email, member_num);
			
		}else if(command.equals("new_phone")){
			
			String phone = request.getParameter("phone");
			mdao.updatePhone(phone, member_num);
			
		}else if(command.equals("new_name")){
			
			String name = request.getParameter("name");
			mdao.updateName(name, member_num);
		}
		
		
		
		
	}
	
	
	
}
