/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thangdh.controllers.accounts;

import java.io.IOException;
import java.util.Properties;
import java.util.Random;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import thangdh.daos.AccountDAO;

/**
 *
 * @author dhtha
 */
public class AuthenticationController extends HttpServlet {

    private final String SUCCESS = "authentication.jsp";

    private String randomCode() {
        String result = "";
        Random rd = new Random();
        result = (rd.nextInt(90000) + 10000) + "";
        return result;
    }

    private boolean sendAuthenticaion(String email, String code) {
        boolean result = true;
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.port", 587);
        Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication("dhthang1998", "thang1171998");
            }
        });
        try {
            MimeMessage message = new MimeMessage(session);
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
            message.setSubject("Authication in Technology Blog");
            String mss = "You receive an authentication message from Technology Blog\n"
                    + "Your verification code is:" + code + "\n"
                    + "If this is not you please ignore this message";
            message.setText(mss);
            Transport.send(message);
        } catch (MessagingException e) {
            throw new RuntimeException(e);
        } catch (Exception e) {
            result = false;
        }
        return result;
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        try {
            String signal = request.getParameter("signal");
            if (signal == null) {
                signal = "";
            }
            HttpSession session = request.getSession();
            String receiveMail = (String) request.getAttribute("EMAIL"); // get email from RegistrationController
            if (receiveMail == null) {
                receiveMail = request.getParameter("email"); // get email from authenticaion.jsp
            }
            request.setAttribute("EMAIL", receiveMail);
            if (!signal.equalsIgnoreCase("Verify")) { // 
                String code = randomCode();
                sendAuthenticaion(receiveMail, code);
                session.setAttribute("CODE_AUTHENTICATION", code);
            } else {
                String codeVerify = (String) session.getAttribute("CODE_AUTHENTICATION");
                String code = request.getParameter("code");
                if (!code.equalsIgnoreCase(codeVerify)) { // Code not same server
                    request.setAttribute("MESSAGE", "Code not right. Please input again!");
                } else {
                    AccountDAO dao = new AccountDAO();
                    boolean check = dao.updateStatusByEmail(receiveMail, "Active"); //
                    if (check) {
                        request.setAttribute("MESSAGE", "Authentication success!");
                    } else {
                        request.setAttribute("MESSAGE", "Authentication have error!");
                    }
                }
            }
        } catch (Exception e) {
        } finally {
            request.getRequestDispatcher(SUCCESS).forward(request, response);
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
