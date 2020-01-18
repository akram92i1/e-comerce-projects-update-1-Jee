<%-- 
    Document   : AjouterProduit
    Created on : 9 janv. 2020, 09:15:03
    Author     : aroubaz
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ajouter Produit</title>
    </head>
    <body>
        <h1>Ajouter Produit</h1>
        <div>
            <form action="AjouterProduit" method="post"  enctype="multipart/form-data" >
            <table>
                <tr>
                    <td>Libelle</td>
                    <td><input type="text" name="libelle"></td>
                </tr>
                <tr>
                    <td>Prix</td>
                    <td><input type="price" name="prix"></td>
                    <td>Quantite</td>
                    <td><input type="number" name="quantite"></td>
                </tr>
                <tr>
                    <td>Image</td>
                    <td><input type="file" name="image" accept="image/*"> </td>
                </tr>
                <tr>
                    <td><input type="submit"></td>
                </tr>
            </table>
             </form>
        </div>
    </body>
</html>
