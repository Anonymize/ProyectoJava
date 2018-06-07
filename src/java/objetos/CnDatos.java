package objetos;

import java.sql.*;
import java.util.ArrayList;


public class CnDatos extends Conexion{
    Connection cn=null;
    
    private Connection Conectar(){
        try {
            return getConexion();
        } catch (Exception e) {}
        return null;
    }
    private void Desconectar(){
        try {
            cn.close();
        } catch (SQLException e) {}
    }
    
    public boolean ComprobarUsuario(String Usuario){
        try {
            cn=Conectar();
            PreparedStatement ps = cn.prepareStatement("SELECT User FROM usuarios WHERE User='" + Usuario+"'");
            ResultSet rs = ps.executeQuery();
            rs.next();
            if (rs.getString("User").equals(Usuario)) {
                Desconectar();
                return true;
            }else{
                Desconectar();
                return false;
            }
        } catch (SQLException e) {}
        Desconectar();
        return false;
    }
    
    public boolean ComprobarCorreo(String Correo){
        try {
            cn=Conectar();
            PreparedStatement ps = cn.prepareStatement("SELECT Correo FROM usuarios WHERE Correo='" + Correo+"'");
            ResultSet rs = ps.executeQuery();
            rs.next();
            if (rs.getString("Correo").equals(Correo)) {
                Desconectar();
                return true;
            }else{
                Desconectar();
                return false;
            }
        } catch (SQLException e) {}
        Desconectar();
        return false;
    }
    
    public boolean ComprobarUsuario(String Usuario, String ID){
        try {
            int Id = Integer.parseInt(ID);
            cn=Conectar();
            PreparedStatement ps = cn.prepareStatement("SELECT User FROM usuarios WHERE User='" + Usuario+"' and Id!="+Id);
            ResultSet rs = ps.executeQuery();
            rs.next();
            if (rs.getString("User").equals(Usuario)) {
                Desconectar();
                return true;
            }else{
                Desconectar();
                return false;
            }
        } catch (SQLException e) {}
        Desconectar();
        return false;
    }
    
    public boolean ComprobarCorreo(String Correo, String ID){
        try {
            int Id = Integer.parseInt(ID);
            cn=Conectar();
            PreparedStatement ps = cn.prepareStatement("SELECT Correo FROM usuarios WHERE Correo='" + Correo+"' and Id!="+Id);
            ResultSet rs = ps.executeQuery();
            rs.next();
            if (rs.getString("Correo").equals(Correo)) {
                Desconectar();
                return true;
            }else{
                Desconectar();
                return false;
            }
        } catch (SQLException e) {}
        Desconectar();
        return false;
    }
    
    public boolean ComprobarPassword(String Usuario,String Password){
        try {
            cn=Conectar();
            PreparedStatement ps = cn.prepareStatement("SELECT * FROM usuarios WHERE User='" + Usuario+"'");
            ResultSet rs = ps.executeQuery();
            rs.next();
            if (rs.getString("Pass").equals(Password)) {
                Desconectar();
                return true;
            }else{
                Desconectar();
                return false;
            }
        } catch (SQLException e) {}
        Desconectar();
        return false;
    }
    
    public Usuario RetornarUsuario(String Usuario) {
        try {
            cn = Conectar();
            PreparedStatement ps = cn.prepareStatement("SELECT * FROM usuarios WHERE User='"+Usuario+"'");
            ResultSet rs = ps.executeQuery();
            rs.next();
            Usuario Us = new Usuario(Integer.parseInt(rs.getString("Id")), rs.getString("User"), rs.getString("Pass"),
                     rs.getString("Name"), rs.getString("LastName"), rs.getString("Sexo"), rs.getString("Direccion"), rs.getString("Correo"));
            Desconectar();
            return Us;
        } catch (SQLException e) {
        }
        Desconectar();
        return null;
    }
    
    public Usuario RetornarUsuario(int Id) {
        try {
            cn = Conectar();
            PreparedStatement ps = cn.prepareStatement("SELECT * FROM usuarios WHERE Id='" + Id + "'");
            ResultSet rs = ps.executeQuery();
            rs.next();
            Usuario Us = new Usuario(Integer.parseInt(rs.getString("Id")), rs.getString("User"), rs.getString("Pass"),
                     rs.getString("Name"), rs.getString("LastName"), rs.getString("Sexo"), rs.getString("Direccion"), rs.getString("Correo"));
            Desconectar();
            return Us;
        } catch (SQLException e) {
        }
        Desconectar();
        return null;
    }
    
    public ArrayList<Usuario> RetornarUsuarios(){
        ArrayList<Usuario> Us =new ArrayList<>();
        
        try {
            cn=Conectar();
            PreparedStatement ps = cn.prepareStatement("SELECT * FROM usuarios");
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                Usuario usu = new Usuario(rs.getInt("Id"),rs.getString("User"),rs.getString("Pass"),rs.getString("Name"),rs.getString("LastName"),rs.getString("Sexo"),rs.getString("Direccion"),rs.getString("Correo"));
                Us.add(usu);
            }
            Desconectar();
            return Us;
        } catch (SQLException e) {}
        Desconectar();
        return null;
    }
    
    public void EliminarUsuario(int ID){
        try {
            cn=Conectar();
            Statement st = cn.createStatement();
            st.execute("DELETE FROM usuarios WHERE Id="+ID+";");
            Desconectar();
            return;
        } catch (SQLException e) {}
        Desconectar();
    }
    
    public boolean InsertarUsuario(String User,String Pass,String Name,String LastName,String Sexo,String Direccion,String Correo){
        try {
            cn=Conectar();
            String query = "INSERT INTO usuarios VALUES(null,?,?,?,?,?,?,?);";      
            PreparedStatement st = cn.prepareStatement(query);
            st.setString(1, User);
            st.setString(2, Pass);
            st.setString(3, Name);
            st.setString(4, LastName);
            st.setString(5, Sexo.equals("Masculino")?"M":"F");
            st.setString(6, Direccion);
            st.setString(7, Correo);
            st.executeUpdate();
            Desconectar();
            return true;
        } catch (SQLException e) {}
        Desconectar();
        return false;
    }
    
    public boolean ActualizarUsuario(String Id,String User,String Pass,String Name,String LastName,String Sexo,String Direccion,String Correo){
        try {
            cn=Conectar();          
            PreparedStatement ps = cn.prepareStatement("UPDATE usuarios SET User = ?, Pass = ?, Name = ?, LastName = ?, Sexo = ?, Direccion = ?, Correo = ? where Id=?");
            ps.setString(1, User);
            ps.setString(2, Pass);
            ps.setString(3, Name);
            ps.setString(4, LastName);
            ps.setString(5, Sexo.equals("Masculino")?"M":"F");
            ps.setString(6, Direccion);
            ps.setString(7, Correo);
            ps.setInt(8, Integer.parseInt(Id));
            ps.executeUpdate();
            
            Desconectar();
            return true;
        } catch (SQLException e) {}
        Desconectar();
        return false;
    }
}
