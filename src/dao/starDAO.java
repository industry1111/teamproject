package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.ratingDTO;

public class starDAO {
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
