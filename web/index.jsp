<%-- 
    Document   : index
    Created on : 24-05-2018, 17:39:57
    Author     : Anonymize
--%>

<%@page import="objetos.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-escale=1.0">
        <link rel="stylesheet" href="css/Estilo.css">
        <link rel="stylesheet" href="css/bootstrap.css">
        <link rel="stylesheet" href="css/bootstrap-theme.min.css">
        <title>Login</title>
    </head>
    <body>
        <div class="container">
            <div class="row desp"></div>
            <div class="row">
                <div class="col-sm-6 col-sm-offset-3 col-md-4 col-md-offset-4 col-xs-8 col-xs-offset-2 login bg-info">
                    <div class="row">
                        <form id="formulario" method="POST" class="col-lg-12" action="Login">
                            <h1 class="text-primary">Login</h1>    
                            <div class="form-group">
                                <label>Usuario</label>
                                <input type="text" class="form-control" name="txtUser" placeholder="Ingrese un usuario">
                            </div>
                            <div class="form-group">
                                <label>Contraseña</label>
                                <input type="password" class="form-control" name="txtPass" placeholder="Contraseña">
                            </div>
                            <div class="row">
                                <div class="col-xs-12 col-sm-5">
                                    <button type="submit" class="btn btn-primary cienp">Logear</button>
                                </div>  
                                <div class="col-xs-12 col-sm-offset-2 col-sm-5">
                                    <button type="button" onclick="location.href='Registro.jsp'" class="btn btn-success cienp">Registrarse</button>
                                </div>   
                            </div> 
                            <br>
                        </form>
                    </div>
                    
                    <center>
                        <%
                            HttpSession ses = request.getSession();
                            Usuario usu = (Usuario) ses.getAttribute("usuario");
                            if (usu != null) {
                                request.getRequestDispatcher("listaUsuario.jsp").forward(request, response);
                            }
                            try {
                                String dato = request.getParameter("d");
                                switch (Integer.parseInt(dato)) {
                                    case 0:
                                        out.println("<p class=\"text-info\">No ha ingresado ningun dato</p>");
                                        break;
                                    case 1:
                                        out.println("<p class=\"text-info\">No ingresó un usuario</p>");
                                        break;
                                    case 2:
                                        out.println("<p class=\"text-info\">No ingresó una contraseña</p>");
                                        break;
                                    case 3:
                                        out.println("<p class=\"text-info\">Este usuario no existe</p>");
                                        break;
                                    case 4:
                                        out.println("<p class=\"text-info\">Contraseña incorrecta</p>");
                                        break;
                                    case 5:
                                        out.println("<p class=\"text-info\">Usuario creado correctamente</p>");
                                        break;
                                    case 6:
                                        out.println("<p class=\"text-info\">Se cerró la sesión correctamente</p>");
                                        break;
                                    case 7:
                                        out.println("<p class=\"text-info\">Usuario no reconocido</p>");
                                        break;
                                }
                            } catch (Exception e) {
                            }
                        %>
                    </center>
                </div>
            </div>
        </div>
        
    </body>
</html>
