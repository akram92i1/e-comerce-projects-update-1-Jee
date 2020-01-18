/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;
import org.apache.commons.io.FileUtils;


/**
 *
 * @author aroubaz
 */

@MultipartConfig(fileSizeThreshold=1024*1024*10, 	// 10 MB 
                 maxFileSize=1024*1024*50,      	// 50 MB
                 maxRequestSize=1024*1024*100) 
public class addProduit {
       private String libelle ; 
       private String photoUrl ; 
       private double prix ; 
       private int quantite ; 

    public addProduit(String libelle, String photoUrl, double prix, int quantite) {
        this.libelle = libelle;
        this.photoUrl = photoUrl;
        this.prix = prix;
        this.quantite = quantite;
    }

    public void setLibelle(String libelle) {
        this.libelle = libelle;
    }

    public void setPhotoUrl(String photoUrl) {
        this.photoUrl = photoUrl;
    }

    public void setPrix(double prix) {
        this.prix = prix;
    }

    public void setQuantite(int quantite) {
        this.quantite = quantite;
    }

    public String getLibelle() {
        return libelle;
    }

    public String getPhotoUrl() {
        return photoUrl;
    }

    public double getPrix() {
        return prix;
    }

    public int getQuantite() {
        return quantite;
    }
       
       public List<String> addProduct(HttpServletRequest req) throws ClassNotFoundException, IOException, ServletException
       {
           ArrayList<String> Produit = new ArrayList<String>();
           
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/gestventes";
            String utilisateur = "root";
            String motDePasse = "";
           
          //---------------------------
          Connection connexion = null;
          Statement state  = null ;
          ResultSet resultat =  null ;
          PreparedStatement statement = null;
          int count = 0;
         //----------------------------
          Part filePart = req.getPart("image"); 
           try{
                     
               connexion = DriverManager.getConnection( url, utilisateur, motDePasse );
               
                statement = connexion.prepareStatement("insert into produit (libelle,photo,prix,qts) values(?,?,?,?)");
             //  --------------- to copy the file in the right location -------------
               Path path = Paths.get(filePart.getSubmittedFileName());
               String fileName = path.getFileName().toString();
               InputStream fileContent = filePart.getInputStream();
               File targetFile = new File("C:\\Users\\LENOVO\\Documents\\NetBeansProjects\\GestVentes\\web\\image\\"+fileName);
               FileUtils.copyInputStreamToFile(fileContent, targetFile);
               String image = targetFile.toString();
               
                //--------------------------------------------------------------------
               //---------- INSERT DATA INTO DATABASE ---------------
               statement.setString(1, libelle);
               statement.setString(2, fileName);
               statement.setDouble(3, prix);
               statement.setInt(4, quantite);
               count = statement.executeUpdate();
              
               //--------------------------------------------------------
              
        
            }catch ( SQLException e ) 
            {
               Produit.add(e.getMessage());    
            }

         
                try {
                    statement.close();
                    connexion.close();
                    clear();
                    
                    
                } catch (SQLException ignore) {
                }

         //--------------------End DataBase Connection------------------------------------------
                 
           
           return Produit;
       }
       
       
   public void clear(){
    setLibelle(null);
    setPhotoUrl(null);
    setQuantite(0);
    
}
       
}
