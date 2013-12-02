<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title> Local </title>
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
                        <a class="btn btn-primary pull-right" 
                           href="<%=contextPath%>/adm/local/new"> Nuevo </a>
                        <h1> Locales </h1>
                    </div>

                    <table class="table table-hover">
                        <tr>
                            <th class="span3">Descripción</th>
                            <th>Dirección</th>
                            <th>Teléfono</th>
                            <th>Estado</th>
                            <th> </th>
                        </tr>
                        <c:forEach var="serv" items="${locales}">
                            <tr>
                                <td><c:out value="${serv.descripcion}"/></td>
                                <td><c:out value="${serv.direccion}"/></td>
                                <td><c:out value="${serv.telefono}"/></td>
                                <td>
                                    <c:if test="${serv.estado == 1}">
                                        <label class="label label-success"><c:out value="Activo"/> </label>
                                    </c:if>
                                    <c:if test="${serv.estado != 1}">
                                        <label class="label label-warning"><c:out value="Inactivo"/> </label>
                                    </c:if>
                                </td>
                                <td>
                                    <div class="btn-group">
                                        <a class="dropdown-toggle" data-toggle="dropdown" role="menu"  href="#">
                                            <i class="icon-cog"></i>
                                        </a>
                                        <ul class="dropdown-menu pull-right">
                                            <li>
                                                <a href="#" class="activar" ref="${serv.id}">
                                                    <c:if test="${serv.estado == 0}">Activar</c:if>
                                                    <c:if test="${serv.estado == 1}">Desactivar</c:if>

                                                    </a></li>
                                                <li class="divider"></li>
                                                <li>
                                                    <a href="<%=contextPath%>/adm/local/update/${serv.id}">
                                                    Editar</a>
                                            </li>
                                            <li>
                                                <a href="<%=contextPath%>/adm/local/delete/${serv.id}">
                                                    Eliminar</a>
                                            </li>
                                        </ul>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
            </div>             
            <hr>
        </div>
        <%@include file="/public/footer.jsp" %>                                
        <script>
            $(function() {

                $('.activar').each(function(index, elem) {
                    $(elem).click(function() {
                        var idLocal = $(elem).attr("ref");
                        console.log(idLocal);
                        
                        $.ajax({
                            url:"/SpringClub/adm/local/activar",
                            method: "post",
                            data: {id : idLocal },
                            success: function(response){
                                
                                if(response.success){
                                    location.reload();
                                }
                            }
                            
                        });

                    });
                });
            });
        </script>

    </body>
</html>




