package net.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class StoreGetInfoAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		
		int member_num = Integer.parseInt(request.getParameter("num"));
		//해당하는 멤버 번호의 템플릿 번호를 가져오고 ㄴ
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(false);
		forward.setPath("asd");

		return  forward;
	}

}
