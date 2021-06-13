package com.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;

public class FindIdAfter implements Action{

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        
        request.setCharacterEncoding("UTF-8");
        
        memberDAO mdao = new memberDAO();
        String email = request.getParameter("email");
        
        String find_id = mdao.findId(email);
        request.setAttribute("find_id", find_id);
        System.out.println(find_id);
        ActionForward forward = new ActionForward();
        
        forward.setPath("findIdAfter.jsp");
        forward.setRedirect(false);
        
        return forward;
    }

}
