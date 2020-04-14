/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thangdh.controllers.articles;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import thangdh.daos.ArticleDAO;
import thangdh.dtos.ArticleDTO;

/**
 *
 * @author dhtha
 */
public class SearchArticleController extends HttpServlet {

    private final String HOME_PAGE = "index.jsp";
    private final String PROCESS_PAGE = "process.jsp";
    private final int pageSize = 5;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = HOME_PAGE;
        try {
            String searchValue = request.getParameter("SearchValue");
            String titleSearch = request.getParameter("title");
            searchValue = searchValue == null ? "" : searchValue.trim();
            String pageStr = request.getParameter("page");
            int pageIndex;
            if (pageStr == null) {
                pageIndex = 1;
            } else {
                try {
                    pageIndex = Integer.parseInt(pageStr);
                } catch (Exception e) {
                    pageIndex = 1;
                }
            }
            request.setAttribute("PAGE", pageIndex);
            String status = request.getParameter("articleStatus");
            if (status != null) { // If resquest from process.jsp
                url = PROCESS_PAGE;
                request.setAttribute("STATUS", status);
            } else { // request from index.jsp
                status = "Active";
            }
            ArticleDAO dao = new ArticleDAO();
            List<ArticleDTO> listArticle;
            if (titleSearch != null) {
                titleSearch = titleSearch.trim();
                listArticle = dao.search(titleSearch, searchValue, status);
            } else {
                listArticle = dao.search(searchValue, status);
            }

            request.setAttribute("LIST_PAGE", Math.ceil(listArticle.size() * 1.0 / pageSize));
            int begin = (pageIndex - 1) * pageSize;
            int end = (pageIndex * pageSize);
            if (end > listArticle.size()) {
                end = listArticle.size();
            }
            request.setAttribute("LIST", listArticle.subList(begin, end));
            request.setAttribute("SEARCH_VALUE", searchValue);
            request.setAttribute("PAGE", pageIndex);
            request.setAttribute("TITLE", titleSearch);
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
