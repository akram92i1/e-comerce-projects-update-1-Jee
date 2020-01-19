<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <link rel="stylesheet"  type="text/css" id ="theme" title="Design" href="<c:url value="/resources/css/theme-default.css"/>"/>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ajouter Produit</title>
    </head>
    <body>
        <div class="page-container">
            <div class="page-content">
               
                    <div class="row">
                        <div class="col-md-12">
                                <h1>Ajouter Produit</h1>
                            <form action="AjouterProduit" method="post" class="form-horizontal"  enctype="multipart/form-data" >
                                    <div class="panel panel-default">
                                        <div class="panel-heading ui-draggable-handle">
                                            <h3 class="panel-title">
                                                <strong>
                                                    Ajouter Produit 
                                                </strong>
                                                <i class="fa fa-plus-square"></i>  
                                            </h3>
                                        </div>

                                <div class="panel-body">
                                    <div class="row">
                                        <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="col-md-3 control-label">Libelle</label>
                                                    <div class="col-md-9">
                                                        <div class="input-group">
                                                                <span class="input-group-addon"><span class="fa fa-pencil"></span></span>
                                                                <input type="text" name="libelle" class="form-control">
                                                            </div>

                                                    </div>
                                               </div>

                                                <div class="form-group">
                                                    <label class="col-md-3 control-label">Prix</label>
                                                    <div class="col-md-9">
                                                        <div class="input-group">
                                                                <span class="input-group-addon"><span class="fa fa-pencil"></span></span>
                                                                <input type="price" name="prix" class="form-control">
                                                            </div>

                                                    </div>
                                               </div>                                       
                                        </div>


                                        <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="col-md-3 control-label">Quantite</label>
                                                    <div class="col-md-9">
                                                        <div class="input-group">
                                                                <span class="input-group-addon"><span class="fa fa-pencil"></span></span>
                                                                <input type="number" name="quantite" class="form-control">
                                                            </div>

                                                    </div>
                                               </div>

                                              <div class="form-group">
                                                    <label class="col-md-3 control-label">File</label>
                                                    <div class="col-md-9">                                                                                                                                        
                                                            <input type="file"  accept="image/*"  class="fileinput btn-primary" name="image"  title="Browse file" style="left: -163.367px; top: 2.45001px;"/>
                                                    </div>
                                             </div>
                                        </div>
                                  </div>

                            </div>
                                                    <div class="panel-footer">
                                                                 <button class="btn btn-default">Clear Form</button>
                                                                 <input class="btn btn-primary pull-right" type="submit"/>
                                                    </div>
                                    </div>
                            </form>
                                    
                             
                        </div>
                    </div>
                
            </div>
        </div>
        
        
        <!-- Start Scripts  -->
        <script src ="<c:url value="/resources/js/plugins/jquery/jquery.min.js"/>" > </script>
        <script src ="<c:url value="/resources/js/plugins/jquery/jquery-ui.min.js"/>"> </script>
        <script src ="<c:url value="/resources/js/plugins/icheck/icheck.min.js"/>"> </script> 
        <script src ="<c:url value="/resources/js/plugins/mcustomscrollbar/jquery.mCustomScrollbar.min.js"/>"></script>
        <script src ="<c:url value="resources/js/plugins/bootstrap/bootstrap.min.js"/>"> </script>
        
        <script src ="<c:url value="/resources/js/plugins.js"/>"></script>
        <script src ="<c:url value="/resources/js/actions.js"/>"></script> 
        <script src ="<c:url value="/resources/js/settings.js"/>"></script> 
        
        <script src ="<c:url value="/resources/js/plugins/tagsinput/jquery.tagsinput.min.js"/>"></script>
        <script src ="<c:url value="/resources/js/plugins/bootstrap/bootstrap-select.js"/>"></script>
        <script src ="<c:url value="/resources/js/plugins/bootstrap/bootstrap-file-input.js"/>"></script>
        <script src ="<c:url value="/resources/js/plugins/bootstrap/bootstrap-datepicker.js"/>"></script>
       <!--  End scripts  -->
    </body>
</html>
