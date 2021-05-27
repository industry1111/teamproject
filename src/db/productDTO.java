package db;

import java.sql.Timestamp;

public class productDTO {
	private int product_num;
	private String product_name;
	private String product_img;
	private String prodcut_category;
	private int price;
	private int count;
	private String brand;
	private String description;
	private Timestamp regdate;
	private int member_num;
	
	public int getProduct_num() {
		return product_num;
	}
	public void setProduct_num(int product_num) {
		this.product_num = product_num;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public String getProduct_img() {
		return product_img;
	}
	public void setProduct_img(String product_img) {
		this.product_img = product_img;
	}
	public String getProdcut_category() {
		return prodcut_category;
	}
	public void setProdcut_category(String prodcut_category) {
		this.prodcut_category = prodcut_category;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int product_price) {
		this.price = product_price;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	public int getMember_num() {
		return member_num;
	}
	public void setMember_num(int member_num) {
		this.member_num = member_num;
	}
	
	@Override
	public String toString() {
		return "productDTO [product_num =" + product_num + ", product_name=" + product_name + ", product_img=" + product_img + ", price=" + price + ", prodcut_category="
				+ prodcut_category + ", count=" + count + ", brand=" + brand + ", description=" + description + ", regdate =" + regdate
				+ ", member_num=" + member_num + "]";
	}	
	
}