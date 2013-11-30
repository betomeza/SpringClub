


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
                        <h1> Nuevo Servicio </h1>
                    </div>

                    <form id="formServicio" action="<%=contextPath%>/adm/servicio/save" method="POST" class="form-horizontal">

                        <input type="hidden" value="${servicio.id}" name="id">

                        <div class="control-group">
                            <label class="control-label">Descripcion</label>
                            <div class="controls">
                                <input type="text" name="descripcion" value="${servicio.descripcion}">
                            </div>
                        </div>

                        <div class="control-group">
                            <label class="control-label">Costo Hora</label>
                            <div class="controls">
                                <input type="text" name="costoHora" value="${servicio.costoHora}">
                            </div>
                        </div>

                        <div class="control-group">
                            <div class="controls">
                                <a class="btn" href="<%=contextPath%>/adm/servicio">Cancelar</a>
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
                $("#formServicio").validate({
                    rules: {
                        descripcion: {
                            required: true,
                            maxlength: 200
                        },
                        costoHora: {
                            required: true,
                            number: true
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




