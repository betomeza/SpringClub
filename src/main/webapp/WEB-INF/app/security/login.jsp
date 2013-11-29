<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title> Login </title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <%@include file="/public/header.jsp" %>
    </head>
    <body>
        <%@include file="/public/menuGeneral.jsp" %>

        <div class="container-fluid">
            <div class="row-fluid">
                <form class="form-signin" action="<%=contextPath%>/j_spring_security_check" method="post">
                    <h2 class="form-signin-heading">Ingresar</h2>
                    <input type="text" class="input-block-level" placeholder="Email address" name="j_username">
                    <input type="password" class="input-block-level" placeholder="Password"  name="j_password">
                    
                    <button class="btn btn-large btn-primary" type="submit">Ingresar</button>
                </form>
            </div>
        </div>
        <%@include file="/public/footer.jsp" %>
    </body>
</html>





