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
        <title>Registrar</title>
    </head>
    <body>
        <%String Name = (request.getParameter("txtName") == null) ? "" : (String) request.getParameter("txtName");%>
        <%String LastName = (request.getParameter("txtLastName") == null) ? "" : (String) request.getParameter("txtLastName");%>
        <%String User = (request.getParameter("txtUser") == null) ? "" : (String) request.getParameter("txtUser");%>
        <%String Correo = (request.getParameter("txtCorreo") == null) ? "" : (String) request.getParameter("txtCorreo");%>
        <%String Sexo = (request.getParameter("txtSexo") == null) ? "" : (String) request.getParameter("txtSexo");%>
        <%String Direccion = (request.getParameter("txtDireccion") == null) ? "" : (String) request.getParameter("txtDireccion");%>
        <%String CheckS = (Sexo.equals("Femenino")) ? "Checked" : "";%>
        <div class="container">
            <div class="row"></div>
            <div class="row">
                <div class="col-sm-6 col-sm-offset-3 col-md-4 col-md-offset-4 col-xs-8 col-xs-offset-2 login bg-info">
                    <div class="row">
                        <form id="formulario" method="POST" class="col-lg-12" action="Register">
                            <center><h1 class="text-primary">Registrar Usuario</h1></center>

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
                                                out.println("<h3 class=\"text-danger\">No ingresó un usuario</h3>");
                                                break;
                                            case 1:
                                                out.println("<h3 class=\"text-danger\">No ingresó una contraseña</h3>");
                                                break;
                                            case 2:
                                                out.println("<h3 class=\"text-danger\">Ingrese nuevamente la contraseña</h3>");
                                                break;
                                            case 3:
                                                out.println("<h3 class=\"text-danger\">Las contraseñas no coinciden</h3>");
                                                break;
                                            case 4:
                                                out.println("<h3 class=\"text-danger\">Ingrese un nombre</h3>");
                                                break;
                                            case 5:
                                                out.println("<h3 class=\"text-danger\">Ingrese sus apellidos</h3>");
                                                break;
                                            case 6:
                                                out.println("<h3 class=\"text-danger\">Ingrese su correo</h3>");
                                                break;
                                            case 7:
                                                out.println("<h3 class=\"text-danger\">El correo ingresado no es válido</h3>");
                                                break;
                                            case 8:
                                                out.println("<h3 class=\"text-danger\">Error al actualizar los datos</h3>");
                                                break;
                                        }
                                    } catch (Exception e) {
                                    }
                                %>
                            </center>


                            <div class="form-group">
                                <label>Usuario</label>
                                <input type="text" class="form-control" name="txtUser" placeholder="Ingrese un usuario" value="<%out.print(User);%>">
                            </div>
                            <div class="form-group">
                                <label>Contraseña</label>
                                <input type="password" class="form-control" name="txtPass" placeholder="Contraseña" value="">
                            </div>
                            <div class="form-group">
                                <label>Repita la contraseña</label>
                                <input type="password" class="form-control" name="txtPass2" placeholder="Contraseña" value="">
                            </div>
                            <div class="form-group">
                                <label>Nombre</label>
                                <input type="text" class="form-control" name="txtName" placeholder="Ingrese su nombre" value="<%out.print(Name);%>">
                            </div>
                            <div class="form-group">
                                <label>Apellidos</label>
                                <input type="text" class="form-control" name="txtLastName" placeholder="Ingrese sus apellidos" value="<%out.print(LastName);%>">
                            </div>
                            <div class="form-group">
                                <label>Direccion</label>
                                <input type="text" class="form-control" name="txtDireccion" placeholder="Ingrese su direccion" value="<%out.print(Direccion);%>">
                            </div>
                            <div class="form-group">
                                <label>Correo</label>
                                <input type="text" class="form-control" name="txtCorreo" placeholder="Ingrese su correo" value="<%out.print(Correo);%>">
                            </div>
                            <div class="form-group">
                                <label>Sexo</label>
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="txtSexo" id="Radio" value="Masculino" checked>
                                    <label class="form-check-label" for="Radio">
                                        Masculino
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="txtSexo" id="Radio2" value="Femenino" <%out.print(CheckS);%>>
                                    <label class="form-check-label" for="Radio2">
                                        Femenino
                                    </label>
                                </div>

                            </div>
                            <div class="row">
                                <div class="col-xs-12 col-sm-5">
                                    <button type="submit" class="btn btn-primary cienp">Registrarse</button>
                                </div>   
                            </div> 
                            <br>
                        </form>
                    </div>


                    <p class="col-md-12"></p><p class="col-md-12"></p>
                    <center class="col-md-4 col-md-offset-4"><a class="btn btn-info Link" href="index.jsp">Volver al inicio</a></center>
                    <p class="col-md-12"></p>

                </div>
            </div>
        </div>
        <br><br><br>
    </body>
</html>
