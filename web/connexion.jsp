<%-- 
    Document   : connexion
    Created on : 9 janv. 2020, 09:07:29
    Author     : aroubaz
--%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Connecté vous</title>
          <link rel="stylesheet"  type="text/css" id ="theme" title="Design" href="<c:url value="/resources/css/theme-default.css"/>"/>
           <link rel="stylesheet"  type="text/css" id ="theme" title="Design" href="<c:url value="/resources/css/myheight.css"/>"/>
          
           
    </head>
    <body>
         
        
         <div class="logheight login-container">

                <div class="login-box animated fadeInDown">
               
                <div class="login-body">
                    <div class="login-title"><strong>Se connecter</strong> au compte admin </div>
                    
                        <form  method="post" action="Connexion" class="form-horizontal">
                        <div class="form-group hidable">
                            <div class="col-md-12">
                                <input type="email" class="form-control" name="email"  placeholder="Username"/>
                                <div class="formErrorContent"><br></div>
                            </div>
                        </div>
                        <div class="form-group hidable">
                            <div class="col-md-12">
                                <input type="password" class="form-control" name="motdepasse"  placeholder="Mot De Passe"/>
                                <div class="formErrorContent"><br></div>
                            </div>

                        </div>
                            
                            <div class="form-group ">
                                <div class="col-md-12">
                                    <!-- Default unchecked -->
                                        <div class="custom-control custom-checkbox">
                                            <div class="col-md-12">                                    
                                                <h6><input type="checkbox" name="justuser" value="chat bit" class="icheckbox click" /> <small class="text-info">For simple user </small></h6>
                                            </div>
                                        </div>
                                    </div>
                            </div>
                        <div class="form-group">
                            <div class="col-md-6">
                                <input type="submit" class="btn btn-info btn-block"  value="Se Connecter">
                            </div>
                        </div> 
                        
                    </form>
                    
                </div>
                <div class="login-footer">
                    <div class="pull-left">
                        &copy; Projet Bibliothéque  2019

                    </div>
                    <div class="pull-right">
                            <a href="#">About</a> |
                            <a href="#">Privacy</a> |
                            <a href="#">Contact Us</a>
                        </div>
                </div>
            </div>
        </div>
            
            <script src ="<c:url value="/resources/js/jquery-3.4.1.min.js"/>"/>   
            <script src ="<c:url value="/resources/js/effects.js"/>"/>
        
        
        <a href="AjouterProduit.jsp">Ajouter Produit(For test)</a>
    </body>
</html>
