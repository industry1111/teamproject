package com.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import action.ActionForward;

public class MemberInfo implements Action{

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        
        HttpSession session = request.getSession();
        
        String id = (String) session.getAttribute("id");
        
        
        memberDTO mdto = new memberDAO().getMemberInfo(id);
        request.setAttribute("mdto", mdto);
        request.setAttribute("center", "MemberUpdate.jsp");
        
        ActionForward forward = new ActionForward();
        forward.setRedirect(false);
        forward.setPath("mypage.jsp");
        request.setAttribute("center", "MemberUpdate.jsp");
        
       
        
        return forward;
    }

}
