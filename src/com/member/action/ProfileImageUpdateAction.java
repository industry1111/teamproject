package com.member.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.sellerDAO;

@WebServlet("/ProfileImageUpdateAction")
public class ProfileImageUpdateAction extends HttpServlet{
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doProImgUpdate(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doProImgUpdate(request, response);
    }
    
    protected void doProImgUpdate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       
        
        System.out.println("dd");
        HttpSession session=request.getSession();
        String id = (String)session.getAttribute("id");
        int member_num = (int)session.getAttribute("member_num");
        
        String directory = request.getServletContext().getRealPath("/upload_profile/");
        int maxSize = 1024*1024*1024;
        
        MultipartRequest multipartRequest;
        multipartRequest = new MultipartRequest(request, directory, maxSize, "UTF-8", new DefaultFileRenamePolicy());
        
        
        System.out.println("업로드");
        sellerDAO sdao = new sellerDAO();
        String profile_img = multipartRequest.getFilesystemName("profile_img");
        sdao.updateProfile_img(profile_img, member_num);
        
        
        
        
    }
    

}
