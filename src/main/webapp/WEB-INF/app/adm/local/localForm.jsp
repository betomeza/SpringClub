<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title> Servicio </title>
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
                        <h1> Nuevo Local </h1>
                    </div>

                    <form id="formlocal" action="<%=contextPath%>/adm/local/save" method="POST" class="form-horizontal">

                        <input type="hidden" value="${local.id}" name="id">

                        <div class="control-group">
                            <label class="control-label">Descripción</label>
                            <div class="controls">
                                <input type="text" name="descripcion" value="${local.descripcion}">
                            </div>
                        </div>

                        <div class="control-group">
                            <label class="control-label">Dirección</label>
                            <div class="controls">
                                <input type="text" name="direccion" value="${local.direccion}">
                            </div>
                        </div>

                        <div class="control-group">
                            <label class="control-label">Teléfono</label>
                            <div class="controls">
                                <input type="text" name="telefono" value="${local.telefono}">
                            </div>
                        </div>

                        <div class="control-group">
                            <div class="controls">
                                <a class="btn" href="<%=contextPath%>/adm/local">Cancelar</a>
                                <button type="submit" class="btn btn-primary">Guardar</button>
                            </div>
                        </div>
                    </form>


                </div>
            </div>
            <hr>
        </div>
        <%@include file="/public/footer.jsp" %>
        <script>
            $(function() {
                $("#formlocal").validate({
                    rules: {
                        descripcion: {
                            required: true,
                            maxlength: 200
                        },
                        direccion: {
                            required: true,
                            maxlength: 500
                        },
                        telefono: {
                            required: true,
                            maxlength: 20
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
    </body>
</html>