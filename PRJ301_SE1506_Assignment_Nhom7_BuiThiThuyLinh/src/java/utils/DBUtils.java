/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;


public class DBUtils {
    public static Connection getConnection() throws ClassNotFoundException, SQLException {
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        String url = "jdbc:sqlserver://localhost:1433;databaseName=PRJ301_SE1506_Assignment_BuiThiThuyLinh";
//         String url = "jdbc:sqlserver://LAPTOP-ADMKH3M5\\ENDY:1433;databaseName=FPTStudentBlog";
        Connection conn = DriverManager.getConnection(url, "sa", "123456");
        return conn;
    }
    
}
