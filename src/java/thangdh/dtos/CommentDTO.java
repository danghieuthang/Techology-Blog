/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thangdh.dtos;

import java.sql.Timestamp;

/**
 *
 * @author dhtha
 */
public class CommentDTO {

    private int id;
    private String message;
    private AccountDTO author;
    private String articleID;
    private Timestamp postingDate;

    public CommentDTO() {
    }

    public CommentDTO(String message, AccountDTO author, String articleID, Timestamp postingDate) {
        this.message = message;
        this.author = author;
        this.articleID = articleID;
        this.postingDate = postingDate;
    }

    public CommentDTO(int id, String message, AccountDTO author, String articleID, Timestamp postingDate) {
        this.id = id;
        this.message = message;
        this.author = author;
        this.articleID = articleID;
        this.postingDate = postingDate;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public AccountDTO getAuthor() {
        return author;
    }

    public void setAuthor(AccountDTO author) {
        this.author = author;
    }

    public String getArticleID() {
        return articleID;
    }

    public void setArticleID(String articleID) {
        this.articleID = articleID;
    }

    public Timestamp getPostingDate() {
        return postingDate;
    }

    public void setPostingDate(Timestamp postingDate) {
        this.postingDate = postingDate;
    }

  


}
