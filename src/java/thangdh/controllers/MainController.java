/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thangdh.controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author dhtha
 */
public class MainController extends HttpServlet {

    private static final String LOGIN_PAGE = "login.jsp";
    private static final String LOGIN = "LoginController";
    private static final String LOGOUT = "LogoutController";
    private static final String HOME_PAGE = "index.jsp";
    private static final String REGISTRATION_PAGE = "registration.jsp";
    private static final String REGISTRATION = "RegistrationController";
    private static final String SEARCH = "SearchArticleController";
    private static final String DETAIL = "DetailArticleController";
    private static final String COMMENT = "CommentController";
    private static final String PROCESS_PAGE = "SearchArticleController";
    private static final String CREATE_ARTICLE_PAGE = "create_article.jsp";
    private static final String CREATE_ARTICLE = "CreateArticleController";
    private static final String PROCESS = "ProcessController";
    private static final String UPDATE_ARTICLE = "UpdateSingleArticleController";
    private static final String UPDATE_ARTICLE_PAGE = "UpdateDetailArticleController";
    private static final String AUTHENTICATION = "AuthenticationController";
    private static final String PROFILEPAGE = "profile.jsp";
    private static final String UPDATEPROFILE = "UpdateAccountController";
    private static final String MYARTICLE = "MyArticleController";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = HOME_PAGE;
        try {
            String action = request.getParameter("action");
            switch (action) {
                case "Login Page":
                    url = LOGIN_PAGE;
                    break;
                case "Login":
                    url = LOGIN;
                    break;
                case "Logout":
                    url = LOGOUT;
                    break;
                case "Registration Page":
                    url = REGISTRATION_PAGE;
                    break;
                case "Registration":
                    url = REGISTRATION;
                    break;
                case "Home":
                    url = HOME_PAGE;
                    break;
                case "My Article":
                    url = MYARTICLE;
                    break;
                case "Search":
                    url = SEARCH;
                    break;
                case "Detail":
                    url = DETAIL;
                    break;
                case "Comment":
                    url = COMMENT;
                    break;
                case "Process Page":
                    url = PROCESS_PAGE;
                    break;
                case "Article Page":
                    url = CREATE_ARTICLE_PAGE;
                    break;
                case "Create Article":
                    url = CREATE_ARTICLE;
                    break;
                case "Approval":
                    url = PROCESS;
                    break;
                case "Deleted":
                    url = PROCESS;
                    break;
                case "Restore":
                    url = PROCESS;
                    break;
                case "View Article":
                    url = UPDATE_ARTICLE_PAGE;
                    break;
                case "Update Article":
                    url = UPDATE_ARTICLE;
                    break;
                case "Authentication":
                    url = AUTHENTICATION;
                    break;
                case "Profile":
                    url = PROFILEPAGE;
                    break;
                case "Update Profile":
                    url = UPDATEPROFILE;
                    break;
                default:
                    url = HOME_PAGE;
            }
        } catch (Exception e) {
            log("Error at MainController: " + e.toString());
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
