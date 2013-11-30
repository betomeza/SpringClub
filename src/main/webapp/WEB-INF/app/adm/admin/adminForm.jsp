<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title> Administrador </title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <%@include file="/public/header.jsp" %>
    </head>
    <body>
        <%@include file="/public/menuGeneral.jsp" %>

        <div class="container-fluid">
            <div class="row-fluid">
                <%@include file="/public/menuAdm.jsp" %>
                <div class="span9">
                    <div class="row">
                        <h1> Nuevo Administrador </h1>
                    </div>

                    <form id="formAdmin" action="<%=contextPath%>/adm/admin/save" method="POST" class="form-horizontal">

                        <input type="hidden" value="${admin.id}" name="id">

                        <div class="control-group">
                            <label class="control-label">Nombres</label>
                            <div class="controls">
                                <input type="text" name="nombres" value="${admin.nombres}">
                            </div>
                        </div>

                        <div class="control-group">
                            <label class="control-label">Apellido Paterno</label>
                            <div class="controls">
                                <input type="text" name="paterno" value="${admin.paterno}">
                            </div>
                        </div>


                        <div class="control-group">
                            <label class="control-label">Apellido Materno</label>
                            <div class="controls">
                                <input type="text" name="materno" value="${admin.materno}">
                            </div>
                        </div>


                        <div class="control-group">
                            <label class="control-label">Email</label>
                            <div class="controls">
                                <input type="text" name="email" value="${admin.email}">
                            </div>
                        </div>


                        <div class="control-group">
                            <label class="control-label">Celular</label>
                            <div class="controls">
                                <input type="text" name="celular" value="${admin.celular}">
                            </div>
                        </div>


                        <div class="control-group">
                            <label class="control-label">Dirección</label>
                            <div class="controls">
                                <input type="text" name="direccion" value="${admin.direccion}">
                            </div>
                        </div>

                        <div class="control-group">
                            <div class="controls">
                                <a class="btn" href="<%=contextPath%>/adm/admin">Cancelar</a>
                                <button type="submit" class="btn btn-primary">Guardar</button>
                            </div>
                        </div>
                    </form>    
                </div>
            </div>
            <hr>
                    <script src="http://code.jquery.com/jquery.js"></script>
                    <script src="/public/bootstrap/js/bootstrap.min.js"></script>
                    <script src="/public/jvalidation/jquery.validate.min.js"></script>
                    <script src="/public/jvalidation/messages_es.js"></script>
                    <script>
                        $(function() {
                        $("#formAdmin").validate({
                        rules: {
                            nombres: {
                                required: true,  
                                maxlength: 45
                            },
                            paterno: {
                                required: true,
                                maxlength: 45                                
                            },
                            materno: {
                                required: true,
                                maxlength: 45                                
                            },
                            email: {
                                required: true,
                                email: true
                            },
                            direccion: {
                                required: true,
                                maxlength: 45
                            }
                        },
                        highlight: function(element) {
                            $(element).closest('.control-group').removeClass('success').addClass('error');
                        },
                        success: function(element) {
                            element
                                    .text('OK!').addClass('valid')
                                    .closest('.control-group').removeClass('error').addClass('success');
                            }
                        }
                        );
                    }
                    );
                    </script>          
            
        </div>
        <%@include file="/public/footer.jsp" %>
    </body>
</html>