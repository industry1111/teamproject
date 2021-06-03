package com.order.action;

import java.sql.Timestamp;
import java.util.List;

import dto.basketDTO;



public class OrderDTO {
	
	private int	order_num; 
	private int member_num;
	private int total_price;
	private String order_name;
	private String order_email;
	private String order_phone;
	private String pay_method;
	private String state;
	private int store_num;
    Timestamp regdate;
    private String orders_code;
    private String receiver_addr1;
    private String receiver_addr2;
    private String receiver_addr3;
    private String receiver_name;
    private String receiver_phone;
    private String address_name;
    private List<basketDTO> ordersList;
    
  
}
