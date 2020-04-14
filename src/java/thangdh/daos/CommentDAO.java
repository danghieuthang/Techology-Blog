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
import thangdh.dtos.CommentDTO;
import thangdh.utils.DBUtil;

/**
 *
 * @author dhtha
 */
public class CommentDAO {

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

    public List<CommentDTO> getCommentByArticleID(int articleID) {
        List<CommentDTO> result = new ArrayList<>();
        try {
            String sql = "SELECT C.ID, Message, A.Name, A.Email, PostingDate "
                    + "FROM Comments C, Accounts A "
                    + "WHERE C.Author=A.Email AND ArticleID=? "
                    + "ORDER BY PostingDate DESC";
            conn = DBUtil.getConnection();
            pStm = conn.prepareStatement(sql);
            pStm.setInt(1, articleID);
            rs = pStm.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("ID");
                String message = rs.getString("Message");
                String name = rs.getString("Name");
                String email = rs.getString("Email");
                AccountDTO author = new AccountDTO(email, name);
                Timestamp postingDate = rs.getTimestamp("PostingDate");
                CommentDTO dto = new CommentDTO(id, message, author, email, postingDate);
                result.add(dto);
            }
        } catch (Exception e) {
        } finally {
            closeConnection();
        }
        return result;
    }

    public boolean insertComment(CommentDTO dto) {
        boolean result = false;
        try {
            String sql = "INSERT INTO Comments(Message, Author, ArticleID, PostingDate) "
                    + "VALUES(?,?,?,?)";
            conn = DBUtil.getConnection();
            pStm = conn.prepareStatement(sql);

            pStm.setString(1, dto.getMessage());
            pStm.setString(2, dto.getAuthor().getEmail());
            pStm.setString(3, dto.getArticleID());
            pStm.setTimestamp(4, dto.getPostingDate());
            result = pStm.executeUpdate() > 0;
        } catch (Exception e) {
        } finally {
            closeConnection();
        }
        return result;
    }

}
