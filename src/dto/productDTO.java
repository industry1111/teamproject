package dto;

import java.sql.Timestamp;

public class productDTO {
	private int product_num;
	private String product_name;
	private String product_img;
	private String category_name;
	private int product_price;
	private int product_count;
	private String product_brand;
	private String product_description;
	private Timestamp product_regdate;
	private int member_num;
	private String store_name;
    private int category_num;
    private String profile_img;
    private String template;
    private String account;
    
	public String getStore_name() {
        return store_name;
    }
    public void setStore_name(String store_name) {
        this.store_name = store_name;
    }
    public int getCategory_num() {
        return category_num;
    }
    public void setCategory_num(int category_num) {
        this.category_num = category_num;
    }
    public String getProfile_img() {
        return profile_img;
    }
    public void setProfile_img(String profile_img) {
        this.profile_img = profile_img;
    }
    public String getTemplate() {
        return template;
    }
    public void setTemplate(String template) {
        this.template = template;
    }
    public String getAccount() {
        return account;
    }
    public void setAccount(String account) {
        this.account = account;
    }
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
	
	public String getCategory_name() {
		return category_name;
	}
	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}
	public int getProduct_price() {
		return product_price;
	}
	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}
	public int getProduct_count() {
		return product_count;
	}
	public void setProduct_count(int product_count) {
		this.product_count = product_count;
	}
	public String getProduct_brand() {
		return product_brand;
	}
	public void setProduct_brand(String product_brand) {
		this.product_brand = product_brand;
	}
	public String getProduct_description() {
		return product_description;
	}
	public void setProduct_description(String product_description) {
		this.product_description = product_description;
	}
	public Timestamp getProduct_regdate() {
		return product_regdate;
	}
	public void setProduct_regdate(Timestamp product_regdate) {
		this.product_regdate = product_regdate;
	}
	public int getMember_num() {
		return member_num;
	}
	public void setMember_num(int member_num) {
		this.member_num = member_num;
	}
	
	
}