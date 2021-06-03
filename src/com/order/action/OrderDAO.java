package com.order.action;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class OrderDAO {
    
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
    
 // 주문 등록
    public boolean insertOrder(OrderDTO dto) {
        int result = 0; 

        try {
            getCon();

            String sql = "insert into orders (member_num, total_price, pay_method, state, regdate, orders_code,"
                    + "receiver_addr1, receiver_addr2, receiver_addr3, receiver_name, receiver_phone, address_name)"
                    + " values(?,?,?,?,?,?,?,?,?,?,?,?)";
            
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, dto.getMember_num());
            pstmt.setInt(2, dto.getTotal_price());
            pstmt.setString(3, dto.getPay_method());
            pstmt.setString(4, "0");
            pstmt.setTimestamp(5, dto.getRegdate());
            pstmt.setString(6, dto.getOrders_code());
            pstmt.setString(7, dto.getReceiver_addr1());
            pstmt.setString(8, dto.getReceiver_addr2());
            pstmt.setString(9, dto.getReceiver_addr3());
            pstmt.setString(10, dto.getReceiver_name());
            pstmt.setString(11, dto.getReceiver_phone());
            pstmt.setString(12, dto.getAddress_name());

            result = pstmt.executeUpdate();
            
             if (result != 0) {
                return true;
            }

            } catch (Exception e) {
                System.out.println("insertOrder:" + e.toString());
            } finally {
                ResouceClose();
            }
            return false;
        }

}
