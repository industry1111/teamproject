package db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class boardDAO {

	Connection con;
	ResultSet rs;
	PreparedStatement pstmt;
	DataSource ds;
	
	//커넥션풀 얻기
	public boardDAO(){
		try {
			Context ctx = new InitialContext();
			Context envContext = (Context)ctx.lookup("java:/comp/env");		
			
			ds = (DataSource)envContext.lookup("jdbc/teamdb");
			
		} catch (Exception e) {
			System.out.println("DB_connect : "+ e.toString());
		}
	}
	//자원반납
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
	
	//물품등록 리스트 조회(가져오기)

	
	
	
	//물품 상세 조회
	public boardDTO getProduct(int num){
		
		try {
			con= ds.getConnection();
			String sql = "select * from product where product_num=?";
			pstmt =con.prepareStatement(sql);
			
		} catch (Exception e) {
			System.out.println("getProduct"+e.toString());
		} finally {
			ResouceClose();
		}
		return null;
	}
	
	
	//상세조회한 물품 수정
	
	
	
	//상세조회한 물품 삭제
	
	
}
