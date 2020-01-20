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
    <div class="page-container page-navigation-top">
        <div class="page-content">
        <!-- Here we will add the side bar  -->
        <c:if test="${empty sessionScope.email}">
            <ul class="x-navigation x-navigation-horizontal x-navigation-panel">

                <li class="xn-icon-button pull-right">
                        <a href="#" class="mb-control" data-box="#mb-signout"><span class="fa fa-sign-out"></span></a>                        
                </li>
                <li class="xn-icon-button pull-right">
                    <a href="#">
                        <span class="fa fa-shopping-cart"></span>
                    </a>
                     <div class="informer informer-danger">0</div>
                </li>
            </ul>
            
            
        </c:if>
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
                                    <tr >
                                        <th class="col-md-4"> Identifiant </th> 
                                        <th class="col-md-4"> Libelle   </th>
                                        <th class="col-md-4">Produit </th>
                                        <th class="col-md-4">Prix</th>          
                                        <th class="col-md-4">Quantité</th>
                                        
                                             <c:if test="${empty sessionScope.email}">
                                             <th>
                                                 Quantité desirer
                                             </th>
                                             <th class="col-md-4">
                                                 Ajouter
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
                                        <td class="col-md-1" ><%=resultSet.getString("id")%></td>
                                        <td class="col-md-1"><%=resultSet.getString("libelle")%></td>
                                        <td class="col-md-4"><img  src ="image/<%= resultSet.getString("photo")%>"  style="width: 30% ; height: 30%;"/></td>
                                        <td class="col-md-1"><%=resultSet.getDouble("prix")%></td>
                                        <td class="col-md-1"><%=resultSet.getInt("qts")%> </td>
                                    <c:if test="${empty sessionScope.email}">  
                                             
                                        <td class="col-md-2">
                                            <button class="btn btn-info active "  id="<%= resultSet.getString("id") %>" type="button">Ajouter panier</button>
                                             </td>
                                             
                                             <td class="col-md-2">
                                                    <div class="input-group">                                            
                                                        <span class="input-group-addon">$</span>
                                                        <input class="form-control" name="<%= resultSet.getString("id") %>" id="<%= resultSet.getString("id") %>" placeholder="Both side addons" type="number" max="<%= resultSet.getInt("qts")  %>" min="1">
                                                    </div>
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
                            <div class="panel-footer">
                             
                            </div>
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
        <script src ="<c:url value="/resources/js/Ajaxjq.js"/>"></script>
      
        <script src ="<c:url value="/resources/js/actions.js"/>"></script> 
        <script src ="<c:url value="/resources/js/settings.js"/>"></script> 
        <script src ="<c:url value="/resources/js/plugins/icheck/icheck.min.js"/>"></script>
        <script src ="<c:url value="/resources/js/plugins/datatables/jquery.dataTables.min.js"/>"></script>
</body>
       