package net.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import db.memberDAO;
import db.memberDTO;
import db.sellerDTO;


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
	        sdto.setStore_c_num(Integer.parseInt(multipartRequest.getParameter("store_c_num")));
	        mdao.insertSeller(sdto);
	      
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
	        
	        
	        memberDTO mdto = mdao.getMemberInfo(id);
			session.setAttribute("member_code", mdto.getMember_code());
			
	        ActionForward forward = new ActionForward();
	        forward.setRedirect(false);
	        forward.setPath("Main.me");
	        
	        return forward;
	    }
}
