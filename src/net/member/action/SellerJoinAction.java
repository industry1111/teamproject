package net.member.action;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import db.memberDAO;
import db.memberDTO;
import db.sellerDTO;

public class SellerJoinAction extends HttpServlet implements Action{
	  @Override
	    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
	        
		  System.out.print("SellerJoinAction execute()");
	      
		  	//세션객체 생성
			HttpSession session=request.getSession();
			
			String directory = getServletContext().getRealPath("upload_profile/");
			System.out.println(directory);
			int maxSize = 1024*1024*1024;
			
			MultipartRequest multipartRequest;
			multipartRequest = new MultipartRequest(request, directory, maxSize, "UTF-8", new DefaultFileRenamePolicy());
			
			
			
	        sellerDTO sd = new sellerDTO();
	        sd.setStore_name(multipartRequest.getParameter("setsote_name"));
	        sd.setProfile_img(multipartRequest.getParameter("profile_img"));
	        sd.setTemplate(multipartRequest.getParameter("settemplate"));
	        sd.setAccount(multipartRequest.getParameter("account"));
	        
	        /*
	        //회원가입 성공 여부를 담을 변수 선언
			boolean result = false;
			
			memberDAO mdao=new memberDAO();
			
			//회원가입 내용을 담고 있는 mb객체를 전달하여..
			//가입에 성공하면 true리턴, 실패하면 false리턴
			result = mdao.insertSeller(sd);
		
			//회원 가입 처리에 실패 했을 경우 null을 반환 한다.
			if(result == false){
				System.out.println("판매자 전환 실패");
				return null;
			}
	        */
	        
	        
	        
	        ActionForward forward = new ActionForward();
	        forward.setRedirect(true);
	        forward.setPath("main.me");
	        
	        return forward;
	    }
}
