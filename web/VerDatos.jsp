<%@page import="java.util.ArrayList"%>
<%@page import="objetos.CnDatos"%>
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
        <title>Informacion</title>
    </head>
    <body class="bbody">
        <%
            HttpSession ses = request.getSession();
            Usuario usu = (Usuario) ses.getAttribute("usuario");
            if (usu == null) {
                request.getRequestDispatcher("AccesoDenegado.jsp").forward(request, response);
            }
            if (ses.getAttribute("Id") == null) {
                request.getRequestDispatcher("listaUsuario.jsp").forward(request, response);
            }
            String ID = (String) ses.getAttribute("Id");
            ses.removeAttribute("Id");
        %>
        <div class="container">
            <div class="bg-success redondear">
                <div class="row">
                    <p class="col-md-3 col-md-offset-2 col-xs-offset-1 text-primary"><%out.print((usu.getSexo().equals("M") ? "Bienvenido " : "Bienvenida ") + usu.getName());%>!</p>
                </div>
                <div class="row">
                    <a class="col-md-2 col-md-offset-2 col-xs-offset-1 text-danger" href="Salir">Cerrar Sesión</a>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row desp"></div>
            <div class="row">
                <div class="col-sm-10 col-sm-offset-1 col-md-8 col-md-offset-2 col-xs-8 col-xs-offset-2 login bg-info">
                    <div class="row">
                        <h1 class="text-primary col-md-12">Informacion de usuario</h1>
                        <div class="text-primary col-md-12">                  
                            <div class="col-md-12 MiniM">                            
                                <table class="table table-bordered">
                                    <thead class="text-primary">
                                        <tr bgcolor= "#1C1C1C">
                                            <th scope="col">ID</th>
                                            <th scope="col">Usuario</th>
                                            <th scope="col">Contraseña</th>
                                            <th scope="col">Nombre</th>
                                            <th scope="col">Apellidos</th>
                                            <th scope="col">Sexo</th>
                                            <th scope="col">Direccion</th>
                                            <th scope="col">Correo</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                            CnDatos DB = new CnDatos();
                                            Usuario Usu = DB.RetornarUsuario(Integer.parseInt(ID));
                                            out.print("<tr bgcolor= \"#424242\" class=\"LetrasB\">");
                                            out.print("<th scope=\"row\">" + Usu.getId() + "</th>");
                                            out.print("<td>" + Usu.getUser() + "</td>");
                                            out.print("<td>" + Usu.getPass() + "</td>");
                                            out.print("<td>" + Usu.getName() + "</td>");
                                            out.print("<td>" + Usu.getLastName() + "</td>");
                                            out.print("<td>" + (Usu.getSexo().equals("M") ? "Masculino" : "Femenimo") + "</td>");
                                            out.print("<td>" + Usu.getDireccion() + "</td>");
                                            out.print("<td>" + Usu.getCorreo() + "</td>");
                                            out.print("</tr>");
                                        %>
                                    </tbody>
                                </table>
                                <p class="col-md-12"></p><p class="col-md-12"></p><p class="col-md-12"></p>
                                <center class="col-md-4 col-md-offset-4"><a class="btn btn-info Link" href="listaUsuario.jsp">Volver a la lista</a></center>
                                <p class="col-md-12"></p>
                            </div>                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>