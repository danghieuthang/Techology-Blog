/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thangdh.daos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import thangdh.dtos.AccountDTO;
import thangdh.utils.DBUtil;

/**
 *
 * @author dhtha
 */
public class AccountDAO {

    private Connection conn = null;
    private PreparedStatement pStm = null;
    private ResultSet rs = null;

    public AccountDAO() {
    }

    private void closeConnection() {
        try {
            if (rs != null) {
                rs.close();
            }
            if (pStm != null) {
                pStm.close();
            }
            if (conn != null) {
                conn.close();
            }
        } catch (Exception e) {
        }
    }

    public boolean isExistsEmail(String email) {
        boolean result = true;
        try {
            conn = DBUtil.getConnection();
            String sql = "SELECT Email FROM Accounts WHERE Email=?";
            pStm = conn.prepareStatement(sql);
            pStm.setString(1, email);
            rs = pStm.executeQuery();
            result = rs.next();
        } catch (Exception e) {
        } finally {
            closeConnection();
        }
        return result;
    }

    public boolean updateStatusByEmail(String email, String status) {
        boolean result = false;
        try {
            String sql = "UPDATE Accounts "
                    + "SET Status=? "
                    + "WHERE Email=?";
            conn = DBUtil.getConnection();
            pStm = conn.prepareStatement(sql);
            pStm.setString(1, status);
            pStm.setString(2, email);
            result = pStm.executeUpdate() > 0;
        } catch (Exception e) {
        } finally {
            closeConnection();
        }
        return result;
    }

    public boolean updateAccount(AccountDTO dto) {
        boolean result = false;
        try {
            String sql = "UPDATE Accounts "
                    + "SET Name=?,  "
                    + "Password=? "
                    + "WHERE Email=?";
            conn = DBUtil.getConnection();
            pStm = conn.prepareStatement(sql);
            pStm.setString(1, dto.getName());
            pStm.setString(2, dto.getPassword());
            pStm.setString(3, dto.getEmail());
            result = pStm.executeUpdate() > 0;
        } catch (Exception e) {
        } finally {
            closeConnection();
        }
        return result;
    }

    public AccountDTO getAccountByEmail(String email) {
        AccountDTO result = null;
        try {
            conn = DBUtil.getConnection();
            String sql = "SELECT Name, Password, Role, Status FROM Accounts WHERE Email=?";
            pStm = conn.prepareStatement(sql);
            pStm.setString(1, email);
        
            rs = pStm.executeQuery();
            if (rs.next()) {
                String name = rs.getString("Name");
                String role = rs.getString("Role");
                String status = rs.getString("Status");
                String password=rs.getString("Password");
                   
                result = new AccountDTO(email, name, password, role, status);
            }
        } catch (Exception e) {
        } finally {
            closeConnection();
        }
        return result;
    }

    public AccountDTO checkLogin(String email, String password) {
        AccountDTO result = null;
        try {
            conn = DBUtil.getConnection();
            String sql = "SELECT Name, Role, Status FROM Accounts WHERE Email=? AND Password=?";
            pStm = conn.prepareStatement(sql);
            pStm.setString(1, email);
            pStm.setString(2, password);
            rs = pStm.executeQuery();
            if (rs.next()) {
                String name = rs.getString("Name");
                String role = rs.getString("Role");
                String status = rs.getString("Status");
                result = new AccountDTO(email, name, password, role, status);
            }
        } catch (Exception e) {
        } finally {
            closeConnection();
        }
        return result;
    }

    public boolean insertAccount(AccountDTO dto) {
        boolean result = false;
        try {
            conn = DBUtil.getConnection();
            String sql = "INSERT INTO Accounts(Email, Name, Password, Role, Status) "
                    + "VALUES(?,?,?,?,?)";
            pStm = conn.prepareStatement(sql);
            pStm.setString(1, dto.getEmail());
            pStm.setString(2, dto.getName());
            pStm.setString(3, dto.getPassword());
            pStm.setString(4, dto.getRole());
            pStm.setString(5, dto.getStatus());
            result = pStm.executeUpdate() > 0;
        } catch (Exception e) {
        } finally {
            closeConnection();
        }
        return result;
    }
}
