/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thangdh.controllers.accounts;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import thangdh.daos.AccountDAO;
import thangdh.dtos.AccountDTO;

/**
 *
 * @author dhtha
 */
public class LoginController extends HttpServlet {

    private static final String SUCCESS = "SearchArticleController";
    private static final String FAIL = "login.jsp";
    private static final String LOGIN_COMMENT = "DetailArticleController";
    private static final String LOGIN_CREATE_ARTICLE = "create_article.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = FAIL;
        try {
            String email = request.getParameter("email");
            String password = request.getParameter("password");
           
            password = org.apache.commons.codec.digest.DigestUtils.sha256Hex(password);
            AccountDAO dao = new AccountDAO();
            if (email != null && password != null) {
                if (!dao.isExistsEmail(email)) {
                    request.setAttribute("MESSAGE", "Account not found!");
                    request.setAttribute("EMAIL", email);
                } else {
                    AccountDTO account = dao.checkLogin(email, password);
                    if (account != null) {
                        url = SUCCESS;
                        HttpSession session = request.getSession();
                        session.setAttribute("ACCOUNT", account);
                        request.setAttribute("MESSAGE", "Hello to Technology Blog");
                    } else {
                        request.setAttribute("MESSAGE", "Password is not correct!");
                        request.setAttribute("EMAIL", email);
                    }
                }
            }

        } catch (Exception e) {
        } finally {
            response.sendRedirect(url);
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
