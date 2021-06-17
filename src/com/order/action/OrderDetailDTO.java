package com.order.action;

public class OrderDetailDTO {
    
    private int quantity;
    private int product_num;
    private int product_price;
    private String product_name;
    private String image;
    private String orders_code;
    private int store_num;
	private String state;
	private int count;	
	private int total;
	private int order_detail_num;

	
	public int getOrder_detail_num() {
		return order_detail_num;
	}

	public void setOrder_detail_num(int order_detail_num) {
		this.order_detail_num = order_detail_num;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
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
    
    
}
