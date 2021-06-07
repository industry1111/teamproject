package com.order.action;

import java.sql.Timestamp;

public class StoreOrderDTO {
	
	 private int quantity;
	 private int product_num;
	 private int product_price;
	 private String product_name;
	 private String image;
	 private String orders_code;
	 private int store_num;
	 private String state;
	 private int	order_num; 
	 private int member_num;
	 private int total_price;
	 private String order_name;
	 private String order_email;
	 private String order_phone;
	 private String pay_method;
	 Timestamp regdate;
	 private String receiver_addr1;
	 private String receiver_addr2;
	 private String receiver_addr3;
	 private String receiver_name;
	 private String receiver_phone;
	 private String address_name;
	 private String receiver_msg;
	 private String main_product_image;
	 private String main_product_name;
	 private int count;
	 private String order_id;
	 
	public String getOrder_id() {
		return order_id;
	}
	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public int getProduct_num() {
		return product_num;
	}
	public void setProduct_num(int product_num) {
		this.product_num = product_num;
	}
	public int getProduct_price() {
		return product_price;
	}
	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getOrders_code() {
		return orders_code;
	}
	public void setOrders_code(String orders_code) {
		this.orders_code = orders_code;
	}
	public int getStore_num() {
		return store_num;
	}
	public void setStore_num(int store_num) {
		this.store_num = store_num;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
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
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
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
	public String getReceiver_msg() {
		return receiver_msg;
	}
	public void setReceiver_msg(String receiver_msg) {
		this.receiver_msg = receiver_msg;
	}
	public String getMain_product_image() {
		return main_product_image;
	}
	public void setMain_product_image(String main_product_image) {
		this.main_product_image = main_product_image;
	}
	public String getMain_product_name() {
		return main_product_name;
	}
	public void setMain_product_name(String main_product_name) {
		this.main_product_name = main_product_name;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}


}
