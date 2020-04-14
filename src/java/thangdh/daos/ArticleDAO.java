/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thangdh.daos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import thangdh.dtos.AccountDTO;
import thangdh.dtos.ArticleDTO;
import thangdh.utils.DBUtil;

/**
 *
 * @author dhtha
 */
public class ArticleDAO {

    private Connection conn = null;
    private PreparedStatement pStm = null;
    private ResultSet rs = null;

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

    public ArticleDAO() {
    }

    public int getSize() {
        int result = 0;
        try {
            String sql = "SELECT COUNT(ID) AS Size FROM Articles ";
            conn = DBUtil.getConnection();
            pStm = conn.prepareStatement(sql);
            rs = pStm.executeQuery();
            if (rs.next()) {
                result = rs.getInt("Size");
            }
        } catch (Exception e) {
        } finally {
            closeConnection();
        }
        return result;
    }

    public boolean isExistsTitle(String title) {
        boolean result = true;
        try {
            String sql = "SELECT Title FROM Articles WHERE Title=?";
            conn = DBUtil.getConnection();
            pStm = conn.prepareStatement(sql);
            pStm.setString(1, title);
            rs = pStm.executeQuery();
            result = rs.next();

        } catch (Exception e) {
        } finally {
            closeConnection();
        }
        return result;
    }

    public boolean insertArticle(ArticleDTO dto) {
        boolean result = false;
        try {
            String sql = "INSERT INTO Articles (Title, ShortDescription, Content, Author,PostingDate, Status) "
                    + "VALUES(?,?,?,?,?,?)";
            conn = DBUtil.getConnection();
            pStm = conn.prepareStatement(sql);

            pStm.setString(1, dto.getTitle());
            pStm.setString(2, dto.getShortDescription());
            pStm.setString(3, dto.getContent());
            pStm.setString(4, dto.getAuthor().getEmail());
            pStm.setTimestamp(5, dto.getPostingDate());
            pStm.setString(6, dto.getStatus());
            result = pStm.executeUpdate() > 0;
        } catch (Exception e) {
        } finally {
            closeConnection();
        }
        return result;
    }

    public List<ArticleDTO> search(String searchValue, String status) {
        List<ArticleDTO> result = new ArrayList<>();
        try {
            String sql = "SELECT ID, Title, ShortDescription, Content, AC.Name, AC.Email, PostingDate, AR.Status "
                    + "FROM Articles as AR, Accounts as AC "
                    + "WHERE Content LIKE ? AND AR.Author=AC.Email AND AR.Status = ? "
                    + "ORDER BY PostingDate DESC";
            conn = DBUtil.getConnection();
            pStm = conn.prepareStatement(sql);
            pStm.setString(1, "%" + searchValue + "%");
            pStm.setString(2, status);
            rs = pStm.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("ID");
                String title = rs.getString("Title");
                String shortDescription = rs.getString("ShortDescription");
                String content = rs.getString("Content");
                String name = rs.getString("Name");
                String email = rs.getString("Email");
                Timestamp postingDate = rs.getTimestamp("PostingDate");
                status = rs.getString("Status");
                ArticleDTO dto = new ArticleDTO(id, title, shortDescription, content, new AccountDTO(email, name), postingDate, status);
                result.add(dto);
            }
        } catch (Exception e) {
        } finally {
            closeConnection();
        }
        return result;
    }

    public List<ArticleDTO> search(String titleSearch, String searchValue, String status) {
        List<ArticleDTO> result = new ArrayList<>();
        try {
            String sql = "SELECT ID, Title, ShortDescription, Content, AC.Name, AC.Email, PostingDate, AR.Status "
                    + "FROM Articles as AR, Accounts as AC "
                    + "WHERE Content LIKE ? AND AR.Author=AC.Email AND AR.Status = ? AND AR.Title LIKE ? "
                    + "ORDER BY PostingDate DESC";
            conn = DBUtil.getConnection();
            pStm = conn.prepareStatement(sql);
            pStm.setString(1, "%" + searchValue + "%");
            pStm.setString(2, status);
            pStm.setString(3, "%" + titleSearch + "%");
            rs = pStm.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("ID");
                String title = rs.getString("Title");
                String shortDescription = rs.getString("ShortDescription");
                String content = rs.getString("Content");
                String name = rs.getString("Name");
                String email = rs.getString("Email");
                Timestamp postingDate = rs.getTimestamp("PostingDate");
                status = rs.getString("Status");
                ArticleDTO dto = new ArticleDTO(id, title, shortDescription, content, new AccountDTO(email, name), postingDate, status);
                result.add(dto);
            }
        } catch (Exception e) {
        } finally {
            closeConnection();
        }
        return result;
    }



    public List<ArticleDTO> getAllArticleByAuthor(String author) {
        List<ArticleDTO> result = new ArrayList<>();
        try {
            String sql = "SELECT ID, Title, ShortDescription, Content, AC.Name, AC.Email, PostingDate, AR.Status "
                    + "FROM Articles as AR, Accounts as AC "
                    + "WHERE AR.Author=AC.Email  AND AC.Email=? "
                    + "ORDER BY PostingDate DESC";
            conn = DBUtil.getConnection();
            pStm = conn.prepareStatement(sql);
            pStm.setString(1, author);
            rs = pStm.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("ID");
                String title = rs.getString("Title");
                String shortDescription = rs.getString("ShortDescription");
                String content = rs.getString("Content");
                String name = rs.getString("Name");
                String email = rs.getString("Email");
                Timestamp postingDate = rs.getTimestamp("PostingDate");
                String status = rs.getString("Status");
                ArticleDTO dto = new ArticleDTO(id, title, shortDescription, content, new AccountDTO(email, name), postingDate, status);
                result.add(dto);
            }
        } catch (Exception e) {
        } finally {
            closeConnection();
        }
        return result;
    }

    public boolean isExistsArticle(String id) {
        boolean result = false;
        try {
            String sql = "SELECT ID FROM Comments WHERE ID=?";
            conn = DBUtil.getConnection();
            pStm = conn.prepareStatement(sql);
            pStm.setString(1, id);
            rs = pStm.executeQuery();
            result = rs.next();
        } catch (Exception e) {
        } finally {
            closeConnection();
        }
        return result;
    }

    public ArticleDTO getArticleByID(int id) {
        ArticleDTO result = null;
        try {
            String sql = "SELECT Title, ShortDescription, Content,  AC.Name,AC.Email, PostingDate, AR.Status "
                    + " FROM Articles AR, Accounts AC "
                    + " WHERE ID=? AND AR.Author=AC.Email";
            conn = DBUtil.getConnection();
            pStm = conn.prepareStatement(sql);
            pStm.setInt(1, id);
            rs = pStm.executeQuery();
            if (rs.next()) {
                String title = rs.getString("Title");
                String shortDescription = rs.getString("ShortDescription");
                String content = rs.getString("Content");
                String name = rs.getString("Name");
                String email = rs.getString("Email");
                Timestamp postingDate = rs.getTimestamp("PostingDate");
                String status = rs.getString("Status");
                result = new ArticleDTO(id, title, shortDescription, content, new AccountDTO(email, name), postingDate, status);
            }
        } catch (Exception e) {
        } finally {
            closeConnection();
        }
        return result;
    }

    public boolean updateStatus(int id, String status) {
        boolean result = false;
        try {
            String sql = "UPDATE Articles "
                    + "SET Status=? "
                    + "WHERE ID=?";
            conn = DBUtil.getConnection();
            pStm = conn.prepareStatement(sql);
            pStm.setString(1, status);
            pStm.setInt(2, id);
            result = pStm.executeUpdate() > 0;
        } catch (Exception e) {
        } finally {
            closeConnection();
        }
        return result;
    }

    public boolean updateOldStatusAfterDeleted(int id, String status) {
        boolean result = false;
        try {
            String sql = "UPDATE Articles "
                    + "SET OldStatus=? "
                    + "WHERE ID=?";
            conn = DBUtil.getConnection();
            pStm = conn.prepareStatement(sql);
            pStm.setString(1, status);
            pStm.setInt(2, id);
            result = pStm.executeUpdate() > 0;
        } catch (Exception e) {
        } finally {
            closeConnection();
        }
        return result;
    }

    public String getStatusByID(int id) {
        String result = "";
        try {
            String sql = "SELECT Status FROM Articles WHERE ID=?";
            conn = DBUtil.getConnection();
            pStm = conn.prepareStatement(sql);
            pStm.setInt(1, id);
            rs = pStm.executeQuery();
            if (rs.next()) {
                result = rs.getString("Status");
            }
        } catch (Exception e) {
        } finally {
            closeConnection();
        }
        return result;
    }

    public String getOldStatusByID(int id) {
        String result = "";
        try {
            String sql = "SELECT OldStatus FROM Articles WHERE ID=?";
            conn = DBUtil.getConnection();
            pStm = conn.prepareStatement(sql);
            pStm.setInt(1, id);
            rs = pStm.executeQuery();
            if (rs.next()) {
                result = rs.getString("OldStatus");
            }
        } catch (Exception e) {
        } finally {
            closeConnection();
        }
        return result;
    }
}
