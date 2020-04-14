/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thangdh.controllers.articles;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.Calendar;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import thangdh.daos.ArticleDAO;
import thangdh.dtos.AccountDTO;
import thangdh.dtos.ArticleDTO;

/**
 *
 * @author dhtha
 */
public class CreateArticleController extends HttpServlet {

    private final String SUCCESS = "create_article.jsp";
    private final String FAIL = "login.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = SUCCESS;
        try {
            HttpSession session = request.getSession();
            AccountDTO account = (AccountDTO) session.getAttribute("ACCOUNT");
            if (account == null) {
                url = FAIL;
            } else {
                String title = request.getParameter("title");
                String shortDescription = request.getParameter("shortDescription");
                String content = request.getParameter("content");
                if (title != null) {
                    title = title.trim();
                } else {
                    title = "";
                }
                if (shortDescription != null) {
                    shortDescription = shortDescription.trim();
                } else {
                    shortDescription = "";
                }
                if (content == null) {
                    content = "";
                } else {
                    content = content.trim();
                }
                ArticleDAO dao = new ArticleDAO();
                boolean check = true;
                if (title.isEmpty()) {
                    request.setAttribute("TITLE_ERROR", "Title must be required!");
                    check = false;
                } else if (dao.isExistsTitle(title)) {
                    request.setAttribute("TITLE_ERROR", "Title is exists!");
                    check = false;
                }
                if (shortDescription.isEmpty()) {
                    request.setAttribute("SHORT_DESCRIPTION_ERROR", "Short Description must be requied!");
                    check = false;
                }
                if (content.isEmpty()) {
                    request.setAttribute("CONTENT_ERROR", "Content must be required!");
                    check = false;
                }
                if (check) {
                    if (account.getRole().equals("member")) {
                        String status = "New";
                        Calendar cal = Calendar.getInstance();
                        Timestamp postingDate = new Timestamp(System.currentTimeMillis());
                        ArticleDTO dto = new ArticleDTO(title, shortDescription, content, account, postingDate, status);
                        if (dao.insertArticle(dto)) {
                            request.setAttribute("RESULT", 1);
                        } else {
                            request.setAttribute("RESULT", 0);
                            request.setAttribute("ARTICLE", dto);
                        }
                    } else {
                        request.setAttribute("MESSAGE", "Only member can post article!");
                    }
                } else {
                    ArticleDTO dto = new ArticleDTO(title, shortDescription, content);
                    request.setAttribute("ARTICLE", dto);;
                }
            }
        } catch (Exception e) {
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
