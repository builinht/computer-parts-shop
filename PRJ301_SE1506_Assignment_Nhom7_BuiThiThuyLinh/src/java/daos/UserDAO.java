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
import javax.naming.NamingException;
import dtos.UserDTO;
import utils.DBUtils;


public class UserDAO {
    public UserDTO checkLogin(String userID, String password) throws SQLException, NamingException, ClassNotFoundException {
        UserDTO result = null;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT fullName, phone, address, email, roleID FROM tblUsers WHERE userID =? AND password =? AND status = 'true'";
                stm = conn.prepareStatement(sql);
                stm.setString(1, userID);
                stm.setString(2, password);
                rs = stm.executeQuery();
                if (rs.next()) {
                    String fullName = rs.getString("fullName");
                    String roleID = rs.getString("roleID");
                    String email = rs.getString("email");
                    String address = rs.getString("address");
                    String phone = rs.getString("phone");
                    result = new UserDTO(userID, password, fullName, address, email, phone, roleID, true);
                }
            }
        } catch (SQLException e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return result;
    }
    
    public static boolean insertUser(UserDTO user) throws SQLException{
        Connection conn = null;
        PreparedStatement stm = null;
        boolean check = false;
        try {
            conn = DBUtils.getConnection();
            if(conn != null){
                String sql = "Insert into tblUsers(userID, password, fullName, email, phone, address, roleID, status) \n"+
                            "Values (?,?,?,?,?,?,?,'true')";
                stm = conn.prepareStatement(sql);
                stm.setString(1, user.getUserID());
                stm.setString(2, user.getPassword());
                stm.setString(3, user.getFullName());
                stm.setString(4, user.getEmail());
                stm.setString(5, user.getPhone());
                stm.setString(6, user.getAddress());
                stm.setString(7, user.getRoleID());
                
                check = stm.executeUpdate() > 0 ? true:check;
            }
        } catch (Exception e) {
        } finally {
            
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }
}
