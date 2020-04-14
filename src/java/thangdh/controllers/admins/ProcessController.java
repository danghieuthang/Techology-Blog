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

/**
 *
 * @author dhtha
 */
public class ProcessController extends HttpServlet {

    private final String SUCCESS = "SearchArticleController";
    private final String FAIL = "login.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = SUCCESS;
        try {
            HttpSession session = request.getSession();
            AccountDTO user = (AccountDTO) session.getAttribute("ACCOUNT");
            ArticleDAO dao = new ArticleDAO();
            if (!user.getRole().equalsIgnoreCase("admin")) {
                url = FAIL;
            } else {
                String action = request.getParameter("action");
                String status = null;
                boolean check = true;
                String articleIDs[] = request.getParameterValues("articles");
                String errror = "";
                switch (action) {
                    case "Approval":
                        status = "Active";
                        for (String articleID : articleIDs) {
                            int id = Integer.parseInt(articleID);
                            if (!dao.updateStatus(id, status)) {
                                errror += articleID;
                            }
                        }
                        break;
                    case "Deleted":
                        status = "Deleted";
                        for (String articleID : articleIDs) {
                            int id = Integer.parseInt(articleID);
                            String oldStatus = dao.getStatusByID(id); // get current Status
                            dao.updateOldStatusAfterDeleted(id, oldStatus); // set current Status for OldStatus
                            if (!dao.updateStatus(id, status)) { // set new status is Deleted
                                errror += articleID;
                            }
                        }
                        break;
                    case "Restore":
                        for (String articleID : articleIDs) {
                            int id = Integer.parseInt(articleID);
                            status = dao.getOldStatusByID(id); // get Old Status
                            if (status == null) {
                                status = "New";
                            }
                            if (!dao.updateStatus(id, status)) {
                                errror += articleID;
                            }
                        }
                        break;
                    default:
                        request.setAttribute("MESSAGE", "Status not valid!");
                        check = false;
                }
                request.setAttribute("STATUS", status);
                if (errror.length() == 0) {
                    request.setAttribute("SUCCESS_STATUS", 1);
                } else {
                    request.setAttribute("MESSAGE_ERROR", errror);
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
