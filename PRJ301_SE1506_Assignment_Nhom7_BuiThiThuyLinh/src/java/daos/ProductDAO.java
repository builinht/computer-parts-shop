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
import dtos.ProductDTO;
import utils.DBUtils;


public class ProductDAO {
    public static ArrayList<ProductDTO> getAvailableProduct() throws SQLException{
        ArrayList<ProductDTO> list = null;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if(conn != null){
                String sql = "Select productID, title, price, image, supplier, importDate = CONVERT(VARCHAR(10), importDate, 110), quantity, categoryID \n"+
                             "From tblProducts \n"+
                             "Where status = 'true'";
                stm = conn.prepareStatement(sql);
                rs = stm.executeQuery();
                while(rs.next()){
                    if(list == null) list = new ArrayList<>();
                    list.add(new ProductDTO(rs.getInt("productID"),
                            rs.getString("title"),
                            rs.getDouble("price"),
                            rs.getString("image"), 
                            rs.getString("supplier"), 
                            rs.getString("importDate"),
                            rs.getInt("quantity"),
                            rs.getInt("categoryID"),
                            true));
                }
            }
        } catch (Exception e) {
            
        } finally {
            if(rs != null) rs.close();
            if(stm != null) stm.close();
            if(conn != null) conn.close();
        }
        return list;
    }
    
    public static ArrayList<ProductDTO> getAllProduct() throws SQLException{
        ArrayList<ProductDTO> list = null;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if(conn != null){
                String sql = "Select productID, title, price, image, supplier, importDate = CONVERT(VARCHAR(10), importDate, 110), quantity, categoryID, status \n"+
                             "From tblProducts \n";
                stm = conn.prepareStatement(sql);
                rs = stm.executeQuery();
                while(rs.next()){
                    if(list == null) list = new ArrayList<>();
                    list.add(new ProductDTO(rs.getInt("productID"),
                            rs.getString("title"),
                            rs.getDouble("price"),
                            rs.getString("image"), 
                            rs.getString("supplier"), 
                            rs.getString("importDate"),
                            rs.getInt("quantity"),
                            rs.getInt("categoryID"),
                            rs.getBoolean("status")));
                }
            }
        } catch (Exception e) { 
            
        } finally {
            if(rs != null) rs.close();
            if(stm != null) stm.close();
            if(conn != null) conn.close();
        }
        return list;
    }
    
    public static ProductDTO getProductByID(int productID) throws SQLException{
        ProductDTO product = null;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if(conn != null){
                String sql = "Select productID, title, price, image, supplier, importDate = CONVERT(VARCHAR(10), importDate, 110), quantity, categoryID \n"+
                             "From tblProducts \n"+
                             "Where productID = ? ";
                stm = conn.prepareStatement(sql);
                stm.setInt(1, productID);
                rs = stm.executeQuery();
                if(rs.next()){
                    product = new ProductDTO(rs.getInt("productID"),
                            rs.getString("title"),
                            rs.getDouble("price"),
                            rs.getString("image"), 
                            rs.getString("supplier"), 
                            rs.getString("importDate"),
                            rs.getInt("quantity"),
                            rs.getInt("categoryID"),
                            true);
                }
            }
        } catch (Exception e) {
        } finally {
            if(rs != null) rs.close();
            if(stm != null) stm.close();
            if(conn != null) conn.close();
        }
        return product;
    }
    
    public static ArrayList<ProductDTO> getAllProductByCategory(int categoryID) throws SQLException{
        ArrayList<ProductDTO> list = null;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if(conn != null){
                String sql = "Select productID, title, price, image, supplier, importDate = CONVERT(VARCHAR(10), importDate, 110), quantity, categoryID\n"+
                             "From tblProducts \n"+
                             "Where categoryID = ?";
                stm = conn.prepareStatement(sql);
                stm.setInt(1, categoryID);
                rs = stm.executeQuery();
                while(rs.next()){
                    if(list == null) list = new ArrayList<>();
                    list.add(new ProductDTO(rs.getInt("productID"),
                            rs.getString("title"),
                            rs.getDouble("price"),
                            rs.getString("image"), 
                            rs.getString("supplier"), 
                            rs.getString("importDate"),
                            rs.getInt("quantity"),
                            rs.getInt("categoryID"),
                            true));
                }
            }
        } catch (Exception e) {
        } finally {
            if(rs != null) rs.close();
            if(stm != null) stm.close();
            if(conn != null) conn.close();
        }
        return list;
    }
    
    public static ArrayList<ProductDTO> getAvailableProductByCategory(int categoryID) throws SQLException{
        ArrayList<ProductDTO> list = null;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if(conn != null){
                String sql = "Select productID, title, price, image, supplier, importDate = CONVERT(VARCHAR(10), importDate, 110), quantity, categoryID\n"+
                             "From tblProducts \n"+
                             "Where categoryID = ? and status = 'true'";
                stm = conn.prepareStatement(sql);
                stm.setInt(1, categoryID);
                rs = stm.executeQuery();
                while(rs.next()){
                    if(list == null) list = new ArrayList<>();
                    list.add(new ProductDTO(rs.getInt("productID"),
                            rs.getString("title"),
                            rs.getDouble("price"),
                            rs.getString("image"), 
                            rs.getString("supplier"), 
                            rs.getString("importDate"),
                            rs.getInt("quantity"),
                            rs.getInt("categoryID"),
                            true));
                }
            }
        } catch (Exception e) {
        } finally {
            if(rs != null) rs.close();
            if(stm != null) stm.close();
            if(conn != null) conn.close();
        }
        return list;
    }
    
    public static ArrayList<ProductDTO> getAvailableProductByTile(String title) throws SQLException{
        ArrayList<ProductDTO> list = null;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if(conn != null){
                String sql = "Select productID, title, price, image, supplier, importDate = CONVERT(VARCHAR(10), importDate, 110), quantity, categoryID\n"+
                             "From tblProducts \n"+
                             "Where title like ? and status = 'true'";
                stm = conn.prepareStatement(sql);
                stm.setString(1, "%"+ title + "%");
                rs = stm.executeQuery();
                while(rs.next()){
                    if(list == null) list = new ArrayList<>();
                    list.add(new ProductDTO(rs.getInt("productID"),
                            rs.getString("title"),
                            rs.getDouble("price"),
                            rs.getString("image"), 
                            rs.getString("supplier"), 
                            rs.getString("importDate"),
                            rs.getInt("quantity"),
                            rs.getInt("categoryID"),
                            true));
                }
            }
        } catch (Exception e) {
        } finally {
            if(rs != null) rs.close();
            if(stm != null) stm.close();
            if(conn != null) conn.close();
        }
        return list;
    }
    
    public static ArrayList<ProductDTO> getAllProductByTile(String title) throws SQLException{
        ArrayList<ProductDTO> list = null;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if(conn != null){
                String sql = "Select productID, title, price, image, supplier, importDate = CONVERT(VARCHAR(10), importDate, 110), quantity, categoryID\n"+
                             "From tblProducts \n"+
                             "Where title like ?"; 
                stm = conn.prepareStatement(sql);
                stm.setString(1, "%"+ title + "%");
                rs = stm.executeQuery();
                while(rs.next()){
                    if(list == null) list = new ArrayList<>();
                    list.add(new ProductDTO(rs.getInt("productID"),
                            rs.getString("title"),
                            rs.getDouble("price"),
                            rs.getString("image"), 
                            rs.getString("supplier"), 
                            rs.getString("importDate"),
                            rs.getInt("quantity"),
                            rs.getInt("categoryID"),
                            true));
                }
            }
        } catch (Exception e) {
        } finally {
            if(rs != null) rs.close();
            if(stm != null) stm.close();
            if(conn != null) conn.close();
        }
        return list;
    }
    
    public static boolean updateStatusProduct(int productID, boolean status) throws SQLException{
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            if(conn != null){
                String sql = "Update tblProducts\n"+
                             "Set status = ? \n"+
                             "Where productID = ?";
                stm = conn.prepareStatement(sql);
                stm.setBoolean(1, status);
                stm.setInt(2, productID);
                
                check = stm.executeUpdate() > 0 ? true: check;
            }
        } catch (Exception e) {
            
        } finally {
            if(stm != null) stm.close();
            if(conn != null) conn.close();
        }
        return check;
    }
    
    public static boolean updateProduct(ProductDTO product) throws SQLException{
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            if(conn != null){
                String sql = "Update tblProducts \n"+
                             "Set title = ?, Image = ?, supplier = ?, quantity = ?, price = ?, importDate = ?, categoryID = ? \n"+
                             "Where productID = ?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, product.getTitle());
                stm.setString(2, product.getImage());
                stm.setString(3, product.getSupplier());
                stm.setInt(4, product.getQuantity());
                stm.setDouble(5, product.getPrice());
                stm.setString(6, product.getImportDate());
                stm.setInt(7, product.getCategoryID());
                stm.setInt(8, product.getProductID());
                
                check = stm.executeUpdate() > 0 ? true:check;
            }
        } catch (Exception e) {
            
        } finally {
            if(stm != null) stm.close();
            if(conn != null) conn.close();
        }
        return check;
    }
    
    public static boolean insertProduct(ProductDTO product) throws SQLException{
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            if(conn != null){
                String sql = "Insert into tblProducts(title, image, supplier, quantity, price, importDate, categoryID, status) \n"+
                             "Values (?,?,?,?,?,?,?,'true')";
                stm = conn.prepareStatement(sql);
                stm.setString(1, product.getTitle());
                stm.setString(2, product.getImage());
                stm.setString(3, product.getSupplier());
                stm.setInt(4, product.getQuantity());
                stm.setDouble(5, product.getPrice());
                stm.setString(6, product.getImportDate());
                stm.setInt(7, product.getCategoryID());
                
                check = stm.executeUpdate() > 0 ? true:check;
            }
        } catch (Exception e) {
            
        } finally {
            if(stm != null) stm.close();
            if(conn != null) conn.close();
        }
        return check;
    }
}
