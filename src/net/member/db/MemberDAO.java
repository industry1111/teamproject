package net.member.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDAO {
	Connection con;
	ResultSet rs;
	PreparedStatement pstmt;
	DataSource ds;

	public void getCon() {
		try {
			Context init = new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc/teamdb");
			con = ds.getConnection();
		} catch (Exception e) {
			System.out.println("DB_Connection:" + e.toString());
		}
	}

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

	public boolean insertMember(MemberBean mb) {
		int result = 0;
		try {
			getCon();
			String sql = "insert into member(name,id,pw,email,phone,addr1,addr2,addr3)"
					+ "values(?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mb.getName());
			pstmt.setString(2, mb.getId());
			pstmt.setString(3, mb.getPassword());
			pstmt.setString(4, mb.getEmail());
			pstmt.setString(5, mb.getPhone());
			pstmt.setString(6, mb.getAddress1());
			pstmt.setString(7, mb.getAddress2());
			pstmt.setString(8, mb.getAddress3());
			result = pstmt.executeUpdate(); //회원가입 성공하면 1리턴, 실패시0리턴
			
			//만약 회원가입에 성공하면.. true리턴
			if(result != 0){
				return true;
			}
		} catch (Exception e) {
			System.out.println("insertMember:" + e.toString());
		}finally {
			ResouceClose();
		}
		return false;
	}
}
