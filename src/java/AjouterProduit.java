/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Path;
import java.nio.file.Paths;
import static java.sql.DriverManager.println;
import java.sql.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import org.apache.commons.io.FileUtils;
import Model.addProduit;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;


/**
 *
 * @author aroubaz
 */
@WebServlet("/AjouterProduit")
@MultipartConfig(fileSizeThreshold=1024*1024*10, 	// 10 MB 
                 maxFileSize=1024*1024*50,      	// 50 MB
                 maxRequestSize=1024*1024*100) 
public class AjouterProduit extends HttpServlet {

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter p = response.getWriter();
        
        
      
        
        
       try {
        
        Class.forName( "com.mysql.jdbc.Driver" );
        p.print("rani hna1");
     
       
    } catch ( ClassNotFoundException e ) {
        p.print("rani hna2");
    }
        
         String url = "jdbc:mysql://localhost:3306/gestventes";
    String utilisateur = "root";
    String motDePasse = "";
    Connection connexion = null;
    ResultSet resultat = null;
    
    
     String libelle = request.getParameter("libelle");
        double prix = Double.parseDouble(request.getParameter("prix")); 
        int quantite = Integer.parseInt(request.getParameter("quantite"));
        String img = request.getParameter("image");
         Part filePart = request.getPart("image"); 
         
         addProduit p1 = new addProduit(libelle, img, prix, quantite);
        
         
        try {
            List<String> addProduct = p1.addProduct(request);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(AjouterProduit.class.getName()).log(Level.SEVERE, null, ex);
        }
 /*   try{
        
        connexion = DriverManager.getConnection( url, utilisateur, motDePasse );
 
         
            PreparedStatement statement = connexion.prepareStatement("insert into produit (libelle,photo,prix,qts) values(?,?,?,?)");
        
        

        //File image = request.get("image");
      
        
  
            p.print("rani hna00\n");
            Path path = Paths.get(filePart.getSubmittedFileName());
            String fileName = path.getFileName().toString(); // MSIE fix.
            p.print("rani hna01\n");
           InputStream fileContent = filePart.getInputStream();
            p.print("rani hna03\n");
            
            File targetFile = new File("C:\\Users\\LENOVO\\Documents\\NetBeansProjects\\GestVentes\\web\\image\\"+fileName);
            p.print("rani hna3");
 
    FileUtils.copyInputStreamToFile(fileContent, targetFile);
    
    String image = targetFile.toString();
    
     statement.setString(1, libelle);
        statement.setString(2, fileName);
        statement.setDouble(3, prix);
        statement.setInt(4, quantite);
        statement.executeUpdate();   
   
        

        
    }catch ( SQLException e ) {
        p.print("rani hna4");
        
    }
    */
      RequestDispatcher rd = request.getRequestDispatcher("/Catalogue");
      rd.forward(request, response);
        

        
        
        
    }

}
