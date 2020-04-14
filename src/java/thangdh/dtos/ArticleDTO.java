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
public class ArticleDTO {

    private int id;
    private String title;
    private String shortDescription;
    private String content;
    private AccountDTO author;
    private Timestamp postingDate;
    private String status;
    private String oldStatus;

    public ArticleDTO() {
    }

    public ArticleDTO(String title, String shortDescription, String content) {
        this.title = title;
        this.shortDescription = shortDescription;
        this.content = content;
    }

    public ArticleDTO(String title, String shortDescription, String content, AccountDTO author, Timestamp postingDate, String status) {
        this.title = title;
        this.shortDescription = shortDescription;
        this.content = content;
        this.author = author;
        this.postingDate = postingDate;
        this.status = status;
    }

    public ArticleDTO(int id, String title, String shortDescription, String content, AccountDTO author, Timestamp postingDate, String status) {
        this.id = id;
        this.title = title;
        this.shortDescription = shortDescription;
        this.content = content;
        this.author = author;
        this.postingDate = postingDate;
        this.status = status;
    }

    public ArticleDTO(int id, String title, String shortDescription, String content, AccountDTO author, Timestamp postingDate, String status, String oldStatus) {
        this.id = id;
        this.title = title;
        this.shortDescription = shortDescription;
        this.content = content;
        this.author = author;
        this.postingDate = postingDate;
        this.status = status;
        this.oldStatus = oldStatus;
    }
    

   

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getShortDescription() {
        return shortDescription;
    }

    public void setShortDescription(String shortDescription) {
        this.shortDescription = shortDescription;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public AccountDTO getAuthor() {
        return author;
    }

    public void setAuthor(AccountDTO author) {
        this.author = author;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Timestamp getPostingDate() {
        return postingDate;
    }

    public void setPostingDate(Timestamp postingDate) {
        this.postingDate = postingDate;
    }


    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getOldStatus() {
        return oldStatus;
    }

    public void setOldStatus(String oldStatus) {
        this.oldStatus = oldStatus;
    }
    

 

}
