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

import com.product.action.productDTO;

import dto.basketDTO;
import dto.brandDTO;
import dto.categoryDTO;
import dto.ratingDTO;
import dto.receiverDTO;
import dto.templateDTO;

public class boardDAO {

	Connection con;
	ResultSet rs;
	PreparedStatement pstmt;
	DataSource ds;

	// 커넥션
	public void getCon() {
		try {
			Context init = new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc/teamdb");
			con = ds.getConnection();
		} catch (Exception e) {
			System.out.println("DB_Connection:" + e.toString());
		}
	}

	// 자원반환
	public void ResouceClose() {
		try {
			if (pstmt != null) {
				pstmt.close();
			}
			if (rs != null) {
				rs.close();
			}
			if (con != null) {
				con.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// 장바구니 추가
	public void insertBasket(int member_num, int product_num, int quantity) {
		try {
			getCon();
			String sql = "insert into basket(member_num,product_num,quantity)" + "values(?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, member_num);
			pstmt.setInt(2, product_num);
			pstmt.setInt(3, quantity);
			pstmt.executeUpdate();

		} catch (Exception e) {
			System.out.println("insertBasket:" + e.toString());
		} finally {
			ResouceClose();
		}
	}

	// 장바구니 리스트
	public List<basketDTO> getBasketList(int member_num) {
		List<basketDTO> list = new ArrayList<basketDTO>();
		try {
			getCon();
			String sql = "select * from basket join product on basket.product_num = product.product_num "
					+ "join seller on product.member_num = seller.member_num where basket.member_num = ?;";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, member_num);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				basketDTO bdto = new basketDTO();
				bdto.setBasket_num(rs.getInt("basket_num"));
				bdto.setProduct_num(rs.getInt("product_num"));
				bdto.setProduct_img(rs.getString("product_img"));
				bdto.setProduct_name(rs.getString("product_name"));
				bdto.setProduct_price(rs.getInt("product_price"));
				bdto.setStore_num(rs.getInt("store_num"));
				bdto.setStore_name(rs.getString("store_name"));
				bdto.setQuantity(rs.getInt("quantity"));

				list.add(bdto);

			}
		} catch (Exception e) {
			System.out.println("getBasketList:" + e.toString());
		} finally {
			ResouceClose();
		}
		return list;
	}

	// 장바구니 삭제
	public void deleteBasket(int product_num) {

		try {

			getCon();

			String sql = "delete basket from basket where product_num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, product_num);
			pstmt.executeUpdate();

		} catch (Exception e) {
			System.out.println("deleteBasket()" + e);
		} finally {
			ResouceClose();
		}

	}

	// 구매자
	public void insertReceiver(receiverDTO rdto, int member_num) {
		try {
			getCon();
			if (rdto.getBasic_num() == 1) {

				String sql = "update receiver set basic_num = 0 where member_num=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, member_num);
				pstmt.executeUpdate();

			}
			String sql = "insert into receiver (member_num,receiver_name,receiver_phone,receiver_addr1,"
					+ "receiver_addr2,receiver_addr3,basic_num,address_name)" + "values(?,?,?,?,?,?,?,?)";

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
			System.out.println("insertReceiver:" + e.toString());
		}
	}

	// 배송지 정보
	public List<receiverDTO> getReceiverList(int member_num) {

		List<receiverDTO> rlist = new ArrayList<receiverDTO>();

		try {
			getCon();
			String sql = "select * from receiver where member_num=?";

			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, member_num);
			rs = pstmt.executeQuery();

			while (rs.next()) {

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
			System.out.println("getReceiverInfo:" + e.toString());
		} finally {
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
			if (rs.next()) {
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
			System.out.println("getReceiverInfo:" + e.toString());
		} finally {
			ResouceClose();
		}
		return rdto;
	}

	// 배송지 변경
	public void updateReceiver(receiverDTO rdto, int receiver_num, int member_num) {
		try {
			getCon();

			if (rdto.getBasic_num() == 1) {
				String sql = "update receiver set basic_num = 0 where member_num = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, member_num);
				pstmt.executeUpdate();
			}

			String sql = "update receiver set address_name=?,receiver_name=?,receiver_phone=?,receiver_addr1=?,"
					+ "receiver_addr2=?,receiver_addr3=?,receiver_msg=?,basic_num=? where receiver_num=?";

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, rdto.getAddress_name());
			pstmt.setString(2, rdto.getReceiver_name());
			pstmt.setString(3, rdto.getReceiver_phone());
			pstmt.setString(4, rdto.getReceiver_addr1());
			pstmt.setString(5, rdto.getReceiver_addr2());
			pstmt.setString(6, rdto.getReceiver_addr3());
			pstmt.setString(7, rdto.getReceiver_msg());
			pstmt.setInt(8, rdto.getBasic_num());
			pstmt.setInt(9, receiver_num);
			pstmt.executeUpdate();

		} catch (Exception e) {
			System.out.println("updateReceiver()" + e);
		} finally {
			ResouceClose();
		}
	}

	// 배송지 삭제
	public void deleteReceiver(int receiver_num) {

		try {

			getCon();

			String sql = "delete receiver from receiver where receiver_num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, receiver_num);
			pstmt.executeUpdate();

		} catch (Exception e) {
			System.out.println("deleteReceiver()" + e);
		} finally {
			ResouceClose();
		}

	}

	// store Category List
	public List<categoryDTO> getcategory() {
		List<categoryDTO> list = new ArrayList<categoryDTO>();
		try {
			getCon();
			String sql = "select * from category";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				categoryDTO cdto = new categoryDTO();
				cdto.setCategory_num(rs.getInt("category_num"));
				cdto.setCategory_name(rs.getString("category_name"));
				cdto.setCategory_code(rs.getInt("category_code"));
				cdto.setCategory_codeRef1(rs.getInt("category_coderef1"));
				cdto.setCategory_codeRef2(rs.getInt("category_coderef2"));

				list.add(cdto);
			}
		} catch (Exception e) {
			System.out.println("category:" + e.toString());
		} finally {
			ResouceClose();
		}
		return list;
	}

	// 별점
	public void insertRating(ratingDTO rdto) { // 상품 정보를 입력함

		try {
			getCon();

			String sql = "insert into rating (member_num,product_num,star)" + "values(?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, rdto.getMember_num());
			pstmt.setInt(2, rdto.getProduct_num());
			pstmt.setInt(3, rdto.getStar());
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("insertRating:" + e.toString());
		} finally {
			ResouceClose();
		}
	}

	public List<categoryDTO> getcategory(int category_code1, int category_code2) {
		System.out.println("category_code1:" + category_code1);
		System.out.println("category_code2:" + category_code2);
		List<categoryDTO> list = new ArrayList<categoryDTO>();
		String sql = "select * from category";

		if (category_code2 == 0) {
			if (category_code1 != 0) {
				sql += " where category_coderef1=" + category_code1 + " and category_coderef2 is null";
			} else {
				sql += " where category_coderef2 is null";
			}
		} else {
			sql += " where category_coderef2=" + category_code2;
		}
		System.out.println(sql);
		try {
			getCon();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				categoryDTO cdto = new categoryDTO();
				cdto.setCategory_num(rs.getInt("category_num"));
				cdto.setCategory_name(rs.getString("category_name"));
				cdto.setCategory_code(rs.getInt("category_code"));
				cdto.setCategory_codeRef1(rs.getInt("category_coderef1"));
				cdto.setCategory_codeRef2(rs.getInt("category_coderef2"));

				list.add(cdto);
			}
		} catch (Exception e) {
			System.out.println("getcategory(int category_cod1,int category_code2):" + e.toString());
		} finally {
			ResouceClose();
		}
		return list;
	}

	// 템플릿 리스트
	public List<templateDTO> getTemplateList() {

		List<templateDTO> tlist = new ArrayList<templateDTO>();

		try {
			getCon();
			String sql = "select * from template";

			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {

				templateDTO tdto = new templateDTO();
				tdto.setTemplate_num(rs.getInt("template_num"));
				tdto.setTemplate_name(rs.getString("template_name"));
				tdto.setTemplate_img1(rs.getString("template_img1"));
				tdto.setTemplate_img1(rs.getString("template_img2"));

				tlist.add(tdto);
			}
		} catch (Exception e) {
			System.out.println("getReceiverInfo:" + e.toString());
		} finally {
			ResouceClose();
		}
		return tlist;
	}

	// 상품 등록, 수정시 사용하는 brand리스트
	public List<brandDTO> getbrandList(int category_code2) {

		List<brandDTO> list = new ArrayList<brandDTO>();
		try {
			getCon();
			String sql = " select * from category natural join brand where category_code =" + category_code2;
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {

				brandDTO bdto = new brandDTO();
				bdto.setBrand_num(rs.getInt("brand_num"));
				bdto.setBrand_name(rs.getString("brand_name"));

				list.add(bdto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ResouceClose();
		}
		return list;
	}

	public List<brandDTO> getbrandList() {

		List<brandDTO> list = new ArrayList<brandDTO>();
		try {
			getCon();
			String sql = " select * from brand";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {

				brandDTO bdto = new brandDTO();
				bdto.setBrand_num(rs.getInt("brand_num"));
				bdto.setBrand_name(rs.getString("brand_name"));

				list.add(bdto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ResouceClose();
		}
		return list;
	}

}
