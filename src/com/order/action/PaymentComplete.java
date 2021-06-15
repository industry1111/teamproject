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
            
            
            int member_num = (int) session.getAttribute("member_num");
            int count = Integer.parseInt(request.getParameter("count"));
            String id = (String) session.getAttribute("id");
            
          //주문번호(orderId) 생성을 위한 로직
            Calendar cal = Calendar.getInstance();
            int year = cal.get(Calendar.YEAR);
            String ym = year + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
            String ymd = ym +  new DecimalFormat("00").format(cal.get(Calendar.DATE));
            String subNum = "";
            
            for(int i = 1; i <= 6; i ++) {
             subNum += (int)(Math.random() * 10);
            }
            
            String orders_code = ymd + subNum; 

            
            OrderDTO odto = new OrderDTO();
            OrderDetailDTO od_dto = new OrderDetailDTO();
            OrderDAO odao = new OrderDAO();
            
            
            odto.setOrders_code(orders_code);
            odto.setMember_num(member_num);
            odto.setOrder_id(id);
            odto.setAddress_name(request.getParameter("address_name"));
            odto.setReceiver_addr1(request.getParameter("receiver_addr1"));
            odto.setReceiver_addr2(request.getParameter("receiver_addr2"));
            odto.setReceiver_addr3(request.getParameter("receiver_addr3"));
            odto.setReceiver_name(request.getParameter("receiver_name"));
            odto.setReceiver_phone(request.getParameter("receiver_phone"));
            odto.setOrder_email(request.getParameter("order_email"));
            odto.setOrder_name(request.getParameter("order_name"));
            odto.setOrder_phone(request.getParameter("order_phone"));
            odto.setTotal_price(Integer.parseInt(request.getParameter("price_total")));
            odto.setReceiver_msg(request.getParameter("receiver_msg"));
            odto.setMain_product_image(request.getParameter("image0"));
            odto.setMain_product_name(request.getParameter("product_name0"));
            odto.setCount(count);
            
            odao.insertOrder(odto);

            for(int i=0; i<=count; i++){
            	
            	 od_dto.setOrders_code(odto.getOrders_code());
            	 od_dto.setProduct_name(request.getParameter("product_name"+i));
            	 od_dto.setProduct_num(Integer.parseInt(request.getParameter("product_num"+i)));
            	 od_dto.setProduct_price(Integer.parseInt(request.getParameter("price"+i)));
            	 od_dto.setQuantity(Integer.parseInt(request.getParameter("quantity"+i)));
            	 od_dto.setStore_num(Integer.parseInt(request.getParameter("store_num"+i)));
            	 od_dto.setImage(request.getParameter("image"+i));
            	 odao.insertOrderDetail(od_dto);
            	 odao.deleteBasket(Integer.parseInt(request.getParameter("basket_num"+i)));
            	
            }
            
            
            ActionForward forward=new ActionForward();
            forward.setRedirect(true);
            
            forward.setPath("close2.jsp"); 

            return forward;
        }

}
