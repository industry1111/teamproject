package com.order.action;


import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import action.ActionForward;


public class PaymentComplete implements Action{

        @Override
        public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
            
            
            request.setCharacterEncoding("UTF-8");
            
            HttpSession session = request.getSession();
            
            System.out.println( "ddd");
            
            int member_num = (int) session.getAttribute("member_num");
            
          //주문번호(orderId) 생성을 위한 로직
            Calendar cal = Calendar.getInstance();
            int year = cal.get(Calendar.YEAR);
            String ym = year + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
            String ymd = ym +  new DecimalFormat("00").format(cal.get(Calendar.DATE));
            String subNum = "";
            
            for(int i = 1; i <= 6; i ++) {
             subNum += (int)(Math.random() * 10);
            }
            
            String orders_code = ymd + "_" + subNum; //ex) 20200508_373063

            
            OrderDTO odto = new OrderDTO();
            OrderDetailDTO odsdto = new OrderDetailDTO();
            
            odto.setOrders_code(orders_code);
            odto.setMember_num(member_num);
            odto.setAddress_name(request.getParameter("address_name"));
            odto.setReceiver_addr1(request.getParameter("receiver_addr1"));
            odto.setReceiver_addr2(request.getParameter("receiver_addr2"));
            odto.setReceiver_addr3(request.getParameter("receiver_addr3"));
            odto.setReceiver_name(request.getParameter("receiver_name"));
            odto.setReceiver_phone(request.getParameter("receiver_phone"));
            odto.setOrder_email(request.getParameter("order_email"));
            odto.setOrder_name(request.getParameter("order_name"));
            odto.setOrder_phone(request.getParameter("order_phone"));
            odto.setTotal_price(Integer.parseInt(request.getParameter("total_price")));
            odto.setReceiver_msg(request.getParameter("receiver_msg"));
//            odto.setPay_method(pay_method);
            

            
            ActionForward forward=new ActionForward();
            forward.setRedirect(false);
            
            forward.setPath("mypage.jsp"); 
            request.setAttribute("center", "payment_success.jsp");
            
            
            
            return forward;
        }

	

}
