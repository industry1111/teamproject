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
    Timestamp regdate;
    private String orders_code;
    private String receiver_addr1;
    private String receiver_addr2;
    private String receiver_addr3;
    private String receiver_name;
    private String receiver_phone;
    private String address_name;
    private String receiver_msg;
    
    public String getReceiver_msg() {
        return receiver_msg;
    }
    public void setReceiver_msg(String receiver_msg) {
        this.receiver_msg = receiver_msg;
    }
    public int getOrder_num() {
        return order_num;
    }
    public void setOrder_num(int order_num) {
        this.order_num = order_num;
    }
    public int getMember_num() {
        return member_num;
    }
    public void setMember_num(int member_num) {
        this.member_num = member_num;
    }
    public int getTotal_price() {
        return total_price;
    }
    public void setTotal_price(int total_price) {
        this.total_price = total_price;
    }
    public String getOrder_name() {
        return order_name;
    }
    public void setOrder_name(String order_name) {
        this.order_name = order_name;
    }
    public String getOrder_email() {
        return order_email;
    }
    public void setOrder_email(String order_email) {
        this.order_email = order_email;
    }
    public String getOrder_phone() {
        return order_phone;
    }
    public void setOrder_phone(String order_phone) {
        this.order_phone = order_phone;
    }
    public String getPay_method() {
        return pay_method;
    }
    public void setPay_method(String pay_method) {
        this.pay_method = pay_method;
    }
    public String getState() {
        return state;
    }
    public void setState(String state) {
        this.state = state;
    }
    public Timestamp getRegdate() {
        return regdate;
    }
    public void setRegdate(Timestamp regdate) {
        this.regdate = regdate;
    }
    public String getOrders_code() {
        return orders_code;
    }
    public void setOrders_code(String orders_code) {
        this.orders_code = orders_code;
    }
    public String getReceiver_addr1() {
        return receiver_addr1;
    }
    public void setReceiver_addr1(String receiver_addr1) {
        this.receiver_addr1 = receiver_addr1;
    }
    public String getReceiver_addr2() {
        return receiver_addr2;
    }
    public void setReceiver_addr2(String receiver_addr2) {
        this.receiver_addr2 = receiver_addr2;
    }
    public String getReceiver_addr3() {
        return receiver_addr3;
    }
    public void setReceiver_addr3(String receiver_addr3) {
        this.receiver_addr3 = receiver_addr3;
    }
    public String getReceiver_name() {
        return receiver_name;
    }
    public void setReceiver_name(String receiver_name) {
        this.receiver_name = receiver_name;
    }
    public String getReceiver_phone() {
        return receiver_phone;
    }
    public void setReceiver_phone(String receiver_phone) {
        this.receiver_phone = receiver_phone;
    }
    public String getAddress_name() {
        return address_name;
    }
    public void setAddress_name(String address_name) {
        this.address_name = address_name;
    }
 
    
  
    
    
  
}
