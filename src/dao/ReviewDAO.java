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

import dto.reviewDTO;

public class ReviewDAO {
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
		

		public void insertReview(reviewDTO rvdto) { //상품 정보를 입력함

			try {
				getCon();
			
				String sql = "insert into review (review_num,member_num,product_num,rating1,"
						+ "rating2,rating3,review_title,review_contentregdate)"
						+ "values(?,?,?,?,?,?,?,?,?)";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, rvdto.getReview_num());
				pstmt.setInt(2, rvdto.getMember_num());
				pstmt.setInt(3, rvdto.getProduct_num());
				pstmt.setInt(4, rvdto.getRating1());
				pstmt.setInt(5, rvdto.getRating2());
				pstmt.setInt(6, rvdto.getRating3());
				pstmt.setString(7, rvdto.getReview_title());
				pstmt.setString(8, rvdto.getReview_content());
				pstmt.executeUpdate();
			} catch (Exception e) {
				System.out.println("insertReview:"+e.toString());
			}finally {
				ResouceClose();
			}
		}
		
		//
		public reviewDTO getReviewInfo(int review_num) { //리스트 중 선택한 상품정보를 가져옴
			reviewDTO rvdto = new reviewDTO();
			try {
				getCon();
				String sql = "select * from review where review_num=?";
				pstmt =con.prepareStatement(sql);
				pstmt.setInt(1, review_num);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					
					rvdto.setReview_num(review_num);
					rvdto.setMember_num(rs.getInt("member_num"));
					rvdto.setProduct_num(rs.getInt("product_num"));
					rvdto.setRating1(rs.getInt("rating1"));
					rvdto.setRating2(rs.getInt("rating2"));
					rvdto.setRating3(rs.getInt("rating3"));
					rvdto.setReview_title(rs.getString("review_title"));
					rvdto.setReview_content(rs.getString("review_content"));
					rvdto.setRegdate(rs.getTimestamp("regdate"));
					
				}
				
			} catch (Exception e) {
				System.out.println("getReviewInfo"+e.toString());
			} finally {
				ResouceClose();
			}
			return rvdto;
		}
		
		//
		public List<reviewDTO> getReviewList(int product_num) {
			List<reviewDTO> list = new ArrayList<reviewDTO>();
			try {
				getCon();
				String sql = "select * from review where product_num =?";
				pstmt =con.prepareStatement(sql);
				pstmt.setInt(1, product_num);
				rs = pstmt.executeQuery();

				while(rs.next()) {
					
					reviewDTO rvdto = new reviewDTO();
					rvdto.setReview_num(rs.getInt("review_num"));
					rvdto.setMember_num(rs.getInt("member_num"));
					rvdto.setProduct_num(rs.getInt("product_num"));
					rvdto.setRating1(rs.getInt("rating1"));
					rvdto.setRating2(rs.getInt("rating2"));
					rvdto.setRating3(rs.getInt("rating3"));
					rvdto.setReview_title(rs.getString("review_title"));
					rvdto.setReview_content(rs.getString("review_content"));
					rvdto.setRegdate(rs.getTimestamp("regdate"));
					
					list.add(rvdto);
					
				}
			} catch (Exception e) {
				System.out.println("getReview"+e.toString());
			} finally {
				ResouceClose();
			}
			return list;
		}
		
		
		
}
