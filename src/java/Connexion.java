/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.util.List;
import java.io.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import org.apache.commons.io.FileUtils;
import Model.LoginConnector;
import java.util.logging.Level;
import java.util.logging.Logger;


/**
 *
 * @author aroubaz
 */
public class Connexion extends HttpServlet {

   
 
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("connexion.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        try {
            PrintWriter p = resp.getWriter();
            
            String email = req.getParameter("email");
            String pwd = req.getParameter("motdepasse");
            String[] justUser = req.getParameterValues("justuser");
            LoginConnector l1 = new LoginConnector(email, pwd);
            List<String> information = l1.VerifUser(req);
            
            //----------- si client == null ----------
            if (justUser == null)
            {
                //------ Verification des valeurs ajouté a la BDD
          
                if(information.get(0).equals("True"))
                {
                    //--------- Initialize the Session ---------
                    HttpSession session = req.getSession();
                    session.setAttribute("email", email);
                    session.setAttribute("password", pwd);
                    //------------------------------------------
                    this.getServletContext().getRequestDispatcher("/bienvenue").forward(req, resp);
                    
                }
                else if(information.get(0).equals("False"))
                {
                    
                    RequestDispatcher rd = req.getRequestDispatcher("connexion.jsp");
                    rd.include(req,resp);
                }
                
            }
            else
            {
                HttpSession session = req.getSession();
                session.setAttribute("email", null);
                session.setAttribute("password", null);
                this.getServletContext().getRequestDispatcher("/Catalogue").forward(req, resp);
                
            }
        } catch (ClassNotFoundException ex) {       
            Logger.getLogger(Connexion.class.getName()).log(Level.SEVERE, null, ex);
        }
        

    }

   

}
