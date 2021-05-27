package db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

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
		
			String sql = "insert into product (member_num,product_name,product_img,product_category,"
					+ "price,count,brand,description)"
					+ "values(?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, pdto.getMember_num());
			pstmt.setString(2, pdto.getProduct_name());
			pstmt.setString(3, pdto.getProduct_img());
			pstmt.setString(4, pdto.getProdcut_category());
			pstmt.setInt(5, pdto.getPrice());
			pstmt.setInt(6, pdto.getCount());
			pstmt.setString(7, pdto.getBrand());
			pstmt.setString(8, pdto.getDescription());
			pstmt.executeUpdate();
			System.out.println("상품등록완료");
		} catch (Exception e) {
			System.out.println("insertProduct:"+e.toString());
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
				
				
				pdto.setProduct_num(rs.getInt("product_num"));
				pdto.setMember_num(rs.getInt("member_num"));
				pdto.setProduct_name(rs.getString("product_name"));
				pdto.setProduct_img(rs.getString("product_img"));
				pdto.setProdcut_category(rs.getString("product_category"));
				pdto.setPrice(rs.getInt("price"));
				pdto.setCount(rs.getInt("count"));
				pdto.setBrand(rs.getString("brand"));
				pdto.setDescription(rs.getString("description"));
				
				System.out.println("조회완료");
			}
			
		} catch (Exception e) {
			System.out.println("getProductInfo"+e.toString());
		} finally {
			ResouceClose();
		}
		return pdto;
	}
	
	
	public void updateProduct(productDTO pdto) {//선택한 상품정보를 수정하는 서블릿
		try {
		getCon();
		String sql ="update product set product_name=? , product_category=? , decription=? "
					+ " , brand=? , price=? , count=?, product_img where product_num=? ";
			//쿼리 실행할 객체 생성
			pstmt= con.prepareStatement(sql);
			
			pstmt.setString(1, pdto.getProduct_name());
			pstmt.setString(2, pdto.getProdcut_category());
			pstmt.setString(3, pdto.getDescription());
			pstmt.setString(4, pdto.getBrand());
			pstmt.setInt(5, pdto.getPrice());
			pstmt.setInt(6, pdto.getCount());
			pstmt.setString(7, pdto.getProduct_img());
			pstmt.executeUpdate();
			
			System.out.println("수정완료");
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			ResouceClose();
		}
		
	}
	

	//상품 리스트
	public List<productDTO> getProductList() {
		List<productDTO> list = new ArrayList<productDTO>();
		try {
			getCon();
			String sql = "select * from product";
			pstmt =con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while(rs.next()) {
				
				productDTO pdto = new productDTO();
				pdto.setProduct_num(rs.getInt("product_num"));
				pdto.setMember_num(rs.getInt("member_num"));
				pdto.setProduct_name(rs.getString("product_name"));
				pdto.setProduct_img(rs.getString("product_img"));
				pdto.setProdcut_category(rs.getString("product_category"));
				pdto.setPrice(rs.getInt("price"));
				pdto.setCount(rs.getInt("count"));
				pdto.setBrand(rs.getString("brand"));
				pdto.setDescription(rs.getString("description"));
				
				list.add(pdto);
				
			}
			System.out.println("상품목록 저장완료");
		} catch (Exception e) {
			System.out.println("getProduct"+e.toString());
		} finally {
			ResouceClose();
		}
		return list;
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
	public List<receiverDTO> getReceiverInfo(int member_num){
		
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
	
	
}
