package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.basketDTO;
import dto.categoryDTO;
import dto.pagingDTO;
import dto.productDTO;
import dto.ratingDTO;
import dto.receiverDTO;

public class boardDAO {

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
	
	public productDTO getProductInfo(int product_num) { //리스트 중 선택한 상품정보를 가져옴
		productDTO pdto = new productDTO();
		try {
			getCon();
			String sql = "select * from product where product_num=?";
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

			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ResouceClose();
		}
		return pdto;
	}

	public List<productDTO> getProductList(int member_num, pagingDTO page) {//상품 리스트
		List<productDTO> list = new ArrayList<productDTO>();
		try {
			getCon();
			String sql = "select * from product where member_num =? limit ?,?";
			pstmt =con.prepareStatement(sql);
			pstmt.setInt(1, member_num);
			pstmt.setInt(2, page.getStartRow());
			pstmt.setInt(3, page.getPageSize());
			
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
	
	public int getProductCount() {
		int result = 0;
		try {
			getCon();
			String sql = "select count(*) from product;";
			pstmt =con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			result = rs.getInt(1);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ResouceClose();
		}
		return result;
	}
	
}
