/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author LENOVO
 */
public class bienvenue extends HttpServlet {

 
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter p = response.getWriter();
        HttpSession session = request.getSession(false);
        String email = session.getAttribute("email").toString();
        String pwd = (String) session.getAttribute("password");
        
        if (email != null)
        {
            RequestDispatcher rd = request.getRequestDispatcher("AjouterProduit.jsp");
            request.setAttribute("email", email);
            rd.forward(request, response);
        }
   
        else 
        {
            p.print("<h1>Erreur d'authentification </h1>");
        }
        
    }

 

}
