package com.order.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;



public class OrderFrontController extends HttpServlet{

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doProcess(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doProcess(request, response);
    }

    protected void doProcess(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String RequestURI = request.getRequestURI();
        String contextPath = request.getContextPath();
        String command = RequestURI.substring(contextPath.length());
        System.out.println(command);
        ActionForward forward = null;
        Action action = null;
     
        
        if(command.equals("/PaymentComplete.or")) {
            
            System.out.println("sss");
            
            action = new PaymentComplete();
            try {
                forward = action.execute(request, response);

            } catch (Exception e) {
                e.printStackTrace();
            }

        }
        
         if(forward!=null){ 
            if(forward.isRedirect()){//true -> sendRedirect()

                response.sendRedirect(forward.getPath());
                
            }else{//forward() 
                
                RequestDispatcher dispatcher=request.getRequestDispatcher(forward.getPath());
                dispatcher.forward(request, response);
            }
        }//if 
        
        
        
        
        
    }
    
    
    
    
}
