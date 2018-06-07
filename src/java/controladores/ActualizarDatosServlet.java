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
import javax.servlet.http.HttpSession;
import objetos.CnDatos;

/**
 *
 * @author Anonymize
 */
@WebServlet(name = "ActualizarDatosServlet", urlPatterns = {"/Actualizar"})
public class ActualizarDatosServlet extends HttpServlet {

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
            
            HttpSession ses = request.getSession();
            if(ses.getAttribute("Id2")==null){
                Redir(request,response,"listaUsuario.jsp");
            }
            
            String Id = (String)ses.getAttribute("Id2");
            String User = request.getParameter("txtUser");
            String Pass = request.getParameter("txtPass");
            String Name = request.getParameter("txtName");
            String LastName = request.getParameter("txtLastName");
            String Direccion = request.getParameter("txtDireccion");
            String Correo = request.getParameter("txtCorreo");
            String Sexo = request.getParameter("txtSexo");
            
            if (User.equals("")) {
                RedirE(request, response, 0, Id);
            } else if (Pass.equals("")) {
                RedirE(request, response, 1, Id);
            } else if (Name.equals("")) {
                RedirE(request, response, 2, Id);
            } else if (LastName.equals("")) {
                RedirE(request, response, 3, Id);
            } else if (Correo.equals("")) {
                RedirE(request, response, 4, Id);
            } else if (!validarEmail(Correo)) {
                RedirE(request, response, 5, Id);
            } else {
                CnDatos DB = new CnDatos();
                if (!DB.ComprobarUsuario(User,Id)) {
                    if (!DB.ComprobarCorreo(Correo,Id)) {
                        if (DB.ActualizarUsuario(Id,User, Pass, Name, LastName, Sexo, Direccion, Correo)) {
                            Redir(request,response,"listaUsuario.jsp");
                        }else{
                            RedirE(request, response, 8, Id);
                        }
                    }else{
                        RedirE(request, response, 7, Id);
                    }
                }else{
                    RedirE(request, response, 6, Id);
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

    public void RedirE(HttpServletRequest request,HttpServletResponse response,int Error,String Id) throws ServletException, IOException{
            HttpSession ses = request.getSession();
            ses.setAttribute("Id", Id);
            request.getRequestDispatcher("EditarDatos.jsp?d="+Error).forward(request, response);
    }
    
    public void Redir(HttpServletRequest request,HttpServletResponse response,String cadena) throws ServletException, IOException{
            request.getRequestDispatcher(cadena).forward(request, response);
    }
}
