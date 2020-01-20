/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.io.File;
import java.io.InputStream;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import java.sql.*;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.Part;
import org.apache.commons.io.FileUtils;
import com.mysql.jdbc.Driver;


/**
 *
 * @author LENOVO
 */
public class LoginConnector {
    private String email ; 
    private String password ; 
    
    public LoginConnector(String mail , String password )
    {
        this.email = mail ; 
        this.password = password ; 
    }
    //----------- Getters and Setters -------
    public String getEmail() {
        return email;
    }

    public String getPassword() {
        return password;
    }
    //----------------------------------------
    
    public List<String> VerifUser(HttpServletRequest req) throws ClassNotFoundException
    {
         ArrayList<String> UserListe = new ArrayList<String>(); 
       
         
         //------------------- Database Connection --------------------------------------------
       
               Class.forName("com.mysql.jdbc.Driver");
               String url = "jdbc:mysql://localhost:3306/gestventes";
               String utilisateur = "root";
               String motDePasse = "";
               Statement state = null ;
               Connection connexion = null;
               ResultSet resultat = null;  
           try{
                     
               connexion = DriverManager.getConnection( url, utilisateur, motDePasse );
               state = connexion.createStatement();
               resultat = state.executeQuery("select * from vendeur where email= '"+getEmail()+"'and password='"+getPassword()+"';");
              
               if(resultat.next())
               {
                   UserListe.add("True");
               }
               else 
               {
                   UserListe.add("False");
               }    
            }catch ( SQLException e ) 
            {
               UserListe.add(e.getMessage());    
            }

            if( resultat != null )
            {
                try {
                    resultat.close();
                } catch (SQLException ignore) {
                }
            }
            //--------------------------------
            if(state != null )
            {
                try {
                    state.close();
                } catch (SQLException ignore ) {
                }
            }
            //--------------------------------           
            if(connexion != null)
            {
              try{
                  System.out.println("la connexion est ferme");
                   connexion.close();
              }catch(SQLException ignore){
                  
              }
            }
         
         //--------------------End DataBase Connection------------------------------------------
                 
      return UserListe;
        
    }
    
    
    
}
