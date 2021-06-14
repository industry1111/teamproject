package com.store.action;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.member.action.memberDAO;
import com.member.action.memberDTO;
import com.product.action.productDAO;
import com.product.action.productDTO;

import action.Action;
import action.ActionForward;
import dao.boardDAO;
import dao.sellerDAO;
import dto.categoryDTO;
import dto.sellerDTO;

public class ReportLoginAction implements Action{

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
        
        //report
        int product_num = Integer.parseInt(request.getParameter("product_num"));
     
        sellerDAO sdao = new sellerDAO();
        productDAO pdao = new productDAO();
        productDTO pdto = pdao.getProductInfo(product_num);
        sellerDTO sdto = sdao.getSellerInfo(pdto.getMember_num());
        List<categoryDTO> clist = new boardDAO().getcategory();
        
        request.setAttribute("sdto", sdto);
        request.setAttribute("pdto", pdto);
        request.setAttribute("clist", clist);
        
        ActionForward forward=new ActionForward();
 
        forward.setRedirect(false);
        forward.setPath("./report.jsp?member_num="+mdto.getMember_num());
        
            
        return forward;
    }

}
