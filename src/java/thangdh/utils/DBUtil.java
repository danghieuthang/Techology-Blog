/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thangdh.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author dhtha
 */
public class DBUtil {

    public static Connection getConnection() throws ClassNotFoundException, SQLException {
        Connection conn = null;
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        String sql = "jdbc:sqlserver://localhost:1433;databaseName=SimpleBlog";
        conn = DriverManager.getConnection(sql, "sa", "12345678");
        return conn;
    }
}
