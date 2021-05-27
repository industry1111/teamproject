package com.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.memberDAO;
import dto.memberDTO;
import dto.sellerDTO;


public class SellerJoinAction implements Action{
	  @Override
	    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
	        
		  System.out.println("SellerJoinAction execute()");
	      
		  	//세션객체 생성
			HttpSession session=request.getSession();
			String id = (String)session.getAttribute("id");
			
			
			String directory = request.getServletContext().getRealPath("/upload_profile/");
			System.out.println(directory);
			int maxSize = 1024*1024*1024;
			
			MultipartRequest multipartRequest;
			multipartRequest = new MultipartRequest(request, directory, maxSize, "UTF-8", new DefaultFileRenamePolicy());
			
			memberDAO mdao = new memberDAO();
			int member_num = mdao.getMemberNum(id);
			 
			System.out.println(multipartRequest.getFilesystemName("profile_img"));
	        sellerDTO sdto = new sellerDTO();
	        sdto.setStore_name(multipartRequest.getParameter("store_name"));
	        sdto.setProfile_img(multipartRequest.getFilesystemName("profile_img"));
	        
	        sdto.setTemplate(multipartRequest.getParameter("template"));
	        sdto.setAccount(multipartRequest.getParameter("account"));
	        sdto.setMember_num(member_num);
	        sdto.setCategory_num(Integer.parseInt(multipartRequest.getParameter("category_num")));
	        mdao.insertSeller(sdto);
	        
	        memberDTO mdto = mdao.getMemberInfo(id);
			session.setAttribute("member_code", mdto.getMember_code());
			
	        ActionForward forward = new ActionForward();
	        forward.setRedirect(false);
	        forward.setPath("Main.me");
	        
	        return forward;
	    }
}
