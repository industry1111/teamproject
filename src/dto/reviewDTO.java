package dto;

import java.sql.Timestamp;

public class reviewDTO {
	private int review_num;
	private int member_num;
	private int product_num;
	private int rating1;
	private int rating2;
	private int rating3;
	private String review_content;
	private Timestamp regdate;
	private String review_img;
	private int store_num;
	

	
	public int getStore_num() {
		return store_num;
	}
	public void setStore_num(int store_num) {
		this.store_num = store_num;
	}
	public int getReview_num() {
		return review_num;
	}
	public void setReview_num(int review_num) {
		this.review_num = review_num;
	}
	public int getMember_num() {
		return member_num;
	}
	public void setMember_num(int member_num) {
		this.member_num = member_num;
	}
	public int getProduct_num() {
		return product_num;
	}
	public void setProduct_num(int product_num) {
		this.product_num = product_num;
	}
	public int getRating1() {
		return rating1;
	}
	public void setRating1(int rating1) {
		this.rating1 = rating1;
	}
	public int getRating2() {
		return rating2;
	}
	public void setRating2(int rating2) {
		this.rating2 = rating2;
	}
	public int getRating3() {
		return rating3;
	}
	public void setRating3(int rating3) {
		this.rating3 = rating3;
	}
	public String getReview_content() {
		return review_content;
	}
	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	public String getReview_img() {
		return review_img;
	}
	public void setReview_img(String review_img) {
		this.review_img = review_img;
	}
	
}
