package dao;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/FindPassWordMail")
public class FindPassWordMail extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		dohandle(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		dohandle(request, response);
	}
	protected void dohandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		String address = request.getParameter("address");
		String title ="modoo?에서 보낸 임시 비밀번호입니다.";
		int num = (int)( (Math.random())*1000000);
		char ch=0;
		for (int i = 1; i <= 3; i++) {
		      ch = (char) ((Math.random() * 26) + 97);
		}
		
		String text = Character.toString(ch) + Integer.toString(num);
		System.out.println(text);
		if(text.length()==5) {
			text = "0"+text;
		}
		Mail mail = new Mail();
		mail.naverMailSend(title, text, address);
		out.print(text);
	}
}
