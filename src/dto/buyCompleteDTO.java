package dto;

import java.sql.Timestamp;

public class buyCompleteDTO {
	
	private int member_num;
	private int  store_num;
	private int s_member_num;
	private int  price;
	private int sum;
    Timestamp date;
    
    
	public int getS_member_num() {
		return s_member_num;
	}
	public void setS_member_num(int s_member_num) {
		this.s_member_num = s_member_num;
	}
	public int getSum() {
		return sum;
	}
	public void setSum(int sum) {
		this.sum = sum;
	}
	public int getMember_num() {
		return member_num;
	}
	public void setMember_num(int member_num) {
		this.member_num = member_num;
	}
	public int getStore_num() {
		return store_num;
	}
	public void setStore_num(int store_num) {
		this.store_num = store_num;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public Timestamp getDate() {
		return date;
	}
	public void setDate(Timestamp date) {
		this.date = date;
	}

}
