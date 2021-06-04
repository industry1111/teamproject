package com.product.action;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class productDAO {

	
	
	Connection con;
	ResultSet rs;
	PreparedStatement pstmt;
	DataSource ds;
	
	//커넥션
	public void getCon() {
		try {
			Context init = new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc/teamdb");
			con = ds.getConnection();
		} catch (Exception e) {
			System.out.println("DB_Connection:" + e.toString());
		}
	}
	//자원반환
	public void ResouceClose(){	
		try {
			if(pstmt != null){
				pstmt.close();
			}
			if(rs!= null){
				rs.close();
			}
			if(con != null){ 
				con.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void insertProduct(productDTO pdto) { //상품 정보를 입력함

		try {
			getCon();
		
			String sql = "insert into product (member_num,product_name,product_img,category_name,"
					+ "product_price,product_count,product_brand,product_description)"
					+ "values(?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, pdto.getMember_num());
			pstmt.setString(2, pdto.getProduct_name());
			pstmt.setString(3, pdto.getProduct_img());
			pstmt.setString(4, pdto.getCategory_name());
			pstmt.setInt(5, pdto.getProduct_price());
			pstmt.setInt(6, pdto.getProduct_count());
			pstmt.setString(7, pdto.getProduct_brand());
			pstmt.setString(8, pdto.getProduct_description());
			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			ResouceClose();
		}
	}
	
	public productDTO getProductInfo(int product_num) { //리스트 중 선택한 상품정보를 가져옴
		productDTO pdto = new productDTO();
		try {
			getCon();
			String sql = "select * from product natural join category where product_num=?";
			pstmt =con.prepareStatement(sql);
			pstmt.setInt(1, product_num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				
				pdto.setProduct_num(product_num);
				pdto.setMember_num(rs.getInt("member_num"));
				pdto.setProduct_name(rs.getString("product_name"));
				pdto.setProduct_img(rs.getString("product_img"));
				pdto.setCategory_name(rs.getString("category_name"));
				pdto.setProduct_price(rs.getInt("product_price"));
				pdto.setProduct_count(rs.getInt("product_count"));
				pdto.setProduct_brand(rs.getString("product_brand"));
				pdto.setProduct_description(rs.getString("product_description"));
				pdto.setCategory_coderef1(rs.getInt("category_coderef1"));
				pdto.setCategory_coderef2(rs.getInt("category_coderef2"));
				pdto.setCategory_code1(rs.getInt("category_code"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ResouceClose();
		}
		return pdto;
	}
	
	
	public void updateProduct(productDTO pdto) {//선택한 상품정보를 수정
		try {
		getCon();

		String sql ="update product set product_name=? , category_name=? , product_description=? "
					+ " , product_brand=? , product_price=? , product_count=?, product_img=? where product_num=? ";

			//쿼리 실행할 객체 생성
			pstmt= con.prepareStatement(sql);
			
			pstmt.setString(1, pdto.getProduct_name());
			pstmt.setString(2, pdto.getCategory_name());
			pstmt.setString(3, pdto.getProduct_description());
			pstmt.setString(4, pdto.getProduct_brand());
			pstmt.setInt(5, pdto.getProduct_price());
			pstmt.setInt(6, pdto.getProduct_count());
			pstmt.setString(7, pdto.getProduct_img());
			pstmt.setInt(8, pdto.getProduct_num());
			pstmt.executeUpdate();

		} catch (Exception e) {
			System.out.println("updateProduct:"+e.toString());
		}finally{
			ResouceClose();
		}
		
	}

	//내가 등록한 상품 리스트
	public List<productDTO> getProductList(int member_num) {
		List<productDTO> list = new ArrayList<productDTO>();
		try {
			getCon();
			String sql = "select * from product where member_num =?";
			pstmt =con.prepareStatement(sql);
			pstmt.setInt(1, member_num);
			rs = pstmt.executeQuery();

			while(rs.next()) {
				
				productDTO pdto = new productDTO();
				pdto.setProduct_num(rs.getInt("product_num"));
				pdto.setProduct_name(rs.getString("product_name"));
				pdto.setProduct_img(rs.getString("product_img"));
				pdto.setCategory_name(rs.getString("category_name"));
				pdto.setProduct_price(rs.getInt("product_price"));
				pdto.setProduct_count(rs.getInt("product_count"));
				pdto.setProduct_brand(rs.getString("product_brand"));
				pdto.setProduct_description(rs.getString("product_description"));
				
				list.add(pdto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ResouceClose();
		}
		return list;
	}
	
	
	//메인화면에 보여줄 상품 리스트
	public List<productDTO> getProductList() {
		List<productDTO> list = new ArrayList<productDTO>();
		try {
			getCon();
			String sql = "select * from product natural join category";
			pstmt =con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while(rs.next()) {
				
				productDTO pdto = new productDTO();
				pdto.setProduct_num(rs.getInt("product_num"));
				pdto.setProduct_name(rs.getString("product_name"));
				pdto.setProduct_img(rs.getString("product_img"));
				pdto.setCategory_name(rs.getString("category_name"));
				pdto.setProduct_price(rs.getInt("product_price"));
				pdto.setProduct_count(rs.getInt("product_count"));
				pdto.setProduct_brand(rs.getString("product_brand"));
				pdto.setProduct_description(rs.getString("product_description"));
				pdto.setMember_num(rs.getInt("member_num"));
				pdto.setRegdate(rs.getTimestamp("product_regdate"));
				pdto.setCategory_code1(rs.getInt("category_code"));
				pdto.setCategory_coderef1(rs.getInt("category_codeRef1"));
				pdto.setCategory_coderef2(rs.getInt("category_codeRef2"));
				
				
				list.add(pdto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ResouceClose();
		}
		return list;
	}
	//메인화면에 선택한 리스트
		public List<productDTO> getProductList(int category_code1,int category_code2,int category_code3,String brand,
														String price1, String price2, String sort,String price) {
			List<productDTO> list = new ArrayList<productDTO>();
			String sql = "select p.product_num, s.store_name, p.member_num, p.product_name, p.product_img, c.category_name,p.product_price,"
					+ " p.product_description, product_regdate, product_brand, c.category_num, c.category_name,"
					+ " c.category_codeRef1,c.category_codeRef2,c.category_code , s.profile_img, p.product_count, p.product_regdate "
					+ " from product p join category c on p.category_name = c.category_name "
					+ " join seller s on s.member_num = p.member_num";
					

			if(category_code3 == 0) {
				if(category_code2 == 0) {
					if(category_code1 != 0) {
						sql += " where category_coderef1 = "+category_code1;
					}
				}else{
					sql += " where category_coderef1 = "+category_code1 + " and category_coderef2 = "+category_code2;
				}
			}else{
				sql += " where category_coderef1 = "+category_code1 + " and category_coderef2 = "+category_code2 + " and category_code = "+category_code3;
			}
			
			if(price != null){
				
				if(price.equals("1")){
					sql += " and p.product_price between 0 and 10000";
				}else if(price.equals("2")){
					sql += " and p.product_price between 10000 and 50000";
				}else if(price.equals("3")){
					sql += " and p.product_price between 50000 and 100000";
				}else if(price1 != "" && price2 != ""){
					sql += " and p.product_price between "+price1+" and "+price2;
				}
			}
		
			if(sort != null){
			    
			    if(sort.equals("1")){
			        sql += " order by p.product_price";
			    }else if(sort.equals("2")){
                    sql += " order by p.product_price desc";
                }else if(sort.equals("3")){
                    sql += " order by p.product_regdate desc";
                }
			    
			}
			
			
			System.out.println("sort!!!!!"+sort);
			try {
				getCon();
		
				pstmt =con.prepareStatement(sql);
				rs = pstmt.executeQuery();

				while(rs.next()) {
					
					productDTO pdto = new productDTO();
					pdto.setProduct_num(rs.getInt("product_num"));
					pdto.setProduct_name(rs.getString("product_name"));
					pdto.setProduct_img(rs.getString("product_img"));
					pdto.setCategory_name(rs.getString("category_name"));
					pdto.setProduct_price(rs.getInt("product_price"));
					pdto.setProduct_count(rs.getInt("product_count"));
					pdto.setProduct_brand(rs.getString("product_brand"));
					pdto.setProduct_description(rs.getString("product_description"));
					pdto.setMember_num(rs.getInt("member_num"));
					pdto.setStore_name(rs.getString("store_name"));
					pdto.setProfile_img(rs.getString("profile_img"));
					pdto.setRegdate(rs.getTimestamp("product_regdate"));
					pdto.setCategory_code1(rs.getInt("category_code"));
					pdto.setCategory_coderef1(rs.getInt("category_codeRef1"));
					pdto.setCategory_coderef2(rs.getInt("category_codeRef2"));
					
					
					list.add(pdto);
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				ResouceClose();
			}
			return list;
		}
	
	public void deleteProduct(int product_num){ //상품 정보 삭제
		try {
			getCon();
			String sql = "delete from product where product_num = ? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, product_num);
			pstmt.executeUpdate();
						
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			ResouceClose();
		}
		
	}
	
	
}
