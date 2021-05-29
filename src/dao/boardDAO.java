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
	
	
	public void updateProduct(productDTO pdto) {//선택한 상품정보를 수정하는 서블릿
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

	//상품 리스트
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
	
	
	//장바구니 추가
	public void insertBasket(int member_num,int product_num,int quantity) {
		try {
			getCon();
			String sql = "insert into basket(member_num,product_num,quantity)"
					+ "values(?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, member_num);
			pstmt.setInt(2, product_num);
			pstmt.setInt(3, quantity);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("insertBasket:"+e.toString());
		}finally {
			ResouceClose();
		}
	}
	//장바구니 리스트 
	public List<basketDTO> getBasketList(int member_num){
		List<basketDTO> list = new ArrayList<basketDTO>();
		try {
			getCon();
			String sql = "select * from basket natural join product";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				basketDTO bdto = new basketDTO();
				bdto.setBasket_num(rs.getInt("basketnum"));
				bdto.setProduct_num(rs.getInt("product_num"));
				bdto.setProduct_img(rs.getString("product_img"));
				bdto.setProduct_name(rs.getString("product_name"));
				bdto.setProduct_price(rs.getInt("product_price"));
				bdto.setQuantity(rs.getInt("quantity"));
				
				list.add(bdto);
			}
		} catch (Exception e) {
			System.out.println("getBasketList:"+e.toString());
		}finally {
			ResouceClose();
		}
		return list;
	}
	
	//구매자
	public void insertReceiver(receiverDTO rdto,int member_num) {
		try {
			getCon();
			if(rdto.getBasic_num()==1){
				
				String sql= "update receiver set basic_num = 0";
				pstmt = con.prepareStatement(sql);
				pstmt.executeUpdate();
				
			}
			String sql="insert into receiver (member_num,receiver_name,receiver_phone,receiver_addr1,"
					+ "receiver_addr2,receiver_addr3,basic_num,address_name)"
					+ "values(?,?,?,?,?,?,?,?)";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, member_num);
			pstmt.setString(2, rdto.getReceiver_name());
			pstmt.setString(3, rdto.getReceiver_phone());
			pstmt.setString(4, rdto.getReceiver_addr1());
			pstmt.setString(5, rdto.getReceiver_addr2());
			pstmt.setString(6, rdto.getReceiver_addr3());
			pstmt.setInt(7, rdto.getBasic_num());
			pstmt.setString(8, rdto.getAddress_name());
			pstmt.executeUpdate();
			
			
		} catch (Exception e) {
			System.out.println("insertReceiver:"+e.toString());
		}
	}
	//배송지 정보
	public List<receiverDTO> getReceiverList(int member_num){
		
		List<receiverDTO> rlist = new ArrayList<receiverDTO>();
		
		try {
			getCon();
			String sql = "select * from receiver where member_num=?";
		
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, member_num);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				
				receiverDTO rdto = new receiverDTO();
				rdto.setAddress_name(rs.getString("address_name"));
				rdto.setBasic_num(rs.getInt("basic_num"));
				rdto.setReceiver_addr1(rs.getString("receiver_addr1"));
				rdto.setReceiver_addr2(rs.getString("receiver_addr2"));
				rdto.setReceiver_addr3(rs.getString("receiver_addr3"));
				rdto.setReceiver_name(rs.getString("receiver_name"));
				rdto.setReceiver_num(rs.getInt("receiver_num"));
				rdto.setReceiver_phone(rs.getString("receiver_phone"));
				
				rlist.add(rdto);
			}
		} catch (Exception e) {
			System.out.println("getReceiverInfo:"+e.toString());
		}finally{
			ResouceClose();
		}
		return rlist;
	}
	
	public receiverDTO getReceiverInfo(int receiver_num) {
		receiverDTO rdto = new receiverDTO();
		try {
			getCon();
			String sql = "select * from receiver where receiver_num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, receiver_num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				rdto.setAddress_name(rs.getString("address_name"));
				rdto.setBasic_num(rs.getInt("basic_num"));
				rdto.setReceiver_addr1(rs.getString("receiver_addr1"));
				rdto.setReceiver_addr2(rs.getString("receiver_addr2"));
				rdto.setReceiver_addr3(rs.getString("receiver_addr3"));
				rdto.setReceiver_msg(rs.getString("receiver_msg"));
				rdto.setReceiver_name(rs.getString("receiver_name"));
				rdto.setReceiver_num(rs.getInt("receiver_num"));
				rdto.setReceiver_phone(rs.getString("receiver_phone"));
			}
		} catch (Exception e) {
			System.out.println("getReceiverInfo:"+e.toString());
		}finally {
			ResouceClose();
		}
		return rdto;
	}
	//store Category List
	public List<categoryDTO> getcategory(){
		List<categoryDTO> list = new ArrayList<categoryDTO>();
		try {
			getCon();
			String sql = "select * from category";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()){
				categoryDTO cdto = new categoryDTO();
				cdto.setCategory_num(rs.getInt("category_num"));
				cdto.setCategory_name(rs.getString("category_name"));
				cdto.setCategory_code(rs.getInt("category_code"));
				cdto.setCategory_codeRef1(rs.getInt("category_coderef1"));
				cdto.setCategory_codeRef2(rs.getInt("category_coderef2"));
			
				
				list.add(cdto);
			}
		} catch (Exception e) {
			System.out.println("category:"+e.toString());
		}finally{
			ResouceClose();
		}
		return list;
	}
	
	//별점
	public void insertRating(ratingDTO rdto) { //상품 정보를 입력함

		try {
			getCon();
		
			String sql = "insert into rating (member_num,product_num,star)"
					+ "values(?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, rdto.getMember_num());
			pstmt.setInt(2, rdto.getProduct_num());
			pstmt.setInt(3, rdto.getStar());
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("insertRating:"+e.toString());
		}finally {
			ResouceClose();
		}
	}
	
}
