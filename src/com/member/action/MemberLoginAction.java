package com.member.action;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.store.action.Store_likeDTO;

import action.Action;
import action.ActionForward;
import dao.sellerDAO;


public class MemberLoginAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		//login.jsp에서 사용자가 입력한 id와 pass 파라미터 가져오기
		String id=request.getParameter("id");
		String pass=request.getParameter("pw");
		
		//DB작업 객체 생성
		memberDAO mdao=new memberDAO();
		
		int check=mdao.userCheck(id, pass);
		

		if(check==0){
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.println("<script>");
			out.println("alert('아이디 또는 비밀번호틀림');");
			out.println("history.back();");
			out.println("</script>");
			out.close();
			return null;
		
		// check==-1 "아이디없음" 뒤로이동	
		}else if(check==-1){
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.println("<script>");
			out.println("alert('아이디없음');");
			out.println("history.back();");
			out.println("</script>");
			out.close();
			return null;	
		}
		

		//세션객체 생성
		HttpSession session=request.getSession();
		
		//login.jsp 화면에서 입력한 아이디를 세션객체영역에 저장
		session.setAttribute("id", id);
		 
		memberDTO mdto = mdao.getMemberInfo(id);
		session.setAttribute("member_num", mdto.getMember_num());
		session.setAttribute("member_code", mdto.getMember_code());
		sellerDAO sdao = new sellerDAO();
		
		List<Store_likeDTO> jlist = sdao.getStore_like(mdto.getMember_num());
		
		request.setAttribute("jlist", jlist);
		request.setAttribute("member_num", mdto.getMember_num());
//		System.out.println(jlist.size());
//		System.out.println(jlist.get(0).getStore_num());
		ActionForward forward=new ActionForward();
		System.out.println(id);
		//페이지 이동 방식 여부 값 true로 저장  
		//true sendRedirect() <-이방식은 이동할 페이지 주소 경로 노출 함.	
		if(id.equals("gudrb2640")){
			forward.setRedirect(false);
			forward.setPath("/AdminMain.ad");
		}else{
			forward.setRedirect(true);
			forward.setPath("./Main.main");
		}
		 	
		return forward;
	}
}

