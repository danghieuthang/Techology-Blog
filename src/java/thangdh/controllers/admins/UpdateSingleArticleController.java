/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thangdh.controllers.admins;

import java.io.IOException;
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
public class UpdateSingleArticleController extends HttpServlet {

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
                String articleID = request.getParameter("articleID");
                int id;
                try {
                    id = Integer.parseInt(articleID);
                } catch (Exception e) {
                    id = 0;
                }
                ArticleDAO dao = new ArticleDAO();
                ArticleDTO dto = dao.getArticleByID(id);
                request.setAttribute("ARTICLE", dto);
                String status = request.getParameter("status");
                status = status == null ? "" : status;
                if (dto == null) {
                    request.setAttribute("MESSAGE", "Article not exist!");
                } else {
                    request.setAttribute("STATUS", status);
                    boolean check = true;
                    switch (status) {
                        case "Approval":
                            status = "Active";
                            check = dao.updateStatus(id, status);
                            break;
                        case "Deleted":
                            status = "Deleted";
                            String oldStatus = dao.getStatusByID(id);
                            dao.updateOldStatusAfterDeleted(id, oldStatus);
                            check = dao.updateStatus(id, status);
                            break;
                        case "Restore":
                            status = dao.getOldStatusByID(id);
                            check = dao.updateStatus(id, status);
                            break;
                        default:
                            request.setAttribute("MESSAGE", "Status not valid!");
                            check = false;
                    }

                    if (!check) {
                        request.setAttribute("UPDATE_STATUS", 0);
                    } else {
                        request.setAttribute("UPDATE_STATUS", 1);
                        ArticleDTO article = dao.getArticleByID(Integer.parseInt(articleID));
                        request.setAttribute("ARTICLE", article);
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
