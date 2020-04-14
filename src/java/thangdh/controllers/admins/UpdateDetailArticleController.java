/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thangdh.controllers.admins;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import thangdh.daos.ArticleDAO;
import thangdh.daos.CommentDAO;
import thangdh.dtos.AccountDTO;
import thangdh.dtos.ArticleDTO;
import thangdh.dtos.CommentDTO;

/**
 *
 * @author dhtha
 */
public class UpdateDetailArticleController extends HttpServlet {

    private final String SUCCESS = "update_detail.jsp";
    private final String FAIL = "login.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = SUCCESS;
        try {
            HttpSession session = request.getSession();
            AccountDTO user = (AccountDTO) session.getAttribute("ACCOUNT");
            if (!user.getRole().equalsIgnoreCase("admin")) {
                url = FAIL;
            } else {
                String articleID = request.getParameter("id");
                int id = 0;
                try {
                    id = Integer.parseInt(articleID);
                } catch (Exception e) {
                    id = 0;
                }
                ArticleDAO dao = new ArticleDAO();
                ArticleDTO dto = dao.getArticleByID(Integer.parseInt(articleID));
                request.setAttribute("ARTICLE", dto);
                CommentDAO commentDAO = new CommentDAO();
                List<CommentDTO> listComment = commentDAO.getCommentByArticleID(id);
                request.setAttribute("LIST_COMMENT", listComment);
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
