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
        <title>Editar</title>
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
                <div class="col-sm-12 login bg-info">
                    <!--<div class="col-sm-10 col-sm-offset-1 col-md-8 col-md-offset-2 col-xs-8 col-xs-offset-2 login bg-info">-->
                    <div class="row">
                        <h1 class="text-primary col-md-12">Editar usuario</h1>
                        <div class="text-primary col-md-12">                  
                            <div class="col-md-12 MiniM">                            
                                <form id="formulario" method="POST" class="col-lg-12" action="Actualizar">
                                    <table class="table table-bordered">
                                        <thead class="text-primary">
                                            <tr bgcolor= "#1C1C1C">
                                                <th scope="col" width="5%">ID</th>
                                                <th scope="col" width="15%">Usuario</th>
                                                <th scope="col" width="15%">Contraseña</th>
                                                <th scope="col" width="15%">Nombre</th>
                                                <th scope="col" width="15%">Apellidos</th>
                                                <th scope="col" width="5%">Sexo</th>
                                                <th scope="col" width="15%">Direccion</th>
                                                <th scope="col" width="15%">Correo</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                                CnDatos DB = new CnDatos();
                                                Usuario Usu = DB.RetornarUsuario(Integer.parseInt(ID));
                                                if(ses.getAttribute("Id2")!=null){ses.removeAttribute("Id2");}
                                                ses.setAttribute("Id2", ""+Usu.getId());
                                            %>
                                            <tr bgcolor= "#424242" class="LetrasB">
                                                <th scope="row"><%out.print(Usu.getId());%></th>
                                                <td><input type="text" class="form-control" name="txtUser" value="<%out.print(Usu.getUser());%>"></td>
                                                <td><input type="text" class="form-control" name="txtPass" value="<%out.print(Usu.getPass());%>"></td>
                                                <td><input type="text" class="form-control" name="txtName" value="<%out.print(Usu.getName());%>"></td>
                                                <td><input type="text" class="form-control" name="txtLastName" value="<%out.print(Usu.getLastName());%>"></td>
                                                <td>
                                                    <div class="form-check">
                                                        <input class="form-check-input" type="radio" name="txtSexo" id="Radio" value="Masculino" <%out.print((Usu.getSexo().equals("M"))?"Checked":"");%>>
                                                        <label class="form-check-label" for="Radio">
                                                            M
                                                        </label>
                                                    </div>
                                                    <div class="form-check">
                                                        <input class="form-check-input" type="radio" name="txtSexo" id="Radio2" value="Femenino" <%out.print((Usu.getSexo().equals("F"))?"Checked":"");%>>
                                                        <label class="form-check-label" for="Radio2">
                                                            F
                                                        </label>
                                                    </div>
                                                </td>
                                                <td><input type="text" class="form-control" name="txtDireccion" value="<%out.print(Usu.getDireccion());%>"></td>
                                                <td><input type="text" class="form-control" name="txtCorreo" value="<%out.print(Usu.getCorreo());%>"></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                <center><button type="submit" class="btn btn-primary">Guardar Cambios</button></center>            
                                </form>
                                <center>
                                <p class="col-md-12"></p><p class="col-md-12"></p>
                                    <%
                                    try {
                                        String dato = request.getParameter("d");
                                        switch (Integer.parseInt(dato)) {
                                            case 0:
                                                out.println("<h3 class=\"text-danger\">No puede ingresar un usuario vacio</h3>");
                                                break;
                                            case 1:
                                                out.println("<h3 class=\"text-danger\">No puede dejar la contraseña vacia</h3>");
                                                break;
                                            case 2:
                                                out.println("<h3 class=\"text-danger\">No puede ingresar un nombre vacio</h3>");
                                                break;
                                            case 3:
                                                out.println("<h3 class=\"text-danger\">No puede ingresar un apellido vacio</h3>");
                                                break;
                                            case 4:
                                                out.println("<h3 class=\"text-danger\">No puede ingresar un correo vacio</h3>");
                                                break;
                                            case 5:
                                                out.println("<h3 class=\"text-danger\">Formato de correo invalido</h3>");
                                                break;
                                            case 6:
                                                out.println("<h3 class=\"text-danger\">Este usuario ya existe</h3>");
                                                break;
                                            case 7:
                                                out.println("<h3 class=\"text-danger\">Este correo ya existe</h3>");
                                                break;
                                            case 8:
                                                out.println("<h3 class=\"text-danger\">Este usuario ya existe</h3>");
                                                break;
                                            case 9:
                                                out.println("<h3 class=\"text-danger\">Este correo ya esta registrado</h3>");
                                                break;
                                            case 10:
                                                out.println("<h3 class=\"text-danger\">Error Desconocido</h3>");
                                                break;
                                        }
                                    } catch (Exception e) {
                                    }
                                %>
                                
                                </center>
                                <p class="col-md-12"></p><p class="col-md-12"></p>
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