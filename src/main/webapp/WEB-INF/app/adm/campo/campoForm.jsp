<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title> Campos Deportivos </title>
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
                        <h1> Nuevo Campo Deportivo </h1>
                    </div>

                    <form id="formCampo" action="<%=contextPath%>/adm/campo/save" method="POST" class="form-horizontal">

                        <input type="hidden" value="${campo.id}" name="id">

                        <div class="control-group">
                            <label class="control-label">Local</label>
                            <div class="controls">
                                <select name="local.id" id="local.id">
                                    <option value="0" selected>Seleccione Local</option>
                                    <c:forEach var="item" items="${locales}">
                                        <option value="${item.id}">${item.descripcion}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>

                        <div class="control-group">
                            <label class="control-label">Descripción</label>
                            <div class="controls">
                                <input type="text" name="descripcion" value="${campo.descripcion}">
                            </div>
                        </div>

                        <div class="control-group">
                            <label class="control-label">Tipo</label>
                            <div class="controls">
                                <select name="tipo" id="tipo">
                                    <option value="0" selected>Seleccione Tipo de Campo</option>
                                    <option value="1">Fútbol</option>
                                    <option value="2">Fútsal</option>
                                    <option value="4">Fúlbito</option>
                                    <option value="5">Voleyball</option>
                                    <option value="6">Basketball</option>
                                    <option value="7">Tenis</option>
                                </select>
                            </div>
                        </div>

                        <div class="control-group">
                            <label class="control-label">Costo Hora</label>
                            <div class="controls">
                                <input type="text" name="costoHora" value="${campo.costoHora}">
                            </div>
                        </div>

                        <div class="control-group">
                            <div class="controls">
                                <a class="btn" href="<%=contextPath%>/adm/campo">Cancelar</a>
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
                $("#formCampo").validate({
                    rules: {
                        descripcion: {
                            required: true,
                            maxlength: 200
                        },
                        tipo: {
                            required: true
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