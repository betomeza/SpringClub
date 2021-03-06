<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title> Administradores </title>
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
                           href="<%=contextPath%>/adm/admin/new"> Nuevo </a>
                        <h1> Administradores </h1>
                    </div>

                    <table class="table table-hover">
                        <tr>
                            <th class="span3">Nombre</th>
                            <th>Email</th>
                            <th>Celular</th>
                            <th>Dirección</th>
                            <th>Estado</th>
                            <th> </th>
                        </tr>
                        <c:forEach var="adm" items="${admins}">
                            <tr>
                                <td><c:out value="${adm.getFullName()}"/></td>
                                <td><c:out value="${adm.email}"/></td>
                                <td><c:out value="${adm.celular}"/></td>
                                <td><c:out value="${adm.direccion}"/></td>
                                
                                <td>
                                    <div class="btn-group">
                                        <a class="dropdown-toggle" data-toggle="dropdown" role="menu"  href="#">
                                            <i class="icon-cog"></i>
                                        </a>
                                        <ul class="dropdown-menu pull-right">
                                            <li>
                                                <a href="<%=contextPath%>/adm/admin/update/${adm.id}">
                                                    Editar</a>
                                            </li>
                                            <li>
                                                <a href="<%=contextPath%>/adm/admin/delete/${adm.id}">
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
    </body>
</html>




