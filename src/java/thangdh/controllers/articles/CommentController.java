/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thangdh.controllers.articles;

import java.io.IOException;
import java.sql.Timestamp;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import thangdh.daos.CommentDAO;
import thangdh.dtos.AccountDTO;
import thangdh.dtos.CommentDTO;

/**
 *
 * @author dhtha
 */
public class CommentController extends HttpServlet {

    private final String SUCCESS = "DetailArticleController";
    private final String LOGIN = "login.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = SUCCESS;
        try {
            HttpSession session = request.getSession();
            String articleID = request.getParameter("id");
            AccountDTO user = (AccountDTO) session.getAttribute("ACCOUNT");
            if (user == null) {
                url = LOGIN;
            } else {
                String message = request.getParameter("message");
                request.setAttribute("id", articleID);
                message = message == null ? "" : message.trim();
                boolean check = true;
                if (message.isEmpty()) {
                    request.setAttribute("MESSAGE", "Message must be required!");
                    check = false;
                }
                if (!user.getRole().equalsIgnoreCase("member")) {
                    request.setAttribute("MESSAGE", "Only member can comment!");
                    check = false;
                }
                if (check) {
                    CommentDAO dao = new CommentDAO();
                    Timestamp postingDate = new Timestamp(System.currentTimeMillis());
                    CommentDTO dto = new CommentDTO(message, user, articleID, postingDate);
                    if (dao.insertComment(dto)) {
                        request.setAttribute("MESSAGE", "Comment was success!");
                    } else {
                        request.setAttribute("COMMENT_POST", message);
                        request.setAttribute("MESSAGE", "Comment was fail!");
                    }
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
