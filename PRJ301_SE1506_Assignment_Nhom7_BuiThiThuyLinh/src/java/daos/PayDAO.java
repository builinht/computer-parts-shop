/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.util.Date;
import dtos.CartDTO;
import dtos.OrderDTO;
import dtos.OrderDetailDTO;
import utils.DBUtils;

public class PayDAO {
    public static boolean payCart(CartDTO cart, OrderDTO order) throws SQLException{
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            if(conn != null){
                Date curDate = new Date();
                String orderDate = DateFormat.getInstance().format(curDate);
                String userID = order.getUser().getUserID();
                String orderID = "LL"+userID+orderDate;
                double total = order.getTotal();
                
                String sql = "\nBEGIN TRANSACTION";
                String insertOder = "\nINSERT INTO tblOrders(orderID,userID, date, total)"+
                                    "\nValues('"+orderID+"','"+userID+"','"+orderDate+"',"+total+");";
                sql = sql.concat(insertOder);
                
                for(OrderDetailDTO detailDTO : cart.getCart().values()){
                    int productID = detailDTO.getProduct().getProductID();
                    int quantity = detailDTO.getQuantity();
                    double price = detailDTO.getProduct().getPrice();
                    if(selectCurrentQuantity(detailDTO) >= quantity){
                        String updateQuantity = "\nUpdate tblProducts"+
                            "\nSet quantity = quantity - "+quantity+""+
                            "\nWhere productID = "+productID+";";
                        
                        String insertOrderDetail = "\nINSERT INTO tblOrderDetails(orderID, productID, price, quantity)"+
                                                   "\nvalues('"+orderID+"',"+productID+","+price+","+quantity+");";
                        
                        sql = sql.concat(updateQuantity);
                        sql = sql.concat(insertOrderDetail);
                    }else{
                        String rollBack = "\nROLLBACK TRANSACTION";
                        sql = sql.concat(rollBack);
                        stm = conn.prepareStatement(sql);
                        stm.execute();
                        
                        return false;
                    }
                    
                }
                
                String commit = "\nCOMMIT TRANSACTION";
                sql = sql.concat(commit);
                stm = conn.prepareStatement(sql);
                stm.execute();
                
            }
        } catch (Exception e) {
        } finally {
            if(stm != null) stm.close();
            if(conn != null) conn.close();
        }
        return true;
    }
    
    
    public static int selectCurrentQuantity(OrderDetailDTO dto) throws SQLException{
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        int check = 0;
        try {
            conn = DBUtils.getConnection();
            if(conn != null){
                String sql = "Select quantity \n"+
                            "From tblProducts \n"+
                            "where productID = ?";
                stm = conn.prepareStatement(sql);
                stm.setInt(1, dto.getProduct().getProductID());
                rs = stm.executeQuery(); 
                if(rs.next()){
                    check = rs.getInt("quantity");
                }
            }
        } catch (Exception e) {
            
        } finally {
            if(rs != null) rs.close();
            if(stm != null) stm.close();
            if(conn != null) conn.close();
        }
        return check;
    }
}
