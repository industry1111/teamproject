package db;

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

	// 회원 가입
	public boolean insertMember(memberDTO dto) {
		int result = 0; // 회원가입 성공여부

		try {
			getCon();

			String sql = "insert into member (name,id,email,pw,phone,addr1,addr2,addr3,member_code)"
					+ " values(?,?,?,?,?,?,?,?,?)";

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getId());
			pstmt.setString(3, dto.getEmail());
			pstmt.setString(4, dto.getPw());
			pstmt.setString(5, dto.getPhone());
			pstmt.setString(6, dto.getAddr1());
			pstmt.setString(7, dto.getAddr2());
			pstmt.setString(8, dto.getAddr3());
			pstmt.setInt(9, 1);

			result = pstmt.executeUpdate();

			if (result != 0) {
				return true;
			}

		} catch (Exception e) {
			System.out.println("insertMember:" + e.toString());
		} finally {
			ResouceClose();
		}
		return false;
	}

	// 로그인 아이디 비밀번호 확인
	public int userCheck(String id, String pw) {
		try {
			getCon();
			String sql = "select pw from member where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if (pw.equals(rs.getString("pw"))) {
					return 1;
				}
			}
		} catch (Exception e) {
			System.out.println("userCheck");
		} finally {
			ResouceClose();
		}
		return 0;
	}

//중복확인 부분
	// 아이디
	public int idCheck(String id) {
		try {
			getCon();
			String sql = "select id from member where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return 1;
			}

		} catch (Exception e) {
			System.out.println("idCheck" + e.toString());
		} finally {
			ResouceClose();
		}
		return 0;
	}

	// 이메일
	public int emailCheck(String email) {
		try {
			getCon();
			String sql = "select email from member where email=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return 1;
			}
		} catch (Exception e) {
			System.out.println("emailCheck" + e.toString());
		} finally {
			ResouceClose();
		}
		return 0;
	}

	// 번호
	public int phoneCheck(String phone) {
		try {
			getCon();
			String sql = "select phone from member where phone=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, phone);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return 1;
			}
		} catch (Exception e) {
			System.out.println("phoneCheck" + e.toString());
		} finally {
			ResouceClose();
		}
		return 0;
	}

	// 비밀번호변경 및 탈퇴를 위해 확인
	public int pwCheck(String pw, int member_num) {
		try {
			getCon();
			String sql = "select pw from member where member_num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, member_num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if (pw.equals(rs.getString("pw"))) {
					return 1;
				}

			}
		} catch (Exception e) {
			System.out.println("pwCheck" + e.toString());
		} finally {
			ResouceClose();
		}
		return 0;
	}

//회원정보 수정
	// 아이디
	public void updateID(String id, int member_num) {
		try {
			getCon();
			String sql = "update member set id=? where member_num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, member_num);
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("updateID" + e.toString());
		} finally {
			ResouceClose();
		}
	}

	// 이름
	public void updateName(String name, int member_num) {
		try {
			getCon();

			String sql = "update member set name=? where member_num = ?";

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setInt(2, member_num);
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("updateName" + e.toString());
		} finally {
			ResouceClose();
		}
	}

	// 번호
	public void updatePhone(String phone, int member_num) {

		try {
			getCon();
			String sql = "update member set phone=? where member_num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, phone);
			pstmt.setInt(2, member_num);
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("updatePhone" + e.toString());
		} finally {
			ResouceClose();
		}

	}

	// 비밀번호 변경
	public void updatePw(String new_pw, int member_num) {
		try {
			getCon();
			String sql = "update member set pw=? where member_num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, new_pw);
			pstmt.setInt(2, member_num);
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("updatePw" + e.toString());
		} finally {
			ResouceClose();
		}
	}

	// 이메일 변경
	public void updateEmail(String email, int member_num) {
		try {
			getCon();
			String sql = "update member set email=? where member_num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.setInt(2, member_num);
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("updateEmail" + e.toString());
		} finally {
			ResouceClose();
		}
	}
	
	//주소 변경
	public void updateAddr(String addr1,String addr2,String addr3,int member_num){
        try {
            con = ds.getConnection();
            String sql = "update member set addr1=?,addr2=?,addr3=? where member_num=?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, addr1);
            pstmt.setString(2, addr2);
            pstmt.setString(3, addr3);
            pstmt.setInt(4, member_num);
            pstmt.executeUpdate();
        } catch (Exception e) {
            System.out.println("updateEmail"+e.toString());
        }finally{
            ResouceClose();
        }
    }

	// 회원 탈퇴
	public void deletemember(int member_num) {
		try {
			getCon();
			String sql = "delete from member where member_num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, member_num);
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("deleteMember:" + e.toString());
		} finally {
			ResouceClose();
		}
	}

	// 로그인한 회원에 대한 정보 얻기
	public memberDTO getMemberInfo(String id) {

		memberDTO mdto = new memberDTO();

		try {
			getCon();
			String sql = "select * from member where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				mdto.setMember_num(rs.getInt("member_num"));
				mdto.setName(rs.getString("name"));
				mdto.setId(rs.getString("id"));
				mdto.setPw(rs.getString("pw"));
				mdto.setEmail(rs.getString("email"));
				mdto.setPhone(rs.getString("phone"));
				mdto.setAddr1(rs.getString("addr1"));
				mdto.setAddr2(rs.getString("addr2"));
				mdto.setAddr3(rs.getString("addr3"));
				mdto.setDate(rs.getTimestamp("date"));
				mdto.setMember_code((rs.getString("member_code")));
			}
		} catch (Exception e) {
			System.out.println("getMemberInfo:" + e.toString());
		} finally {
			ResouceClose();
		}

		return mdto;
	}
	
	//회원 번호 얻기
	public int getMemberNum(String id) {
		memberDTO mdto = new memberDTO();
		try {
			getCon();
			String sql = "select member_num from member where id =?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt("member_num");
			}
		} catch (Exception e) {
			System.out.println("getMemberNum:"+e.toString());
		}finally {
			ResouceClose();
		}
		return -1;
	}
	
	//판매자 등록
	public void insertSeller(sellerDTO sdto) {
		try {
			getCon();
			String sql = "insert into member (member_num,store_name,store_c_num,profile_img,template,account"
					+ "values(?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, sdto.getMember_num());
			pstmt.setString(2, sdto.getStore_name());
			pstmt.setInt(3, sdto.getStore_c_num());
			pstmt.setString(4, sdto.getProfile_img());
			pstmt.setString(5, sdto.getTemplate());
			pstmt.setString(6, sdto.getAccount());
			pstmt.executeUpdate();
			
			sql = "update member set member_code = 2 where member_num =?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, sdto.getMember_num());
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("insertSeller:"+e.toString());
		}finally {
			ResouceClose();
		}
	}
	
	//판매자 정보 얻기
	public sellerDTO getSellerInfo(int member_num) {
		sellerDTO sdto = new sellerDTO();
		try {
			getCon();
			String sql ="select * from seller where member_num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, member_num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				sdto.setStore_c_num(rs.getInt("store_num"));
				sdto.setMember_num(member_num);
				sdto.setStore_name(rs.getString("store_name"));
				sdto.setStore_c_num(rs.getInt("store_c_num"));
				sdto.setProfile_img(rs.getString("profile_img"));
				sdto.setTemplate(rs.getString("template"));
				sdto.setAccount(rs.getString("account"));
				
				return sdto;
			}
			
		} catch (Exception e) {
			System.out.println("getSellerInfo:"+e.toString());
		}finally {
			ResouceClose();
		}
		return null;
	}

	//판매자 정보 수정 
	//스토어명변경
	public void updateStore_name(String store_name, int member_num) {
		try {
			getCon();
			String sql = "update member set store_name=? where member_num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, store_name);
			pstmt.setInt(2, member_num);
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("updateStore_name" + e.toString());
		} finally {
			ResouceClose();
		}
	}
	//카테고리명변경
	public int updateStore_c_num(int store_c_num, int member_num) {
		try {
			getCon();
			String sql = "update member set store_c_num=? where member_num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, store_c_num);
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("updateStore_c_num" + e.toString());
		} finally {
			ResouceClose();
		}
		return 0;
	}
	//프로필변경
	public void updateProfile_img(String profile_img, int member_num) {
		try {
			getCon();
			String sql = "update member set profile_img=? where member_num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, profile_img);
			pstmt.setInt(2, member_num);
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("updateProfile_img" + e.toString());
		} finally {
			ResouceClose();
		}
	}

	//템플릿변경
	public void updateTemplate(String template, int member_num) {
		try {
			getCon();
			String sql = "update member set template=? where member_num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, template);
			pstmt.setInt(2, member_num);
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("updateTemplate" + e.toString());
		} finally {
			ResouceClose();
		}
		
	}
		//계좌번호변경
	public void updateAccount(String account, int member_num) {
		try {
			getCon();
			String sql = "update member set account=? where member_num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, account);
			pstmt.setInt(2, member_num);
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("updateAccount" + e.toString());
		} finally {
			ResouceClose();
		}
		
	}

}// memberDAO
