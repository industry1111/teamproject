package com.order.action;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.mail.Store;
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

            String sql = "insert into orders (member_num, total_price, pay_method, regdate, orders_code, order_id,"
                    + "receiver_addr1, receiver_addr2, receiver_addr3, receiver_name, receiver_phone, address_name, receiver_msg,main_product_image,"
                    + "main_product_name, count)"
                    + " values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, dto.getMember_num());
            pstmt.setInt(2, dto.getTotal_price());
            pstmt.setString(3, dto.getPay_method());
            pstmt.setTimestamp(4, dto.getRegdate());
            pstmt.setString(5, dto.getOrders_code());
            pstmt.setString(6, dto.getOrder_id());
            pstmt.setString(7, dto.getReceiver_addr1());
            pstmt.setString(8, dto.getReceiver_addr2());
            pstmt.setString(9, dto.getReceiver_addr3());
            pstmt.setString(10, dto.getReceiver_name());
            pstmt.setString(11, dto.getReceiver_phone());
            pstmt.setString(12, dto.getAddress_name());
            pstmt.setString(13, dto.getReceiver_msg());
            pstmt.setString(14, dto.getMain_product_image());
            pstmt.setString(15, dto.getMain_product_name());
            pstmt.setInt(16, dto.getCount());

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
        }//insert order
    
    // 주문 상세 등록
    public boolean insertOrderDetail(OrderDetailDTO dto) {
        int result = 0; 

        try {
            getCon();

            String sql = "insert into orders_detail (quantity, product_num, product_name, product_price,"
            		+ "image, orders_code,store_num,state)"
            		+ " values(?,?,?,?,?,?,?,?)";
            
            pstmt = con.prepareStatement(sql);
            
            pstmt.setInt(1, dto.getQuantity());
            pstmt.setInt(2, dto.getProduct_num());
            pstmt.setString(3, dto.getProduct_name());
            pstmt.setInt(4, dto.getProduct_price());
            pstmt.setString(5, dto.getImage());
            pstmt.setString(6, dto.getOrders_code());
            pstmt.setInt(7, dto.getStore_num());
            pstmt.setString(8, "0");
         
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
        }//insert orderDetail
    
//    //재고 수정
//    public void updateProductCount(int quantity,int product_num){
//    	
//    	try {
//			
//    		getCon();
//    		
//    		String sql = "update product set product_count = (product_count -?) where product_num = ?";
//    		pstmt = con.prepareStatement(sql);
//    		
//    		pstmt.setInt(1, quantity);
//    		pstmt.setInt(2, product_num);
//    		
//    		pstmt.executeUpdate();
//    		
//		} catch (Exception e) {
//			System.out.println("updateProductCount:" + e.toString());
//		}finally {
//			
//			ResouceClose();
//		}
//
//    }
    
    //장바구니 삭제
    public void deleteBasket(int basket_num){
    	
    	try {
			
    		getCon();
    		
    		String sql = "delete basket from basket where basket_num = ?";
    		pstmt = con.prepareStatement(sql);
    		pstmt.setInt(1, basket_num);
    		
    		pstmt.executeUpdate();
    		
		} catch (Exception e) {
			System.out.println("deleteBasket:" + e.toString());
		}finally {
			ResouceClose();
		}

    }
    
    //멤버 주문내역
    public List<OrderDTO> getOrderInfo(int member_num){
    	
    	
    	List<OrderDTO> list = new ArrayList<OrderDTO>();
    	
    	try {
			getCon();
			
			String sql = "select * from orders where member_num=?";
			sql +=" order by regdate desc";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, member_num);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				
				OrderDTO odto = new OrderDTO();
				odto.setTotal_price(rs.getInt("total_price"));
				odto.setOrders_code(rs.getString("orders_code"));
				odto.setRegdate(rs.getTimestamp("regdate"));
				odto.setAddress_name(rs.getString("address_name"));
				odto.setReceiver_addr1(rs.getString("receiver_addr1"));
				odto.setReceiver_addr2(rs.getString("receiver_addr2"));
				odto.setReceiver_addr3(rs.getString("receiver_addr3"));
				odto.setReceiver_msg(rs.getString("receiver_msg"));
				odto.setReceiver_name(rs.getString("receiver_name"));
				odto.setReceiver_phone(rs.getString("receiver_phone"));
				odto.setOrder_num(rs.getInt("order_num"));
				odto.setMain_product_image(rs.getString("main_product_image"));
				odto.setMain_product_name(rs.getString("main_product_name"));
				odto.setCount(rs.getInt("count"));
				

				list.add(odto);
			}
			
			
			
		} catch (Exception e) {
			
			System.out.println("getOrderInfo:" + e.toString());
			
		}finally {
			ResouceClose();
		}
    	
    	
    	return list;
    }//주문내역 
    
    //주문 상세내역
    public List<OrderDetailDTO> getOrderDetail(String orders_code){
    	
    	List<OrderDetailDTO> list = new ArrayList<OrderDetailDTO>();
    	
    	try {
			getCon();
			
			String sql = "select * from orders_detail where orders_code = ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, orders_code);
			rs = pstmt.executeQuery();
			while(rs.next()){
				
				OrderDetailDTO dto = new OrderDetailDTO();
				
				dto.setOrders_code(rs.getString("orders_code"));
				
				dto.setProduct_name(rs.getString("product_name"));
				dto.setImage(rs.getString("image"));
				dto.setProduct_num(rs.getInt("product_num"));
				dto.setProduct_price(rs.getInt("product_price"));
				dto.setQuantity(rs.getInt("quantity"));
				dto.setStore_num(rs.getInt("store_num"));
				dto.setState(rs.getString("state"));
				
				list.add(dto);
				
			}
			
    		
		} catch (Exception e) {
		
			System.out.println("getOrderDetail:" + e.toString());
			
		}finally {
			ResouceClose();
		}
    	
    	return list;
    	
    }//getOrderDetail
    
    public List<OrderDTO> getOrder(String orders_code){
        
        
        List<OrderDTO> list = new ArrayList<OrderDTO>();
        
        try {
            getCon();
            
            String sql = "select * from orders where orders_code=?";
            
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, orders_code);
            rs = pstmt.executeQuery();
            
            while(rs.next()){
                
                OrderDTO odto = new OrderDTO();
                odto.setTotal_price(rs.getInt("total_price"));
                odto.setOrders_code(rs.getString("orders_code"));
                odto.setRegdate(rs.getTimestamp("regdate"));
                odto.setAddress_name(rs.getString("address_name"));
                odto.setReceiver_addr1(rs.getString("receiver_addr1"));
                odto.setReceiver_addr2(rs.getString("receiver_addr2"));
                odto.setReceiver_addr3(rs.getString("receiver_addr3"));
                odto.setReceiver_msg(rs.getString("receiver_msg"));
                odto.setReceiver_name(rs.getString("receiver_name"));
                odto.setReceiver_phone(rs.getString("receiver_phone"));
                odto.setOrder_num(rs.getInt("order_num"));
                odto.setMain_product_image(rs.getString("main_product_image"));
                odto.setMain_product_name(rs.getString("main_product_name"));
                odto.setCount(rs.getInt("count"));
                odto.setOrder_id(rs.getString("order_id"));
              
                list.add(odto);
            }

        } catch (Exception e) {
            
            System.out.println("getOrderInfo:" + e.toString());
            
        }finally {
            ResouceClose();
        }
        
        
        return list;
    }//주문내역 
    
    //storeOrder
    public List<StoreOrderDTO> getStoreOrder(int store_num){
    	
    	List<StoreOrderDTO> list = new ArrayList<StoreOrderDTO>();

    	try {
			
    		getCon();
    		String sql = "select * from orders join orders_detail on store_num = ?";
    		pstmt = con.prepareStatement(sql);
    		pstmt.setInt(1, store_num);
    		rs = pstmt.executeQuery();
    		
    	while(rs.next()){
    		
    		StoreOrderDTO dto = new StoreOrderDTO();
    		
    		 dto.setTotal_price(rs.getInt("total_price"));
             dto.setOrders_code(rs.getString("orders_code"));
             dto.setRegdate(rs.getTimestamp("regdate"));
             dto.setAddress_name(rs.getString("address_name"));
             dto.setReceiver_addr1(rs.getString("receiver_addr1"));
             dto.setReceiver_addr2(rs.getString("receiver_addr2"));
             dto.setReceiver_addr3(rs.getString("receiver_addr3"));
             dto.setReceiver_msg(rs.getString("receiver_msg"));
             dto.setReceiver_name(rs.getString("receiver_name"));
             dto.setReceiver_phone(rs.getString("receiver_phone"));
             dto.setOrder_num(rs.getInt("order_num"));
             dto.setMain_product_image(rs.getString("main_product_image"));
             dto.setMain_product_name(rs.getString("main_product_name"));
             dto.setCount(rs.getInt("count")); 
             dto.setOrders_code(rs.getString("orders_code"));
			 dto.setProduct_name(rs.getString("product_name"));
			 dto.setImage(rs.getString("image"));
			 dto.setProduct_num(rs.getInt("product_num"));
			 dto.setProduct_price(rs.getInt("product_price"));
			 dto.setQuantity(rs.getInt("quantity"));
			 dto.setStore_num(rs.getInt("store_num"));
			 dto.setState(rs.getString("state"));
			 dto.setOrder_id(rs.getString("order_id"));
             
			 list.add(dto);

    	}

		} catch (Exception e) {
			System.out.println("getStoreOrder"+e.toString());
		}finally {
			ResouceClose();
		}
    
    	return list;
    	
    }
  
}
