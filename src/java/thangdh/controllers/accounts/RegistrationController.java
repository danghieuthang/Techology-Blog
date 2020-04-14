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
public class RegistrationController extends HttpServlet {

    private final String SUCCESS = "index.jsp";
    private final String FAIL = "registration.jsp";
    private final String AUTHENTICATION = "AuthenticationController";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = FAIL;
        try {
            String email = request.getParameter("email");
            String name = request.getParameter("name");
            String password = request.getParameter("password");
            String rePassword = request.getParameter("rePassword");
            boolean check = true;
            AccountDAO dao = new AccountDAO();
            if (name == null || name.isEmpty()) {
                request.setAttribute("NAME_ERROR", "Name must be required!");
                check = false;
            }
            if (email == null || email.isEmpty()) {
                request.setAttribute("EMAIL_ERROR", "Email must be required!");
                check = false;
            } else if (!email.matches("^[a-z][a-z0-9_\\.]{2,32}@[a-z0-9]{2,}(\\.[a-z0-9]{2,4}){1,2}$")) {
                request.setAttribute("EMAIL_ERROR", "Email format like example@email.ex!");
                check = false;
            } else if (dao.isExistsEmail(email)) {
                request.setAttribute("EMAIL_ERROR", "Email already exists!");
            }
            if (password == null || password.isEmpty()) {
                request.setAttribute("PASSWORD_ERROR", "Password must be required!");
                check = false;
            } else if (rePassword == null || !rePassword.equals(password)) {
                request.setAttribute("REPASSWORD_ERROR", "RePassword not same password!");
                check = false;
            }
            String role = "member";
            String status = "New";
            String encryPassword = org.apache.commons.codec.digest.DigestUtils.sha256Hex(password);
            AccountDTO dto = new AccountDTO(email, name, encryPassword, role, status);
            if (check) {
                if (dao.insertAccount(dto)) {
                    HttpSession session = request.getSession();
                    session.setAttribute("ACCOUNT", dto);
                    request.setAttribute("EMAIL", email);
                    url = AUTHENTICATION;
                } else {
                    request.setAttribute("MESSAGE", "Registration fail!");
                    request.setAttribute("ACCOUNT", dto);
                }
            } else {
                request.setAttribute("ACCOUNT", dto);
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
