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
                <form id="formLogin" class="form-signin" action="<%=contextPath%>/j_spring_security_check" method="post">
                    <h2 class="form-signin-heading">Ingresar</h2>
                    <input type="text" class="input-block-level" placeholder="Email address" name="j_username">
                    <input type="password" class="input-block-level" placeholder="Password"  name="j_password">
                    
                    <button class="btn btn-large btn-primary" type="submit">Ingresar</button>
                </form>
            </div>
        </div>
        <%@include file="/public/footer.jsp" %>
        <script>
            $(function() {
                $("#formLogin").validate({
                    rules: {
                        j_username: {
                            required: true,
                            maxlength: 30
                        },
                        j_password: {
                            required: true,
                            maxlength: 30
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





