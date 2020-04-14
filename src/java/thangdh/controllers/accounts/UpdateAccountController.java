package thangdh.controllers.accounts;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
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
public class UpdateAccountController extends HttpServlet {

    private final String SUCCESS = "profile.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = SUCCESS;
        try {
            String email = request.getParameter("email");
            String name = request.getParameter("name");
            String password = request.getParameter("password");
            String rePassword = request.getParameter("rePassword");
            name = name == null ? "" : name.trim();
            boolean check = true;
            if (name.isEmpty()) {
                request.setAttribute("NAME_ERROR", "Name must be required!");
                check = false;
            }
            if (password.isEmpty()) {
                request.setAttribute("PASSWORD_ERROR", "Password must be required!");
                check = false;
            } else if (!rePassword.equals(password)) {
                request.setAttribute("REPASSWORD_ERROR", "RePassword not same password!");
                check = false;
            }
            if (check) {
                password = org.apache.commons.codec.digest.DigestUtils.sha256Hex(password);
                AccountDAO dao = new AccountDAO();
                AccountDTO dto = new AccountDTO(email, name, password);
                if (dao.updateAccount(dto)) {
                    request.setAttribute("UPDATEMESSAGE", "Update profile success");
                    AccountDTO accountDTO = dao.getAccountByEmail(email);
                    HttpSession session = request.getSession();
                    session.setAttribute("ACCOUNT", accountDTO);
                } else {
                    request.setAttribute("UPDATEMESSAGE", "Update profile fail!");
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
