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
        <title>Lista Usuarios</title>
    </head>
    <body class="bbody">
        <%
            HttpSession ses = request.getSession();
            Usuario usu = (Usuario) ses.getAttribute("usuario");
            if (usu == null) {
                request.getRequestDispatcher("AccesoDenegado.jsp").forward(request, response);
            }
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
                        <h1 class="text-primary col-md-12">Lista de usuarios</h1>
                        <div class="text-primary col-md-12">
                            <div class="col-md-12 MiniM">                            
                                <table class="table table-bordered">
                                    <thead class="text-primary">
                                        <tr bgcolor= "#1C1C1C">
                                            <th scope="col">ID</th>
                                            <th scope="col">Usuario</th>
                                            <th scope="col">Nombre</th>
                                            <th scope="col">Apellidos</th>
                                            <th scope="col">Sexo</th>
                                            <th scope="col">Accion</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                            CnDatos DB = new CnDatos();
                                            ArrayList<Usuario> Usu = DB.RetornarUsuarios();
                                            for (int i = 0; i < Usu.size(); i++) {
                                                out.print("<tr bgcolor= \"#424242\" class=\"LetrasB\">");
                                                out.print("<th bgcolor= \"#2E2E2E\" scope=\"row\">" + Usu.get(i).getId() + "</th>");
                                                out.print("<td bgcolor= \"#2E2E2E\" >" + Usu.get(i).getUser() + "</td>");
                                                out.print("<td>" + Usu.get(i).getName() + "</td>");
                                                out.print("<td>" + Usu.get(i).getLastName() + "</td>");
                                                out.print("<td>" + (Usu.get(i).getSexo().equals("M") ? "Masculino" : "Femenimo") + "</td>");
                                                out.print("<td>");
                                                if (!Usu.get(i).getName().equals(usu.getName())) {
                                                    out.print("<a href=\"EliminarRegistro?txtID=" + Usu.get(i).getId() + "\">Eliminar</a>");
                                                    out.print("-");
                                                    out.print("<a href=\"ManejarDatos?txtID=" + Usu.get(i).getId() + "&link=VerDatos.jsp\">Ver</a>");
                                                    out.print("-");
                                                    out.print("<a href=\"ManejarDatos?txtID=" + Usu.get(i).getId() + "&link=EditarDatos.jsp\">Editar</a>");
                                                } else {
                                                    out.print("<a href=\"ManejarDatos?txtID=" + Usu.get(i).getId() + "&link=VerDatos.jsp\">Ver</a>");
                                                }
                                                out.print("</td>");
                                                out.print("</tr>");
                                            }
                                        %>
                                    </tbody>
                                </table>
                            </div>                            

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>