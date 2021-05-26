package net.member.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import db.memberDAO;

@WebServlet("/MemberUpdateAction")
public class MemberUpdateAction extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doMemberUpdate(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        doMemberUpdate(request, response);
    }
    
    protected void doMemberUpdate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		String command = request.getParameter("command");

		int member_num = (Integer.parseInt(request.getParameter("member_num")));
		
		memberDAO mdao = new memberDAO();
		
		
		if(command.equals("new_id")){
		    
			String id = request.getParameter("id");
			HttpSession session=request.getSession();
			session.setAttribute("id", id);
			mdao.updateID(id, member_num);
			
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
			
		}else if(command.equals("new_address")){
		    
		    String addr1 = request.getParameter("addr1");
		    String addr2 = request.getParameter("addr2");
		    String addr3 = request.getParameter("addr3");
		    mdao.updateAddr(addr1, addr2, addr3, member_num);
		}

	}

}
