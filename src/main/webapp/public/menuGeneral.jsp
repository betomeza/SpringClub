<%@page import="app.zelper.Constantes"%>
<%@page import="app.model.Persona"%>
<%

    Persona autenticado = (Persona)request.getSession().getAttribute(Constantes.SESSION_USUARIO);

%>
<div class="navbar navbar-inverse navbar-fixed-top">
      <div class="navbar-inner">
        <div class="container-fluid">
          <button type="button" class="btn btn-navbar collapsed" data-toggle="collapse" data-target=".nav-collapse">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="brand" href="#">Club App</a>
          
          <div class="nav-collapse collapse" style="height: 0px;">
            <p class="navbar-text pull-right">
              <%=autenticado.getFullName()%> <a href="<%=contextPath%>/j_spring_security_logout"> Salir </a> 

            </p>
            <!--<ul class="nav">
              <li class="active"><a href="#">Home</a></li>
              <li><a href="#about">About</a></li>
              <li><a href="#contact">Contact</a></li>
            </ul>-->
          </div>
        </div>
      </div>
    </div>