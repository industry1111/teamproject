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
	
	//상품 입력
	public void insertProduct(productDTO pdto) {
		int product_num = 0; //임시적용
		int member_num = 0; //임시적용
		try {
			getCon();
			//1.상품등록번호 계산
			String sql = "select max(product_num),max(member_num) from product";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				product_num = rs.getInt(1)+1;
				member_num = rs.getInt(1)+1;
			}
			System.out.println("상품번호 반영" + product_num + "맴버넘반영" + member_num);
			
			//2.상품등록
			
			sql = "insert into product (member_num,product_name,product_img,product_category,"
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
		} catch (Exception e) {
			System.out.println("insertProduct:"+e.toString());
		}finally {
			ResouceClose();
		}
	}
	//상품 정보
	public productDTO getProductInfo(int product_num) {
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
				
			}
			
		} catch (Exception e) {
			System.out.println("getProduct"+e.toString());
		} finally {
			ResouceClose();
		}
		return pdto;
	}
	//상품 리스트
	public List<productDTO> getProductList() {
		List<productDTO> list = new ArrayList<productDTO>();
		try {
			getCon();
			String sql = "select * from product where member_num=?";
			pstmt =con.prepareStatement(sql);
//			pstmt.setInt(1, member_num);
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
			String sql="insert into receiver (receiver_name,receiver_phone,receiver_addr1,"
					+ "receiver_addr2,receiver_addr3,receiver_msg,member_num,basic_num"
					+ "values(?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, rdto.getReceiver_name());
			pstmt.setString(2, rdto.getReceiver_phone());
			pstmt.setString(3, rdto.getReceiver_addr1());
			pstmt.setString(4, rdto.getReceiver_addr2());
			pstmt.setString(5, rdto.getReceiver_addr3());
			pstmt.setString(6, rdto.getReceiver_msg());
			pstmt.setInt(7, member_num);
			pstmt.setInt(8, 0);
			
		} catch (Exception e) {
			System.out.println("insertReceiver:"+e.toString());
		}
	}
	
	//store Category List
	public List<storeCategoryDTO> getStoreCategory(){
		List<storeCategoryDTO> list = new ArrayList<storeCategoryDTO>();
		try {
			getCon();
			String sql = "select * from store_category";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()){
				storeCategoryDTO scdto = new storeCategoryDTO();
				
				scdto.setStore_c_num(rs.getInt("store_c_num"));
				scdto.setStore_category(rs.getString("store_category"));
				
				list.add(scdto);
			}
		} catch (Exception e) {
			System.out.println("getStoreCategory:"+e.toString());
		}finally{
			ResouceClose();
		}
		return list;
	}
	
	
}
