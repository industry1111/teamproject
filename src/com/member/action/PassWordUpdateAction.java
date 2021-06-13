package com.member.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



@WebServlet("/PassWordUpdateAction")
public class PassWordUpdateAction extends HttpServlet{
    

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        requestPro(request, response);
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        requestPro(request, response);
    }
    protected void requestPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
                request.setCharacterEncoding("UTF-8");
                
                String id = request.getParameter("id");
                 
                memberDAO mdao = new memberDAO();
                memberDTO mdto = mdao.getMemberInfo(id);
                int member_num = mdto.getMember_num();
                
                String pw = request.getParameter("pw");
                mdao.updatePw(pw, member_num);
                
                response.sendRedirect("./MemberLogin.me");
    }
                    

}
