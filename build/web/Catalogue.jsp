<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <link rel="stylesheet"  type="text/css" id ="theme" title="Design" href="<c:url value="/resources/css/theme-default.css"/>"/>
  <link rel="stylesheet"  type="text/css" id ="theme" title="Design" href="<c:url value="/resources/css/myheight.css"/>"/>
<%
String driverName = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/gestventes";

String userId = "root";
String password = "";

try {
Class.forName(driverName);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}

Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<body>
<div class="page-container">
    <!-- Here we will add the side bar  -->
    
    <!-- End of the page sidebar   -->
  
    
    
    
        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-default">
                     <div class="panel-heading">                                
                                       <h3 class="panel-title">Catalogue : </h3>
                        <ul class="panel-controls">
                            <li><a href="#" class="panel-collapse"><span class="fa fa-angle-down"></span></a></li>
                            <li><a href="#" class="panel-refresh"><span class="fa fa-refresh"></span></a></li>
                            <li><a href="#" class="panel-remove"><span class="fa fa-times"></span></a></li>
                        </ul>                                
                    </div>

                    <div class="panel-body">
                        <table class="table dataTable">
                            <thead>
                                <tr>
                                    <th> Identifiant </th> 
                                    <th> Libelle   </th>
                                    <th>Produit </th>
                                    <th>Prix</th>
                                    <th>Quantité</th>
                                         <c:if test="${empty sessionScope.email}">
                                         <th>
                                         Ajout
                                         </th>
                                        </c:if>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                try {
                                connection = DriverManager.getConnection(
                                connectionUrl , userId, password);
                                statement = connection.createStatement();
                                String sql = "SELECT * FROM produit";
                                resultSet = statement.executeQuery(sql);
                                while (resultSet.next()) {
                                %>
                                <tr>
                                <td><%=resultSet.getString("id")%></td>
                                <td><%=resultSet.getString("libelle")%></td>
                                <td><img  src ="image/<%= resultSet.getString("photo")%>" style="width: 20%;height: 20%" alt="Fruit" /></td>
                                <td><%=resultSet.getDouble("prix")%></td>
                                <td><%=resultSet.getInt("qts")%></td>
                                <c:if test="${empty sessionScope.email}">
                                         <td>
                                             <button class="btn btn-info active" type="button">Ajouter panier</button>
                                         </td>   
                                </c:if>
                                </tr>

                                <%

                                }

                                } catch (Exception e) {
                                e.printStackTrace();
                                }


                                    if(resultSet != null)
                                    {
                                        resultSet.close();
                                    }
                                    if(statement != null)
                                    {
                                        statement.close();
                                    }
                                    if(connection != null)
                                    {
                                        connection.close();
                                    }
                                %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
       
</div>



   <script src ="<c:url value="/resources/js/plugins/jquery/jquery.min.js"/>" > </script>

   
        <script src ="<c:url value="/resources/js/plugins/jquery/jquery-ui.min.js"/>"> </script>
        <script src ="<c:url value="/resources/js/plugins/icheck/icheck.min.js"/>"> </script> 
        <script src ="<c:url value="/resources/js/plugins/mcustomscrollbar/jquery.mCustomScrollbar.min.js"/>"></script>
        <script src ="<c:url value="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"/>"> </script>

        <script src ="<c:url value="/resources/js/plugins.js"/>"></script>
        <script src ="<c:url value="/resources/js/popper.min.js"/>"></script>

       
        
        <script src ="<c:url value="/resources/js/actions.js"/>"></script> 
        <script src ="<c:url value="/resources/js/settings.js"/>"></script> 
        <script src ="<c:url value="/resources/js/plugins/icheck/icheck.min.js"/>"></script>
        <script src ="<c:url value="/resources/js/plugins/datatables/jquery.dataTables.min.js"/>"></script>
</body>
       