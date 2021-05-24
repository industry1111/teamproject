package com.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class memberDAO {
	Connection con;
	ResultSet rs;
	PreparedStatement pstmt;
	DataSource ds;
	
	public memberDAO() {
		try{
			Context ctx = new InitialContext();
			Context envContext = (Context)ctx.lookup("java:/comp/env");		
			
			ds = (DataSource)envContext.lookup("jdbc/teamdb");
	
		}catch(Exception e){
			System.out.println("DB_Connect : " + e.toString());
		}	
	}
	
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
	
	
	public boolean insertMember(memberDTO dto) {
	    int result = 0; //회원가입 성공여부
	    
		try {
			con= ds.getConnection();

			String sql = "insert into member (name,id,email,pw,phone,addr1,addr2,addr3,code)"
					+ " values(?,?,?,?,?,?,?,?,0)";

			pstmt =con.prepareStatement(sql);
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getId());
			pstmt.setString(3, dto.getEmail());
			pstmt.setString(4, dto.getPw());
			pstmt.setString(5, dto.getPhone());
			pstmt.setString(6, dto.getAddr1());
			pstmt.setString(7, dto.getAddr2());
			pstmt.setString(8, dto.getAddr3());


			pstmt.setInt(9, 0);

			result = pstmt.executeUpdate();
			
			if(result != 0){
                return true;
            }
			
		} catch (Exception e) {
			System.out.println("insertMember:"+e.toString());
		}finally {
			ResouceClose();
		}
        return false;
	}
	
	public int userCheck(String id,String pw) {
		try {
			con = ds.getConnection();
			String sql = "select pw from member where id=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(pw.equals(rs.getString("pw"))) {
					return 1;
				}
			}
		} catch (Exception e) {
			System.out.println("userCheck");
		}finally {
			ResouceClose();
		}
		return  0;
	}
	
	public void updateID(String id,int member_num) {
		try {
			con = ds.getConnection();
			String sql = "update member set id=? where member_num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, member_num);
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("updateID"+e.toString());
		}finally {
			ResouceClose();
		}
	}
	public void updateName(String name,int member_num) {
		try {
			con = ds.getConnection();


			String sql = "update member set name=? where member_num = ?";

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setInt(2, member_num);
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("updateName"+e.toString());
		}finally {
			ResouceClose();
		}
	}
	public void updatePhone(String phone,int member_num) {
		try {
			con = ds.getConnection();
			String sql = "update member set phone=? where member_num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, phone);
			pstmt.setInt(2, member_num);
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("updatePhone"+e.toString());
		}finally {
			ResouceClose();
		}
	}
	
	public int idCheck(String id) {
		try {
			con = ds.getConnection();
			String sql = "select id from member where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return 1;
			}
		} catch (Exception e) {
			System.out.println("idCheck"+e.toString());
		}finally {
			ResouceClose();
		}
		return 0;
	}
	public int blog_nameCheck(String blog_name) {
		try {
			con = ds.getConnection();
			String sql = "select blog_name from member where blog_name=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, blog_name);
			rs = pstmt.executeQuery();
			if(rs.next()) {
					return 1;
			}
		} catch (Exception e) {
			System.out.println("blog_nameCheck"+e.toString());
		}finally {
			ResouceClose();
		}
		return 0;
	}
	public int emailCheck(String email) {
		try {
			con = ds.getConnection();
			String sql = "select email from member where email=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			if(rs.next()) {
					return 1;
			}
		} catch (Exception e) {
			System.out.println("emailCheck"+e.toString());
		}finally {
			ResouceClose();
		}
		return 0;
	}
	public int phoneCheck(String phone) {
		try {
			con = ds.getConnection();
			String sql = "select phone from member where phone=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, phone);
			rs = pstmt.executeQuery();
			if(rs.next()) {
					return 1;
			}
		} catch (Exception e) {
			System.out.println("phoneCheck"+e.toString());
		}finally {
			ResouceClose();
		}
		return 0;
	}
	public int pwCheck(String pw,int member_num) {
		try {
			con = ds.getConnection();
			String sql = "select pw from member where member_num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, member_num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(pw.equals(rs.getString("pw"))){
					return 1;
				}
					
			}
		} catch (Exception e) {
			System.out.println("pwCheck"+e.toString());
		}finally {
			ResouceClose();
		}
		return 0;
	}
	
	public void updatePw(String new_pw,int member_num){
		try {
			con = ds.getConnection();
			String sql = "update member set pw=? where member_num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, new_pw);
			pstmt.setInt(2, member_num);
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("updatePw"+e.toString());
		}finally{
			ResouceClose();
		}
	}
	
	public void updateEmail(String email,int member_num){
		try {
			con = ds.getConnection();
			String sql = "update member set email=? where member_num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.setInt(2, member_num);
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("updateEmail"+e.toString());
		}finally{
			ResouceClose();
		}
	}
	
	public void deletemember(int member_num){
		try {
			con = ds.getConnection();
			String sql = "delete from member where member_num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, member_num);
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("deleteMember:"+e.toString());
		}finally{
			ResouceClose();
		}
	}
}//memberDAO
