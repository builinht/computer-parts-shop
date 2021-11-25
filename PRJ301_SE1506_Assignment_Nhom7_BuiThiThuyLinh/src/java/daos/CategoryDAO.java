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
import java.util.ArrayList;
import dtos.CategoryDTO;
import utils.DBUtils;


public class CategoryDAO {
    public static ArrayList<CategoryDTO> getAllCategory() throws SQLException{
        ArrayList<CategoryDTO> list = null;
        Connection cnn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            cnn = DBUtils.getConnection();
            if(cnn != null){
                String sql = "Select categoryID, categoryName\n" +
                             "From tblCategorys \n";
                stm = cnn.prepareStatement(sql);
                rs = stm.executeQuery();
                while(rs.next()){
                    if(list == null) list = new ArrayList<>();
                    list.add(new CategoryDTO(rs.getInt("categoryID"),
                            rs.getString("categoryName")));
                }
            }
        } catch (Exception e) {
            
        } finally {
            if(rs != null) rs.close();
            if(stm != null) stm.close();
            if(cnn != null) cnn.close();
        }
        return list;
    }
}
