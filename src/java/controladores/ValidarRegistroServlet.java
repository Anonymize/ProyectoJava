/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controladores;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import objetos.CnDatos;

/**
 *
 * @author Anonymize
 */
@WebServlet(name = "ValidarRegistroServlet", urlPatterns = {"/Register"})
public class ValidarRegistroServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String User = request.getParameter("txtUser");
            String Pass = request.getParameter("txtPass");
            String Pass2 = request.getParameter("txtPass2");
            String Name = request.getParameter("txtName");
            String LastName = request.getParameter("txtLastName");
            String Direccion = request.getParameter("txtDireccion");
            String Correo = request.getParameter("txtCorreo");
            String Sexo = request.getParameter("txtSexo");
            
            if (User.equals("")) {
                RedirE(request, response, 0, User, Name, LastName, Direccion, Correo, Sexo);
            } else if (Pass.equals("")) {
                RedirE(request, response, 1, User, Name, LastName, Direccion, Correo, Sexo);
            } else if (Pass2.equals("")) {
                RedirE(request, response, 2, User, Name, LastName, Direccion, Correo, Sexo);
            } else if (!Pass.equals(Pass2)) {
                RedirE(request, response, 3, User, Name, LastName, Direccion, Correo, Sexo);
            } else if (Name.equals("")) {
                RedirE(request, response, 4, User, Name, LastName, Direccion, Correo, Sexo);
            } else if (LastName.equals("")) {
                RedirE(request, response, 5, User, Name, LastName, Direccion, Correo, Sexo);
            } else if (Correo.equals("")) {
                RedirE(request, response, 6, User, Name, LastName, Direccion, Correo, Sexo);
            } else if (!validarEmail(Correo)) {
                RedirE(request, response, 7, User, Name, LastName, Direccion, Correo, Sexo);
            } else {
                CnDatos DB = new CnDatos();
                if (!DB.ComprobarUsuario(User)) {
                    if (!DB.ComprobarCorreo(Correo)) {
                        if (DB.InsertarUsuario(User, Pass, Name, LastName, Sexo, Direccion, Correo)) {
                            Redir(request,response,"index.jsp?d=5");
                        }else{
                            RedirE(request, response, 10, User, Name, LastName, Direccion, Correo, Sexo);
                        }
                    }else{
                        RedirE(request, response, 9, User, Name, LastName, Direccion, Correo, Sexo);
                    }
                }else{
                    RedirE(request, response, 8, User, Name, LastName, Direccion, Correo, Sexo);
                }
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    public boolean validarEmail(String email) {
        String PATTERN_EMAIL = "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";
        Pattern pattern = Pattern.compile(PATTERN_EMAIL);
        Matcher matcher = pattern.matcher(email);
        return matcher.matches();
    }

    public void RedirE(HttpServletRequest request,HttpServletResponse response,int Error,String User,String Name,String LastName,String Direccion,String Correo,String Sexo) throws ServletException, IOException{
            request.getRequestDispatcher("Registro.jsp?d="+Error+"&txtUser="+User+"&txtName="+Name+"&txtLastName="+LastName+"&txtDireccion="+Direccion+"&txtCorreo="+Correo+"&txtSexo="+Sexo).forward(request, response);
    }
    
    public void Redir(HttpServletRequest request,HttpServletResponse response,String cadena) throws ServletException, IOException{
            request.getRequestDispatcher(cadena).forward(request, response);
    }
    
}


